import 'dart:async';
import 'dart:convert';
import 'dart:io' show HttpStatus, HttpHeaders;

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'models/models.dart';
import 'token_cache.dart';

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete;

  bool get isGet => this == get;
}

class Api {
  static const _kJwtKey = 'jwt';

  static final _client = http.Client();
  static Api? _instance;

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
      final resp = await _fetch(
        method: method,
        url: url,
        params: params,
        headers: _headersFrom(params, headers),
      );

      logger.i("STATUS: ${resp.statusCode}");

      final body = json.decode(resp.body) as Map<String, dynamic>;
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

  Future<http.Response> _fetch({
    required String url,
    HttpMethod method = HttpMethod.post,
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  }) async {
    final query = params.isNotEmpty ? "&${params.entries.map(_queryParamFrom).join("&")}" : "";
    final uri = Uri.parse("https://$domain/v1$url?_is_native=true$query");
    return await _client.sendHttpRequest(method, uri, headers: headers);
  }

  String _queryParamFrom(MapEntry e) => "${e.key}=${Uri.encodeComponent(e.value.toString())}";

  Map<String, String> _headersFrom(
    Map<String, dynamic> params,
    Map<String, String> headers,
  ) =>
      {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader:
            params.isNotEmpty ? 'application/x-www-form-urlencoded' : 'application/json',
        ...headers,
      };

  static String deriveDomainFrom(String key) {
    final underscoreIndex = key.lastIndexOf("_");
    if (underscoreIndex < 0) {
      throw FormatException('Public key not in correct format');
    }

    final encodedPart = key.substring(key.lastIndexOf("_") + 1);
    final encodedDomain = encodedPart.substring(0, encodedPart.length - (encodedPart.length % 4));
    return utf8.decode(base64.decode(encodedDomain));
  }
}

extension SendExtension on http.Client {
  Future<http.Response> sendHttpRequest(
    HttpMethod method,
    Uri uri, {
    Map<String, String> headers = const {},
  }) async {
    final request = http.Request(method.name.toUpperCase(), uri)..headers.addAll(headers);
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    return response;
  }
}
