import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

import 'models/models.dart';
import 'token_cache.dart';

const _defaultTimeout = Duration(seconds: 3);

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete;

  bool get isGet => this == get;
}

class ClerkApi {
  static const _kJwtKey = 'jwt';

  static final _client = HttpClient();
  static ClerkApi? _instance;

  ClerkApi._({required this.tokenCache, required this.domain});

  factory ClerkApi({
    required String publishableKey,
    required String publicKey,
  }) =>
      _instance ??= ClerkApi._(
        tokenCache: TokenCache(publicKey),
        domain: _deriveDomainFrom(publishableKey),
      );

  final TokenCache tokenCache;
  final String domain;

  final logger = Logger();

  // Sign out

  Future<void> signOut() async {
    await _fetchApiResponse("/client", method: HttpMethod.delete);
    tokenCache.clear();
  }

  // Sign Up API

  Future<ApiResponse> createSignUp() async => _fetchApiResponse("/client/sign_ups");

  // Sign In API

  Future<ApiResponse> createSignIn({
    required String identifier,
  }) async =>
      _fetchApiResponse(
        "/client/sign_ins",
        params: {"identifier": identifier},
      );

  Future<ApiResponse> prepareVerification({
    required String id,
    required String stage,
    required Strategy strategy,
    String? emailAddressId,
    String? phoneNumberId,
  }) async {
    assert(const ["first", "second"].contains(stage), "Stage must be 'first' or 'second'");
    return _fetchApiResponse(
      "/client/sign_ins/$id/prepare_${stage}_factor",
      params: {
        "strategy": strategy,
        if (emailAddressId?.isNotEmpty == true) "email_address_id": emailAddressId,
        if (phoneNumberId?.isNotEmpty == true) "phone_number_id": phoneNumberId,
      },
    );
  }

  Future<ApiResponse> attemptVerification({
    required String id,
    required String factor,
    required Strategy strategy,
    String? code,
    String? password,
  }) async {
    assert(const ["first", "second"].contains(factor), "Factor must be 'first' or 'second'");
    return _fetchApiResponse(
      "/client/sign_ins/$id/attempt_${factor}_factor",
      params: {
        "strategy": strategy,
        if (code is String) "code": code,
        if (password is String) "password": password,
      },
    );
  }

  // Session

  Future<String> sessionToken() async {
    if (tokenCache.sessionToken.isEmpty && tokenCache.canRefreshSessionToken) {
      final resp = await _fetch(url: "/client/sessions/${tokenCache.sessionId}/tokens");
      if (resp.statusCode == HttpStatus.ok) {
        final result = await _body(resp);
        final body = jsonDecode(result) as Map<String, dynamic>;
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
    Duration timeout = _defaultTimeout,
  }) async {
    try {
      _client.connectionTimeout = timeout;

      final resp = await _fetch(
        method: method,
        url: url,
        params: params,
        headers: _headersFrom(params, headers),
      );

      logger.i("STATUS: ${resp.statusCode}");

      final result = await _body(resp);
      final body = jsonDecode(result) as Map<String, dynamic>;
      switch (resp.statusCode) {
        case 200:
          final client = Client.fromJson(body);
          final response = ApiResponse(client: client, status: resp.statusCode);
          tokenCache.updateFrom(resp, client.activeSession);
          return response;

        case 422: // Clerk-handled error
          logger.e(body.toString());
          final client = Client.fromJson(body);
          return ApiResponse(client: client, status: resp.statusCode);

        default:
          logger.e(body.toString());
          return ApiResponse(status: resp.statusCode);
      }
    } catch (error) {
      logger.e("$error");
      return ApiResponse(status: HttpStatus.internalServerError, errorDetail: error.toString());
    }
  }

  Future<HttpClientResponse> _fetch({
    required String url,
    HttpMethod method = HttpMethod.post,
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  }) async {
    final query = params.isNotEmpty ? "&${params.entries.map(_queryParamFrom).join("&")}" : "";
    final uri = Uri.parse("https://$domain/v1$url?_is_native=true$query");
    final req = await _client.openUrl(method.name, uri);
    for (final entry in headers.entries) {
      req.headers.add(entry.key, entry.value);
    }
    final token = tokenCache.clientToken;
    if (token.isNotEmpty) {
      req.headers.add(HttpHeaders.authorizationHeader, token);
    }

    return req.close();
  }

  String _queryParamFrom(MapEntry e) => "${e.key}=${Uri.encodeComponent(e.value.toString())}";

  Map<String, String> _headersFrom(
    Map<String, dynamic> params,
    Map<String, String> headers,
  ) =>
      {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.contentTypeHeader:
            params.isNotEmpty ? "application/x-www-form-urlencoded" : "application/json",
        ...headers,
      };

  Future<String> _body(HttpClientResponse resp) {
    final completer = Completer<String>();
    final contents = StringBuffer();
    resp.transform(utf8.decoder).listen(
          contents.write,
          onDone: () => completer.complete(contents.toString()),
        );
    return completer.future;
  }

  static String _deriveDomainFrom(String key) {
    final encodedPart = key.substring(key.lastIndexOf("_") + 1);
    final encodedDomain = encodedPart.substring(0, encodedPart.length - (encodedPart.length % 4));
    return utf8.decode(base64.decode(encodedDomain));
  }
}
