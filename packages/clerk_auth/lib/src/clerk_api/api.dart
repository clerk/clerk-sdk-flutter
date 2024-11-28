import 'dart:async';
import 'dart:convert';
import 'dart:io' show HttpStatus, HttpHeaders;

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_auth/src/clerk_api/token_cache.dart';
import 'package:http/http.dart' as http;

export 'package:clerk_auth/src/models/models.dart';

/// [SessionTokenPollMode] manages how to refresh the [sessionToken]
///
enum SessionTokenPollMode {
  /// Refresh whenever token expires (more http access and power use)
  regular,

  /// Refresh if expired when accessed (with possible increased latency at that time)
  onDemand;
}

/// [Api] manages communication with the Clerk frontend API
///
class Api with Logging {
  Api._(this._tokenCache, this._domain, this._client, this._pollMode);

  /// Create an [Api] object for a given public key, or return the existing one
  /// if such already exists for that key. Requires a [publicKey] and [publishableKey]
  /// found in the Clerk dashboard for you account. Additional arguments:
  ///
  /// [persistor]: an optional instance of a [Persistor] which will keep track of
  /// tokens and expiry between app activations
  ///
  /// [client]: an optional instance of [HttpClient] to manage low-level communications
  /// with the back end. Injected for e.g. test mocking
  ///
  /// [pollMode]: session token poll mode, default on-demand,
  /// manages how to refresh the [sessionToken].
  ///
  factory Api({
    required String publishableKey,
    required String publicKey,
    Persistor persistor = Persistor.none,
    SessionTokenPollMode pollMode = SessionTokenPollMode.onDemand,
    HttpClient? client,
  }) =>
      _caches[publicKey] ??= Api._(
        TokenCache(publicKey, persistor),
        _deriveDomainFrom(publishableKey),
        client ?? const DefaultHttpClient(),
        pollMode,
      );

  final TokenCache _tokenCache;
  final String _domain;
  final HttpClient _client;
  final SessionTokenPollMode _pollMode;
  Timer? _pollTimer;

  static final _caches = <String, Api>{};

  static const _scheme = 'https';
  static const _kJwtKey = 'jwt';
  static const _kIsNative = '_is_native';
  static const _kClerkSessionId = '_clerk_session_id';
  static const _kClerkJsVersion = '_clerk_js_version';
  static const _kErrorsKey = 'errors';
  static const _kClientKey = 'client';
  static const _kResponseKey = 'response';

  /// Initialise the API
  Future<void> initialize() async {
    await _tokenCache.initialize();
    if (_pollMode == SessionTokenPollMode.regular) {
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
      headers: _headers(method),
    );
    if (resp.statusCode == HttpStatus.ok) {
      final body = json.decode(resp.body) as Map<String, dynamic>;
      return Client.fromJson(body[_kResponseKey]);
    }
    return Client.empty;
  }

