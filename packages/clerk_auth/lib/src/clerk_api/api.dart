import 'dart:async';
import 'dart:convert';
import 'dart:io' show File, HttpHeaders, HttpStatus;

import 'package:clerk_auth/src/clerk_api/token_cache.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:clerk_auth/src/clerk_constants.dart';
import 'package:clerk_auth/src/models/api/api_error.dart';
import 'package:clerk_auth/src/models/api/api_response.dart';
import 'package:clerk_auth/src/models/models.dart';
import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:http/http.dart' as http;

export 'package:clerk_auth/src/models/enums.dart' show SessionTokenPollMode;

/// [Api] manages communication with the Clerk frontend API
///
class Api with Logging {
  Api._(this._tokenCache, this._domain, this._httpService, this._pollMode);

  /// Create an [Api] object for a given Publishable Key, or return the existing one
  /// if such already exists for that key. Requires a [publishableKey]
  /// found in the Clerk dashboard for you account. Additional arguments:
  ///
  /// [persistor]: an optional instance of a [Persistor] which will keep track of
  /// tokens and expiry between app activations
  ///
  /// [client]: an optional instance of [HttpService] to manage low-level communications
  /// with the back end. Injected for e.g. test mocking
  ///
  /// [pollMode]: session token poll mode, default [SessionTokenPollMode.lazy],
  /// manages how to refresh the [sessionToken].
  ///
  factory Api({
    required String publishableKey,
    required Persistor persistor,
    required HttpService httpService,
    SessionTokenPollMode pollMode = SessionTokenPollMode.lazy,
  }) =>
      Api._(
        TokenCache(
          persistor: persistor,
          cacheId: publishableKey.hashCode,
        ),
        _deriveDomainFrom(publishableKey),
        httpService,
        pollMode,
      );

  final TokenCache _tokenCache;
  final String _domain;
  final HttpService _httpService;
  final SessionTokenPollMode _pollMode;
  Timer? _pollTimer;

  static const _scheme = 'https';
  static const _kJwtKey = 'jwt';
  static const _kIsNative = '_is_native';
  static const _kClerkSessionId = '_clerk_session_id';
  static const _kClerkJsVersion = '_clerk_js_version';
  static const _kErrorsKey = 'errors';
  static const _kClientKey = 'client';
  static const _kResponseKey = 'response';
  static const _kClerkAPIVersion = 'clerk-api-version';
  static const _kXFlutterSDKVersion = 'x-flutter-sdk-version';
  static const _kXMobile = 'x-mobile';
  static const _kOrganizationId = 'organization_id';

  static const _defaultPollDelay = Duration(seconds: 55);

  /// Initialise the API
  Future<void> initialize() async {
    await _tokenCache.initialize();
    if (_pollMode == SessionTokenPollMode.hungry) {
      await _pollForSessionToken();
    }
  }

  /// Dispose of the API
  void terminate() {
    _pollTimer?.cancel();
  }

  // environment & client

  /// the domain of the Clerk front-end API server
  ///
  String get domain => _domain;

  /// Returns the latest [Environment] from Clerk.
  ///
  Future<Environment> environment() async {
    final resp = await _fetch(path: '/environment', method: HttpMethod.get);
    if (resp.statusCode == HttpStatus.ok) {
      final body = json.decode(resp.body) as Map<String, dynamic>;
      return Environment.fromJson(body);
    }
    return Environment.empty;
  }

  Future<Client> _fetchClient({required HttpMethod method}) async {
    final resp = await _fetch(
      path: '/client',
      method: method,
      headers: _headers(method: method),
    );
    if (resp.statusCode == HttpStatus.ok) {
      final body = json.decode(resp.body) as Map<String, dynamic>;
      return Client.fromJson(body[_kResponseKey]);
    }
    return Client.empty;
  }

  /// Creates a new [Client] object to manage sessions
  Future<Client> createClient() async {
    if (_tokenCache.hasClientToken) {
      final client = await currentClient();
      if (client.isEmpty == false) return client;
    }

    return await _fetchClient(method: HttpMethod.post);
  }

