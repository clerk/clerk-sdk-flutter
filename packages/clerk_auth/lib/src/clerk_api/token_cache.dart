import 'dart:convert';
import 'dart:io';

import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:clerk_auth/src/models/client/organization.dart';
import 'package:clerk_auth/src/models/client/session.dart';
import 'package:clerk_auth/src/models/client/session_token.dart';
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

  final _logger = Logger('TokenCache');
  final _sessionTokens = <String, SessionToken>{};

  String _sessionId = '';
  String _clientToken = '';

  /// Whether or not we have a [clientToken]
  bool get hasClientToken => clientToken.isNotEmpty;

  /// Whether or not the [sessionTokenFor] can be refreshed
  bool get canRefreshSessionToken => hasClientToken && sessionId.isNotEmpty;

  String get _sessionIdKey => '_clerkSession_Id_$_cacheId';

  String get _sessionTokenKey => '_clerkSession_Tokens_$_cacheId';

  String get _clientTokenKey => '_clerkClient_TokenValue_$_cacheId';

  List<String> get _persistorKeys => [
        _sessionIdKey,
        _sessionTokenKey,
        _clientTokenKey,
      ];

  /// Initialise the cache
  Future<void> initialize() async {
    // Read all stored variables first before assignment
    final sessionId = await _persistor.read(_sessionIdKey) ?? '';
    _sessionId = sessionId;

    final sessionTokens = await _persistor.read(_sessionTokenKey);
    if (sessionTokens case String sessionTokens) {
      final sessionTokenData =
          json.decode(sessionTokens) as Map<String, dynamic>;
      for (final entry in sessionTokenData.entries) {
        final sessionToken =
            SessionToken.fromJson(entry.value as Map<String, dynamic>);
        if (sessionToken.isNotExpired) {
          _sessionTokens[entry.key] = sessionToken;
        }
      }
    }

    final clientToken = await _persistor.read(_clientTokenKey) ?? '';
    _clientToken = clientToken;
  }

  /// Reset the [TokenCache]
  ///
  void clear() {
    _sessionId = '';
    _clientToken = '';
    _sessionTokens.clear();
    for (final key in _persistorKeys) {
      _persistor.delete(key);
    }
  }

  /// Get the [sessionId]
  String get sessionId => _sessionId;

  void _setSessionId(String id) {
    _sessionId = id;
    _persistor.write(_sessionIdKey, id);
  }

  /// Get the [clientToken]
  String get clientToken => _clientToken;

  void _setClientToken(String token) {
    if (token == _clientToken) return;

    try {
      _clientToken = token;
      _persistor.write(_clientTokenKey, token);
    } catch (error, stackTrace) {
      _logger.severe('ERROR SETTING CLIENT TOKEN: $error', error, stackTrace);
    }
  }

  /// Get the [sessionTokenFor] for a [orgId]
  SessionToken? sessionTokenFor(Organization? org, String? templateName) {
    org ??= Organization.personal;
    return switch (_sessionTokens[_sessionTokenId(org.id, templateName)]) {
      SessionToken token when token.isNotExpired => token,
      _ => null,
    };
  }

  String _sessionTokenId(String orgId, String? templateName) =>
      switch (templateName) {
        String templateName => '$orgId-$templateName',
        _ => orgId,
      };

  /// Set a [sessionToken] for an organization
  SessionToken makeAndCacheSessionToken(String token, [String? templateName]) {
    final sessionToken = SessionToken(jwt: token);
    final id = _sessionTokenId(sessionToken.orgId, templateName);
    if (token != _sessionTokens[id]?.jwt) {
      _sessionTokens[id] = sessionToken;
      _persistor.write(_sessionTokenKey, json.encode(_sessionTokens));
    }

    return _sessionTokens[id]!;
  }

  /// Update the tokens and IDs from a newly arrived [http.Response]
  /// and [Session]
  ///
  void updateFrom(http.Response resp, Session? session) {
    final newClientToken = resp.headers[HttpHeaders.authorizationHeader];
    if (newClientToken?.isNotEmpty == true) _setClientToken(newClientToken!);

    if (session is Session) {
      final newSessionId = session.id;
      if (newSessionId.isNotEmpty) _setSessionId(newSessionId);

      final newSessionToken = session.lastActiveToken?.jwt;
      if (newSessionToken?.isNotEmpty == true) {
        makeAndCacheSessionToken(newSessionToken!);
      }
    }
  }
}