  /// Creates a new [Client] object to manage sessions
  Future<Client> createClient() => _fetchClient(method: HttpMethod.post);

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
      final headers = _headers(HttpMethod.delete);
      final resp = await _fetch(
        method: HttpMethod.delete,
        path: path,
        headers: headers,
        requiresSessionId: requiresSessionId,
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
  Future<ApiResponse> activate(Session session) =>
      _fetchApiResponse('/client/sessions/${session.id}/touch');

  /// Signs out of a given [Session] (and removes it from the current [Client])
  ///
  Future<ApiResponse> signOutOf(Session session) =>
      _fetchApiResponse('/client/sessions/${session.id}/remove');

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
  }) {
    return _fetchApiResponse(
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
          'unsafe_metadata': jsonEncode(metadata!),
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
  }) {
    return _fetchApiResponse(
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
          'unsafe_metadata': jsonEncode(metadata!),
      },
    );
  }

  /// Prepare a [SignUp] object for the verification phase
  ///
  Future<ApiResponse> prepareSignUp(
    SignUp signUp, {
    required Strategy strategy,
  }) async {
    return _fetchApiResponse(
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

    return _fetchApiResponse(
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
    return _fetchApiResponse(
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
    return _fetchApiResponse(
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

    return _fetchApiResponse(
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
  Future<ApiResponse> transfer() =>
      _fetchApiResponse('/client/sign_ups', params: {'transfer': true});

  /// Send a token received from an oAuth provider to the back end
  ///
  Future<ApiResponse> sendOauthToken(
    SignIn signIn, {
    required Strategy strategy,
    required String token,
  }) async {
    return _fetchApiResponse(
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
    return _fetchApiResponse(
      '/me',
      method: HttpMethod.get,
      requiresSessionId: true,
    );
  }

  /// Update details pertaining to the current [User]
  ///
  Future<ApiResponse> updateUser(User user) async {
    return _fetchApiResponse(
      '/me',
      method: HttpMethod.patch,
      requiresSessionId: true,
      params: {
        'first_name': user.firstName,
        'last_name': user.lastName,
        'primary_email_address_id': user.primaryEmailAddressId,
        'primary_phone_number_id': user.primaryPhoneNumberId,
        'primary_web3_wallet_id': user.primaryWeb3WalletId,
      },
    );
  }

  // Email

  /// Add an [EmailAddress] to the current [User]
  ///
  Future<ApiResponse> addEmailAddressToCurrentUser(String emailAddress) async {
    return _fetchApiResponse(
      '/me/email_addresses',
      requiresSessionId: true,
      params: {
        'email_address': emailAddress,
      },
    );
  }

  /// Delete an [EmailAddress] from the current [User]
  ///
  Future<ApiResponse> deleteEmailAddress(Email email) async {
    return _fetchApiResponse(
      '/me/email_addresses/${email.id}',
      requiresSessionId: true,
      method: HttpMethod.delete,
    );
  }

  // Phone Number

  /// Add a [PhoneNumber] to the current [User]
  ///
  Future<ApiResponse> addPhoneNumberToCurrentUser(String phoneNumber) async {
    return _fetchApiResponse(
      '/me/phone_numbers',
      requiresSessionId: true,
      params: {
        'phone_number': phoneNumber,
      },
    );
  }

  /// Delete a [PhoneNumber] from the current [User]
  ///
  Future<ApiResponse> deletePhoneNumber(PhoneNumber number) async {
    return _fetchApiResponse(
      '/me/phone_numbers/${number.id}',
      requiresSessionId: true,
      method: HttpMethod.delete,
    );
  }

  // Session

  /// Return the [sessionToken] for the current active [Session], refreshing it
  /// if required
  ///
  Future<String> sessionToken() async {
    if (_tokenCache.sessionToken.isEmpty &&
        _tokenCache.canRefreshSessionToken) {
      final resp = await _fetch(
          path: '/client/sessions/${_tokenCache.sessionId}/tokens');
      if (resp.statusCode == HttpStatus.ok) {
        final body = jsonDecode(resp.body) as Map<String, dynamic>;
        _tokenCache.sessionToken = body[_kJwtKey] as String;
      }
    }
    return _tokenCache.sessionToken;
  }

  Future<void> _pollForSessionToken() async {
    _pollTimer?.cancel();

    await sessionToken(); // make sure updated

    final diff = _tokenCache.sessionTokenExpiry.difference(DateTime.timestamp());
    final delay = diff.isNegative ? const Duration(seconds: 55) : diff;
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
    bool requiresSessionId = false,
  }) async {
    try {
      final fullHeaders = _headers(method, headers);
      final resp = await _fetch(
        method: method,
        path: url,
        params: params,
        headers: fullHeaders,
        requiresSessionId: requiresSessionId,
      );

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
            client: client, status: resp.statusCode, errors: errors);
      } else {
        logSevere(body);
        return ApiResponse(status: resp.statusCode, errors: errors);
      }
    } catch (error, stacktrace) {
      logSevere('Error during fetch', error, stacktrace);
      return ApiResponse(
        status: HttpStatus.internalServerError,
        errors: [ApiError(message: error.toString())],
      );
    }
  }

  Future<http.Response> _fetch({
    required String path,
    HttpMethod method = HttpMethod.post,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    bool requiresSessionId = false,
  }) async {
    params?.removeWhere((key, value) => value == null);
    final queryParams = {
      _kIsNative: true,
      _kClerkJsVersion: Auth.jsVersion,
      if (requiresSessionId) //
        _kClerkSessionId: _tokenCache.sessionId,
      if (method.isGet) //
        ...?params,
    };
    final body = method.isNotGet ? params : null;
    final uri = _uri(path, queryParams);

    final resp = await _client.send(method, uri, headers, body);

    if (resp.statusCode == HttpStatus.tooManyRequests) {
      final delay = int.tryParse(resp.headers['retry-after'] ?? '') ?? 5;
      logSevere('Delaying ${delay}secs');
      await Future.delayed(Duration(seconds: delay));
      return _fetch(
        path: path,
        method: method,
        headers: headers,
        params: params,
        requiresSessionId: requiresSessionId,
      );
    }

    return resp;
  }

  Uri _uri(String path, Map<String, dynamic> params) => Uri(
      scheme: _scheme,
      host: _domain,
      path: 'v1$path',
      queryParameters: params.toStringMap());

  Map<String, String> _headers(HttpMethod method,
      [Map<String, String>? headers]) {
    return {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: method.isGet
          ? 'application/json'
          : 'application/x-www-form-urlencoded',
      if (_tokenCache.clientToken.isNotEmpty) //
        HttpHeaders.authorizationHeader: _tokenCache.clientToken,
      ...?headers,
    };
  }

  static String _deriveDomainFrom(String key) {
    final domainStartPosition = key.lastIndexOf('_') + 1;
    if (domainStartPosition < 1) {
      throw const FormatException('Public key not in correct format');
    }

    // base64 requires quad-byte aligned strings, but the string that comes from Clerk
    // isn't. This removes Clerk's padding, adds our own to the correct length,
    // decodes the string and then removes unnecessary trailing characters.
    // It's messy, and should be improved. I've probably missed something obvious.
    final domainPart = key.substring(domainStartPosition);
    final encodedPart =
        domainPart.padRight(((domainPart.length - 1) ~/ 4) * 4 + 4, '=');
    final encodedDomain = utf8.decode(base64.decode(encodedPart));
    return encodedDomain.split('\$').first;
  }
}