  /// Gets a refreshed [Client] object from the back end
  Future<Client> currentClient() => _fetchClient(method: HttpMethod.get);

  // Sign out / delete user

  /// Deletes the [User] for the current [Session]
  Future<Client> deleteUser() async {
    await _delete('/me', requiresSessionId: true);
    return Client.empty;
  }

  /// Deletes the current [Client], thereby signing out all [Session]s
  Future<Client> signOut() async {
    await _delete('/client');
    return Client.empty;
  }

  Future<bool> _delete(String path, {bool requiresSessionId = false}) async {
    try {
      final headers = _headers(method: HttpMethod.delete);
      final resp = await _fetch(
        method: HttpMethod.delete,
        path: path,
        headers: headers,
        withSession: requiresSessionId,
      );
      if (resp.statusCode == 200) {
        _tokenCache.clear();
        return true;
      } else {
        logSevere('HTTP error on DELETE $path: ${resp.statusCode}', resp.body);
      }
    } catch (error, stacktrace) {
      logSevere('Error during DELETE $path', error, stacktrace);
    }

    return false;
  }

  // Sessions

  /// For a given [Session], activates the identified [Session]
  ///
  Future<ApiResponse> activate(Session session) async {
    return await _fetchApiResponse('/client/sessions/${session.id}/touch');
  }

  /// Signs out of a given [Session] (and removes it from the current [Client])
  ///
  Future<ApiResponse> signOutOf(Session session) async {
    return await _fetchApiResponse('/client/sessions/${session.id}/remove');
  }

  // Sign Up API

  /// Create a [SignUp] object on the current [Client], pre-populated with as
  /// much or as little information as available
  ///
  Future<ApiResponse> createSignUp({
    required Strategy strategy,
    String? username,
    String? firstName,
    String? lastName,
    String? password,
    String? emailAddress,
    String? phoneNumber,
    String? web3Wallet,
    String? code,
    String? token,
    Map<String, dynamic>? metadata,
  }) async {
    return await _fetchApiResponse(
      '/client/sign_ups',
      params: {
        'strategy': strategy,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'password': password,
        'email_address': emailAddress,
        'phone_number': phoneNumber,
        'web3_wallet': web3Wallet,
        'code': code,
        'token': token,
        if (metadata is Map) //
          'unsafe_metadata': json.encode(metadata!),
      },
    );
  }

  /// Update the current [SignUp] object with new/changed information
  ///
  Future<ApiResponse> updateSignUp(
    SignUp signUp, {
    Strategy? strategy,
    String? username,
    String? firstName,
    String? lastName,
    String? password,
    String? emailAddress,
    String? phoneNumber,
    String? web3Wallet,
    String? code,
    String? token,
    Map<String, dynamic>? metadata,
  }) async {
    return await _fetchApiResponse(
      '/client/sign_ups/${signUp.id}',
      method: HttpMethod.patch,
      params: {
        'strategy': strategy,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'password': password,
        'email_address': emailAddress,
        'phone_number': phoneNumber,
        'web3_wallet': web3Wallet,
        'code': code,
        'token': token,
        if (metadata is Map) //
          'unsafe_metadata': json.encode(metadata!),
      },
    );
  }

  /// Prepare a [SignUp] object for the verification phase
  ///
  Future<ApiResponse> prepareSignUp(
    SignUp signUp, {
    required Strategy strategy,
  }) async {
    return await _fetchApiResponse(
      '/client/sign_ups/${signUp.id}/prepare_verification',
      params: {
        'strategy': strategy,
      },
    );
  }

  /// Supply the code for a previously prepared a [SignUp]
  ///
  Future<ApiResponse> attemptSignUp(
    SignUp signUp, {
    required Strategy strategy,
    String? code,
    String? signature,
  }) async {
    assert(
      strategy.requiresSignature == false || signature is String,
      '`signature` required for strategy $strategy',
    );
    assert(
      strategy.requiresCode == false || code is String,
      '`code` required for strategy $strategy',
    );

    return await _fetchApiResponse(
      '/client/sign_ups/${signUp.id}/attempt_verification',
      params: {
        'strategy': strategy,
        'code': code,
      },
    );
  }

