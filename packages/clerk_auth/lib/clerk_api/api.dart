import 'dart:async';
import 'dart:convert';
import 'dart:io' show HttpStatus, HttpHeaders;

import 'package:common/common.dart';
import 'package:http/http.dart' as http;

import 'models/models.dart';
import 'token_cache.dart';

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete;

  bool get isGet => this == get;
  bool get isNotGet => isGet == false;

  @override
  String toString() => name.toUpperCase();
}

class Api with Logging {
  Api._({required this.tokenCache, required this.domain});

  factory Api({
    required String publishableKey,
    required String publicKey,
  }) =>
      _instance ??= Api._(
        tokenCache: TokenCache(publicKey),
        domain: deriveDomainFrom(publishableKey),
      );

  final TokenCache tokenCache;
  final String domain;

  static final _client = http.Client();
  static Api? _instance;

  static const _scheme = 'https';
  static const _kJwtKey = 'jwt';
  static const _kIsNative = '_is_native';
  static const _kClerkJsVersion = '_clerk_js_version';
  static const _vClerkJsVersion = '4.70.0';

  // Sign out

  Future<void> signOut() async {
    try {
      final headers = _headers(HttpMethod.delete);
      final resp = await _fetch(method: HttpMethod.delete, path: '/client', headers: headers);
      if (resp.statusCode == 200) {
        tokenCache.clear();
      } else {
        logSevere('HTTP error on sign out: ${resp.statusCode}');
        logSevere(resp);
      }
    } catch (error, stacktrace) {
      logSevere('Error during sign out', error, stacktrace);
    }
  }

  // Sign Up API

  Future<ApiResponse> createSignUp() => _fetchApiResponse('/client/sign_ups');

  // Sign In API

  Future<ApiResponse> createSignIn({
    required String identifier,
  }) async =>
      _fetchApiResponse(
        '/client/sign_ins',
        params: {'identifier': identifier},
      );

  Future<ApiResponse> prepareVerification(
    SignIn signIn, {
    required FactorStage stage,
    required Strategy strategy,
    String? redirectUrl,
  }) async {
    final factor = signIn.factorFor(strategy, stage);
    if (factor is! Factor) {
      return ApiResponse(status: HttpStatus.badRequest);
    }

    return _fetchApiResponse(
      '/client/sign_ins/${signIn.id}/prepare_${stage}_factor',
      params: {
        'strategy': strategy,
        if (factor.emailAddressId?.isNotEmpty == true) //
          'email_address_id': factor.emailAddressId,
        if (factor.phoneNumberId?.isNotEmpty == true) //
          'phone_number_id': factor.phoneNumberId,
        if (redirectUrl?.isNotEmpty == true) //
          'redirect_url': redirectUrl,
      },
    );
  }

  Future<ApiResponse> attemptVerification(
    SignIn signIn, {
    required FactorStage stage,
    required Strategy strategy,
    String? code,
    String? password,
  }) async {
    final factor = signIn.factorFor(strategy, stage);
    if (factor is! Factor) {
      return ApiResponse(status: HttpStatus.badRequest);
    }

    return _fetchApiResponse(
      '/client/sign_ins/${signIn.id}/attempt_${stage}_factor',
      params: {
        'strategy': strategy,
        if (code is String) //
          'code': code,
        if (password is String) //
          'password': password,
      },
    );
  }

  // Session

  Future<String> sessionToken() async {
    if (tokenCache.sessionToken.isEmpty && tokenCache.canRefreshSessionToken) {
      final resp = await _fetch(path: '/client/sessions/${tokenCache.sessionId}/tokens');
      if (resp.statusCode == HttpStatus.ok) {
        final body = jsonDecode(resp.body) as Map<String, dynamic>;
        tokenCache.sessionToken = body[_kJwtKey] as String;
      }
    }
    return tokenCache.sessionToken;
  }

  // Internal

  Future<ApiResponse> _fetchApiResponse(
    String url, {
    HttpMethod method = HttpMethod.post,
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  }) async {
    try {
      headers = _headers(method, headers);
      final resp = await _fetch(method: method, path: url, params: params, headers: headers);

      final body = json.decode(resp.body) as Map<String, dynamic>;
      if (body['client'] case Map<String, dynamic> clientJson) {
        switch (resp.statusCode) {
          case 200:
            final client = Client.fromJson(clientJson);
            final response = ApiResponse(client: client, status: resp.statusCode);
            tokenCache.updateFrom(resp, client.activeSession);
            return response;

          case 422: // Clerk-handled error
            logSevere(body.toString());
            final client = Client.fromJson(clientJson);
            return ApiResponse(client: client, status: resp.statusCode);

          default:
            logSevere(body.toString());
            return ApiResponse(status: resp.statusCode);
        }
      } else {
        logSevere('No client json received');
        // logSevere(body);
        return ApiResponse(status: HttpStatus.noContent, errorDetail: 'No data received');
      }
    } catch (error, stacktrace) {
      logSevere('Error during fetch', error, stacktrace);
      return ApiResponse(status: HttpStatus.internalServerError, errorDetail: error.toString());
    }
  }

  Future<http.Response> _fetch({
    required String path,
    HttpMethod method = HttpMethod.post,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  }) async {
    final queryParams = {
      _kIsNative: true,
      _kClerkJsVersion: _vClerkJsVersion,
      if (method.isGet && params is Map<String, dynamic>) //
        ...params,
    };
    final body = method.isNotGet ? params : null;
    final uri = _uri(path, queryParams);
    return await _client.sendHttpRequest(method, uri, body: body, headers: headers);
  }

  Uri _uri(String path, Map<String, dynamic> params) =>
      Uri(scheme: _scheme, host: domain, path: 'v1$path', queryParameters: params.toStringMap());

  Map<String, String> _headers(HttpMethod method, [Map<String, String>? headers]) => {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader:
            method.isGet ? 'application/json' : 'application/x-www-form-urlencoded',
        if (tokenCache.clientToken.isNotEmpty) //
          HttpHeaders.authorizationHeader: tokenCache.clientToken,
        if (headers is Map<String, String>) //
          ...headers,
      };

  static String deriveDomainFrom(String key) {
    final underscoreIndex = key.lastIndexOf('_') + 1;
    if (underscoreIndex < 1) {
      throw FormatException('Public key not in correct format');
    }

    final paddingIndex = key.indexOf('=', underscoreIndex);
    String encodedPart = key.substring(underscoreIndex, paddingIndex > 0 ? paddingIndex : null);
    final overBy = encodedPart.length % 4;
    if (overBy > 0) {
      encodedPart = encodedPart.padRight(encodedPart.length + 4 - overBy, '=');
    }
    final encodedDomain = utf8.decode(base64.decode(encodedPart));
    return encodedDomain.split('\$').first;
  }
}

extension SendExtension on http.Client {
  Future<http.Response> sendHttpRequest(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final request = http.Request(method.toString(), uri);
    if (headers != null) {
      request.headers.addAll(headers);
    }
    if (body != null) {
      request.bodyFields = body.toStringMap();
    }
    final streamedResponse = await request.send();
    return http.Response.fromStream(streamedResponse);
  }
}

extension StringMapExtension on Map {
  Map<String, String> toStringMap() => map((k, v) => MapEntry(k.toString(), v.toString()));
}
