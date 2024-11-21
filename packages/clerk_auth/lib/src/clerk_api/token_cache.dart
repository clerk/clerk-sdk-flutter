import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

/// A store for authentication tokens and IDs from the
/// Clerk back end
///
/// Only intended for use by [Api]
///
class TokenCache {
  /// Create a [TokenCache] instance
  ///
  TokenCache(this._publicKey, this._persistor) {
    _init();
  }

  final String _publicKey;
  final Persistor? _persistor;

  static const _tokenExpiryBuffer = Duration(seconds: 10);

  final _logger = Logger('TokenCache');
  late final RSAPublicKey _rsaKey;

  String _sessionId = '';
  String _clientToken = '';
  String _sessionToken = '';
  DateTime _sessionTokenExpiry = DateTime.fromMillisecondsSinceEpoch(0);

  /// Whether or not the [sessionToken] can be refreshed
  bool get canRefreshSessionToken =>
      clientToken.isNotEmpty && sessionId.isNotEmpty;

  bool get _sessionTokenHasExpired =>
      DateTime.now().isAfter(_sessionTokenExpiry);

  String get _sessionIdKey => '_clerkSessionId_${_publicKey.hashCode}';

  String get _sessionTokenKey => '_clerkSessionToken_${_publicKey.hashCode}';

  String get _sessionTokenExpiryKey =>
      '_clerkSessionTokenExpiry_${_publicKey.hashCode}';

  String get _clientTokenKey => '_clerkClientToken_${_publicKey.hashCode}';

  List<String> get _persistorKeys => [
        _sessionIdKey,
        _sessionTokenKey,
        _sessionTokenExpiryKey,
        _clientTokenKey,
      ];

  Future<void> _init() async {
    _rsaKey = RSAPublicKey(_publicKey);
    if (_persistor case Persistor persistor) {
      final [sessionId, sessionToken, ms, clientToken] = await Future.wait(
        _persistorKeys.map(persistor.read),
      );

      _sessionId = sessionId ?? '';
      _sessionToken = sessionToken ?? '';
      _clientToken = clientToken ?? '';
      _sessionTokenExpiry =
          DateTime.fromMillisecondsSinceEpoch(int.tryParse(ms ?? '') ?? 0);
    }
  }

  /// Reset the [TokenCache]
  ///
  void clear() {
    _sessionId = '';
    _clientToken = '';
    _sessionToken = '';
    _sessionTokenExpiry = DateTime.fromMillisecondsSinceEpoch(0);
    for (final key in _persistorKeys) {
      _persistor?.delete(key);
    }
  }

  /// Get the [sessionId]
  String get sessionId => _sessionId;

  /// Set the [sessionId]
  set sessionId(String id) {
    _sessionId = id;
    _persistor?.write(_sessionIdKey, id);
  }

  /// Get the [clientToken]
  String get clientToken => _clientToken;

  /// Set the [clientToken]
  set clientToken(String token) {
    if (token == _clientToken) return;

    try {
      JWT.verify(token, _rsaKey);
      _clientToken = token;
      _persistor?.write(_clientTokenKey, token);
    } catch (error, stackTrace) {
      _logger.severe('ERROR SETTING CLIENT TOKEN: $error', error, stackTrace);
    }
  }

  /// Get the [sessionToken]
  String get sessionToken {
    if (_sessionTokenHasExpired) _sessionToken = '';
    return _sessionToken;
  }

  /// Set the [sessionToken]
  set sessionToken(String token) {
    if (token == _sessionToken) return;

    try {
      final jwt = JWT.verify(token, _rsaKey);
      final exp = jwt.payload['exp'];
      if (exp is int) {
        final expiry = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
        _sessionTokenExpiry = expiry.subtract(_tokenExpiryBuffer);
        _sessionToken = token;
        _persistor?.write(_sessionTokenKey, token);
        _persistor?.write(
          _sessionTokenExpiryKey,
          _sessionTokenExpiry.millisecondsSinceEpoch.toString(),
        );
      }
    } catch (error, _) {
      _logger.info('ERROR SETTING SESSION TOKEN: $error', error);
    }
  }

  /// Update the tokens and IDs from a newly arrived [http.Response]
  /// and [Session]
  ///
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