  // Sign In API

  /// Create a [SignIn] object
  ///
  /// If an [identifier] and [password] are supplied, even without a [strategy],
  /// then sign in will be attempted, and a [Session] created on the [Client] if
  /// successful
  ///
  Future<ApiResponse> createSignIn({
    Strategy? strategy,
    String? identifier,
    String? password,
    String? redirectUrl,
  }) async {
    return await _fetchApiResponse(
      '/client/sign_ins',
      params: {
        'strategy': strategy,
        'identifier': identifier,
        'password': password,
        'redirect_url': redirectUrl,
      },
    );
  }

  /// Prepare a [SignIn] object for the requirements of signing in via a given
  /// [strategy], be it first or second factor ([stage]=[Stage.first] or
  /// [stage]=[Stage.second])
  ///
  /// [redirectUrl] is required if [strategy]=[Strategy.emailLink]
  ///
  Future<ApiResponse> prepareSignIn(
    SignIn signIn, {
    required Stage stage,
    required Strategy strategy,
    String? redirectUrl,
  }) async {
    assert(
      strategy.requiresRedirect == false || redirectUrl is String,
      '`redirectUrl` required for strategy $strategy',
    );

    final factor = signIn.factorFor(strategy, stage);
    return await _fetchApiResponse(
      '/client/sign_ins/${signIn.id}/prepare_${stage}_factor',
      params: {
        'strategy': strategy,
        'email_address_id': factor.emailAddressId,
        'phone_number_id': factor.phoneNumberId,
        'web3_wallet_id': factor.web3WalletId,
        'passkey_id': factor.passkeyId,
        'redirect_url': redirectUrl,
      },
    );
  }

  /// Attempt a [SignIn] according to the [strategy].
  ///
  /// Certain strategies require specific parameters - for more details
  /// see https://clerk.com/docs/reference/frontend-api/tag/Sign-Ins
  ///
  Future<ApiResponse> attemptSignIn(
    SignIn signIn, {
    required Stage stage,
    required Strategy strategy,
    String? code,
    String? password,
    String? redirectUrl,
  }) async {
    assert(
      strategy.requiresRedirect == false || redirectUrl is String,
      '`redirectUrl` required for strategy $strategy',
    );
    assert(
      strategy.requiresPassword == false || password is String,
      '`password` required for strategy $strategy',
    );
    assert(
      strategy.requiresCode == false || code is String,
      '`code` required for strategy $strategy',
    );

    return await _fetchApiResponse(
      '/client/sign_ins/${signIn.id}/attempt_${stage}_factor',
      params: {
        'strategy': strategy,
        'code': code,
        'password': password,
        'redirect_url': redirectUrl,
      },
    );
  }

  // oAuth

  /// After signing in via oauth, transfer the [SignUp] into an authenticated [User]
  ///
  Future<ApiResponse> transfer() async {
    return await _fetchApiResponse(
      '/client/sign_ups',
      params: {'transfer': true},
    );
  }

  /// Send a token received from an oAuth provider to the back end
  ///
  Future<ApiResponse> sendOauthToken(
    SignIn signIn, {
    required Strategy strategy,
    required String token,
  }) async {
    return await _fetchApiResponse(
      '/client/sign_ins/${signIn.id}',
      method: HttpMethod.get,
      params: {
        'strategy': strategy,
        'rotating_token_nonce': token,
      },
    );
  }

  // User

  /// Refresh the details of the current [User]
  ///
  Future<ApiResponse> getUser() async {
    return await _fetchApiResponse(
      '/me',
      method: HttpMethod.get,
      withSession: true,
    );
  }

  /// Update details pertaining to the current [User]
  ///
  Future<ApiResponse> updateUser(User user, AuthConfig config) async {
    return await _fetchApiResponse(
      '/me',
      method: HttpMethod.patch,
      withSession: true,
      params: {
        if (config.allowsUsername) //
          'username': user.username,
        if (config.allowsFirstName) //
          'first_name': user.firstName,
        if (config.allowsLastName) //
          'last_name': user.lastName,
        'primary_email_address_id': user.primaryEmailAddressId,
        'primary_phone_number_id': user.primaryPhoneNumberId,
        'primary_web3_wallet_id': user.primaryWeb3WalletId,
        'unsafe_metadata':
            user.hasMetadata ? json.encode(user.userMetadata) : null,
      },
    );
  }

