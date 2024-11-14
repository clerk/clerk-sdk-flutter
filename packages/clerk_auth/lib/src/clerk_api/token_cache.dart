import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class TokenCache {
  TokenCache(this.publicKey, this.persistor);

  final String publicKey;
  final Persistor? persistor;

  static const _tokenExpiryBuffer = Duration(seconds: 10);

  final logger = Logger();
  late final RSAPublicKey rsaKey = RSAPublicKey(publicKey);

  bool get canRefreshSessionToken => clientToken.isNotEmpty && sessionId.isNotEmpty;

  String _sessionId = '';
  String _clientToken = '';
  String _sessionToken = '';
  DateTime _sessionTokenExpiry = DateTime.fromMillisecondsSinceEpoch(0);
  bool get _sessionTokenHasExpired => DateTime.now().isAfter(_sessionTokenExpiry);

  String get _sessionIdKey => '_clerkSessionId_${publicKey.hashCode}';
  String get _sessionTokenKey => '_clerkSessionToken_${publicKey.hashCode}';
  String get _sessionTokenExpiryKey => '_clerkSessionTokenExpiry_${publicKey.hashCode}';
  String get _clientTokenKey => '_clerkClientToken_${publicKey.hashCode}';

  List<String> get _persistorKeys => [
        _sessionIdKey,
        _sessionTokenKey,
        _sessionTokenExpiryKey,
        _clientTokenKey,
      ];

  Future<void> init() async {
    if (persistor case Persistor persistor) {
      final [sessionId, sessionToken, ms, clientToken] = await Future.wait(
        _persistorKeys.map(persistor.read),
      );

      _sessionId = sessionId ?? '';
      _sessionToken = sessionToken ?? '';
      _clientToken = clientToken ?? '';
      _sessionTokenExpiry = DateTime.fromMillisecondsSinceEpoch(int.tryParse(ms.toString()) ?? 0);
    }
  }

  void clear() {
    _sessionId = '';
    _clientToken = '';
    _sessionToken = '';
    _sessionTokenExpiry = DateTime.fromMillisecondsSinceEpoch(0);
    for (final key in _persistorKeys) {
      persistor?.delete(key);
    }
  }

  String get sessionId => _sessionId;

  set sessionId(String id) {
    _sessionId = id;
    persistor?.write(_sessionIdKey, id);
  }

  String get clientToken => _clientToken;

  set clientToken(String token) {
    if (token == _clientToken) return;

    try {
      JWT.verify(token, rsaKey);
      _clientToken = token;
      persistor?.write(_clientTokenKey, token);
    } catch (ex) {
      logger.e('ERROR SETTING CLIENT TOKEN: $ex');
    }
  }

  String get sessionToken {
    if (_sessionTokenHasExpired) _sessionToken = '';
    return _sessionToken;
  }

  set sessionToken(String token) {
    if (token == _sessionToken) return;

    try {
      final jwt = JWT.verify(token, rsaKey);
      final exp = jwt.payload['exp'];
      if (exp is int) {
        final expiry = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
        _sessionTokenExpiry = expiry.subtract(_tokenExpiryBuffer);
        _sessionToken = token;
        persistor?.write(_sessionTokenKey, token);
        persistor?.write(
          _sessionTokenExpiryKey,
          _sessionTokenExpiry.millisecondsSinceEpoch.toString(),
        );
      }
    } catch (ex) {
      logger.e('ERROR SETTING SESSION TOKEN: $ex');
    }
  }

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
