import 'dart:convert';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
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
  TokenCache({
    required Persistor persistor,
    required int cacheId,
  })  : _persistor = persistor,
        _cacheId = cacheId;

  final Persistor _persistor;
  final int _cacheId;

  late DateTime _sessionTokenExpiry = DateTimeExt.zero;

  /// the date at which, if in the future, the current [sessionToken]
  /// is due to expire
  DateTime get sessionTokenExpiry => _sessionTokenExpiry;

  static const _tokenExpiryBuffer = Duration(seconds: 10);
  static const _kJwtExpiryKey = 'exp';

  final _logger = Logger('TokenCache');

  String _sessionId = '';
  String _clientToken = '';
  String _sessionToken = '';

  /// Whether or not the [sessionToken] can be refreshed
  bool get canRefreshSessionToken =>
      clientToken.isNotEmpty && sessionId.isNotEmpty;

  bool get _sessionTokenHasExpired =>
      DateTime.timestamp().isAfter(sessionTokenExpiry);

  String get _sessionIdKey => '_clerkSession_Id_$_cacheId';

  String get _sessionTokenKey => '_clerkSession_TokenValue_$_cacheId';

  String get _sessionTokenExpiryKey => '_clerkSession_TokenExpiry_$_cacheId';

  String get _clientTokenKey => '_clerkClient_TokenValue_$_cacheId';

  List<String> get _persistorKeys => [
        _sessionIdKey,
        _sessionTokenKey,
        _sessionTokenExpiryKey,
        _clientTokenKey,
      ];

  /// Initialise the cache
  Future<void> initialize() async {
    // Read all stored variables first before assignment
    final sessionId = await _persistor.read(_sessionIdKey) ?? '';
    final sessionToken = await _persistor.read(_sessionTokenKey) ?? '';
    final clientToken = await _persistor.read(_clientTokenKey) ?? '';
    final seconds = await _persistor.read(_sessionTokenExpiryKey) ?? '';
    final sessionTokenExpiry =
        DateTimeExt.utcEpochSeconds(int.tryParse(seconds) ?? 0);

    _sessionId = sessionId;
    _sessionToken = sessionToken;
    _clientToken = clientToken;
    _sessionTokenExpiry = sessionTokenExpiry;
  }

  /// Reset the [TokenCache]
  ///
  void clear() {
    _sessionId = '';
    _clientToken = '';
    _sessionToken = '';
    _sessionTokenExpiry = DateTimeExt.zero;
    for (final key in _persistorKeys) {
      _persistor.delete(key);
    }
  }

  /// Get the [sessionId]
  String get sessionId => _sessionId;

  /// Set the [sessionId]
  set sessionId(String id) {
    _sessionId = id;
    _persistor.write(_sessionIdKey, id);
  }

  /// Get the [clientToken]
  String get clientToken => _clientToken;

  /// Set the [clientToken]
  set clientToken(String token) {
    if (token == _clientToken) return;

    try {
      _clientToken = token;
      _persistor.write(_clientTokenKey, token);
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
      final body = token.split('.')[1];
      final data = switch (body.length) {
        int len when len == 3 => body.padRight(len + 1, '='),
        int len when len == 2 => body.padRight(len + 2, '='),
        _ => body,
      };
      final payload = json.decode(utf8.decode(base64Url.decode(data)));
      final expirySeconds = payload[_kJwtExpiryKey];
      if (expirySeconds is int) {
        final expiry = expirySeconds - _tokenExpiryBuffer.inSeconds;
        _sessionTokenExpiry = DateTimeExt.utcEpochSeconds(expiry);
        if (_sessionTokenExpiry.isAfter(DateTime.now())) {
          _sessionToken = token;
          _persistor.write(_sessionTokenKey, token);
          _persistor.write(_sessionTokenExpiryKey, expiry.toString());
        }
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