  /// Update the current [User]'s avatar
  ///
  Future<ApiResponse> updateAvatar(File file) async {
    try {
      final queryParams = _queryParams(HttpMethod.post, withSession: true);
      final uri = _uri('/me/profile_image', queryParams);
      final length = await file.length();
      final stream = http.ByteStream(file.openRead());
      final resp = await _httpService.sendByteStream(
        HttpMethod.post,
        uri,
        stream,
        length,
        _headers(),
      );
      return _processResponse(resp);
    } catch (error, stacktrace) {
      logSevere('Error during fetch', error, stacktrace);
      return ApiResponse.fatal(
        error: ApiError(message: error.toString()),
      );
    }
  }

  // Identifying Data

  /// Add some [UserIdentifyingData] to the current [User]
  ///
  Future<ApiResponse> addIdentifyingDataToCurrentUser(
    String identifier,
    IdentifierType type,
  ) async {
    return await _fetchApiResponse(
      '/me/${type.urlSegment}',
      withSession: true,
      params: {
        type.name: type.sanitize(identifier),
      },
    );
  }

  /// Prepare some [UserIdentifyingData] for verification
  ///
  Future<ApiResponse> prepareIdentifyingDataVerification(
    UserIdentifyingData identifier,
  ) async {
    return await _fetchApiResponse(
      '/me/${identifier.type.urlSegment}/${identifier.id}/prepare_verification',
      withSession: true,
      params: {
        'strategy': identifier.type.verificationStrategy,
      },
    );
  }

  /// Attempt to verify some [UserIdentifyingData] with a [code]
  ///
  Future<ApiResponse> verifyIdentifyingData(
    UserIdentifyingData identifier,
    String code,
  ) async {
    return await _fetchApiResponse(
      '/me/${identifier.type.urlSegment}/${identifier.id}/attempt_verification',
      withSession: true,
      params: {
        'code': code,
      },
    );
  }

  /// Delete some [UserIdentifyingData] from the current [User]
  ///
  Future<ApiResponse> deleteIdentifyingData(
    UserIdentifyingData identifier,
  ) async {
    return await _fetchApiResponse(
      '/me/${identifier.type.urlSegment}/${identifier.id}',
      withSession: true,
      method: HttpMethod.delete,
    );
  }

  // Session

  /// Return the [sessionToken] for the current active [Session], refreshing it
  /// if required
  ///
  Future<SessionToken?> sessionToken([Organization? org]) async {
    return _tokenCache.sessionTokenFor(org) ?? await _updateSessionToken(org);
  }

  Future<SessionToken?> _updateSessionToken([Organization? org]) async {
    if (_tokenCache.canRefreshSessionToken) {
      final resp = await _fetch(
        path: '/client/sessions/${_tokenCache.sessionId}/tokens',
        headers: _headers(),
        params: {
          if (org case Organization org) //
            _kOrganizationId: org.externalId,
        },
        nullableKeys: [_kOrganizationId],
      );
      if (resp.statusCode == HttpStatus.ok) {
        final body = json.decode(resp.body) as Map<String, dynamic>;
        final token = body[_kJwtKey] as String;
        return _tokenCache.makeAndCacheSessionToken(token);
      }
    }
    return null;
  }

  Future<void> _pollForSessionToken() async {
    _pollTimer?.cancel();

    final sessionToken = await _updateSessionToken();
    final delay = switch (sessionToken) {
      SessionToken sessionToken when sessionToken.isNotExpired =>
        sessionToken.expiry.difference(DateTime.timestamp()),
      _ => _defaultPollDelay,
    };
    _pollTimer = Timer(delay, _pollForSessionToken);
  }

  // Internal

