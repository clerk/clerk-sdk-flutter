import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'models/models.dart';

class TokenCache {
  static const _tokenExpiryBuffer = Duration(seconds: 10);

  TokenCache(String publicKey) : publicKey = RSAPublicKey(publicKey);

  final RSAPublicKey publicKey;
  final logger = Logger();

  bool get canRefreshSessionToken => clientToken.isNotEmpty && sessionId.isNotEmpty;

  String sessionId = "";

  void clear() {
    sessionId = "";
    _clientToken = "";
    _sessionToken = "";
    _sessionTokenExpiry = DateTime.fromMillisecondsSinceEpoch(0);
  }

  String get clientToken => _clientToken;

  set clientToken(String token) {
    if (token == _clientToken) return;

    try {
      JWT.verify(token, publicKey);
      _clientToken = token;
    } catch (ex) {
      logger.e("ERROR SETTING CLIENT TOKEN: $ex");
    }
  }

  String get sessionToken {
    if (_sessionTokenHasExpired) _sessionToken = "";
    return _sessionToken;
  }

  set sessionToken(String token) {
    if (token == _sessionToken) return;

    try {
      final jwt = JWT.verify(token, publicKey);
      final exp = jwt.payload["exp"];
      if (exp is int) {
        final expiry = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
        _sessionTokenExpiry = expiry.subtract(_tokenExpiryBuffer);
        _sessionToken = token;
      }
    } catch (ex) {
      logger.e("ERROR SETTING SESSION TOKEN: $ex");
    }
  }

  String _clientToken = "";
  String _sessionToken = "";
  DateTime _sessionTokenExpiry = DateTime.fromMillisecondsSinceEpoch(0);
  bool get _sessionTokenHasExpired => DateTime.now().isAfter(_sessionTokenExpiry);

  void updateFrom(http.Response resp, Session? session) {
    final newClientToken = resp.headers[HttpHeaders.authorizationHeader];
    if (newClientToken?.isNotEmpty == true) clientToken = newClientToken!;

    if (session is Session) {
      final newSessionId = session.id;
      if (newSessionId.isNotEmpty) sessionId = newSessionId;

      final newSessionToken = session.lastActiveToken?.jwt;
      if (newSessionToken?.isNotEmpty == true) sessionToken = newSessionToken!;
    }
  }
}