  Future<ApiResponse> _fetchApiResponse(
    String url, {
    HttpMethod method = HttpMethod.post,
    Map<String, String>? headers,
    Map<String, dynamic>? params,

    /// for requests that require a `_client_session_id` query parameter,
    /// set this to true. see: https://clerk.com/docs/reference/frontend-api/tag/Email-Addresses#operation/createEmailAddresses
    bool withSession = false,
  }) async {
    try {
      final resp = await _fetch(
        method: method,
        path: url,
        params: params,
        headers: _headers(method: method, headers: headers),
        withSession: withSession,
      );

      return _processResponse(resp);
    } catch (error, stacktrace) {
      logSevere('Error during fetch', error, stacktrace);
      return ApiResponse.fatal(
        error: ApiError(message: error.toString()),
      );
    }
  }

  ApiResponse _processResponse(http.Response resp) {
    final body = json.decode(resp.body) as Map<String, dynamic>;
    final errors = body[_kErrorsKey] != null
        ? List<Map<String, dynamic>>.from(body[_kErrorsKey])
            .map(ApiError.fromJson)
            .toList()
        : null;
    final clientData = switch (body[_kClientKey]) {
      Map<String, dynamic> client when client.isNotEmpty => client,
      _ => body[_kResponseKey],
    };
    if (clientData case Map<String, dynamic> clientJson) {
      final client = Client.fromJson(clientJson);
      _tokenCache.updateFrom(resp, client.activeSession);
      return ApiResponse(
        client: client,
        status: resp.statusCode,
        errors: errors,
      );
    } else {
      logSevere(body);
      return ApiResponse(
        status: resp.statusCode,
        errors: errors,
      );
    }
  }

  Future<http.Response> _fetch({
    required String path,
    HttpMethod method = HttpMethod.post,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    bool withSession = false,
    List<String> nullableKeys = const [],
  }) async {
    final parsedParams = {...?params}..removeWhere(
        (key, value) => nullableKeys.contains(key) == false && value == null,
      );
    final queryParams =
        _queryParams(method, withSession: withSession, params: parsedParams);
    final uri = _uri(path, queryParams);

    final resp = await _httpService.send(
      method,
      uri,
      headers: headers,
      params: method.isNotGet ? parsedParams : null,
    );

    if (resp.statusCode == HttpStatus.tooManyRequests) {
      final delay = int.tryParse(resp.headers['retry-after'] ?? '') ?? 5;
      logSevere('Delaying ${delay}secs');
      await Future.delayed(Duration(seconds: delay));
      return await _fetch(
        path: path,
        method: method,
        headers: headers,
        params: params,
        withSession: withSession,
      );
    }

    return resp;
  }

  Map<String, dynamic> _queryParams(
    HttpMethod method, {
    bool withSession = false,
    Map<String, dynamic>? params,
  }) =>
      {
        _kIsNative: true,
        _kClerkJsVersion: ClerkConstants.jsVersion,
        if (withSession) //
          _kClerkSessionId: _tokenCache.sessionId,
        if (method.isGet) //
          ...?params,
      };

  Uri _uri(String path, Map<String, dynamic> params) {
    return Uri(
      scheme: _scheme,
      host: _domain,
      path: 'v1$path',
      queryParameters: params.toStringMap(),
    );
  }

  Map<String, String> _headers({
    HttpMethod method = HttpMethod.post,
    Map<String, String>? headers,
  }) {
    return {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: method.isGet
          ? 'application/json'
          : 'application/x-www-form-urlencoded',
      if (_tokenCache.clientToken.isNotEmpty) //
        HttpHeaders.authorizationHeader: _tokenCache.clientToken,
      _kClerkAPIVersion: ClerkConstants.clerkApiVersion,
      _kXFlutterSDKVersion: ClerkConstants.flutterSdkVersion,
      _kXMobile: '1',
      ...?headers,
    };
  }

  static String _deriveDomainFrom(String key) {
    final domainStartPosition = key.lastIndexOf('_') + 1;
    if (domainStartPosition < 1) {
      throw const FormatException('Publishable Key not in correct format');
    }

    final domainPart = key.substring(domainStartPosition);
    final domain = domainPart.b64decoded;
    return domain.split('\$').first;
  }
}
