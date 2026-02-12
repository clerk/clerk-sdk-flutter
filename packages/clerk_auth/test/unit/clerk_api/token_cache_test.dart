import 'dart:async';
import 'dart:convert';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_auth/src/clerk_api/token_cache.dart';

import '../../test_helpers.dart';

/// A mock persistor that stores values in memory
class MockPersistor implements Persistor {
  final Map<String, dynamic> _storage = {};

  @override
  Future<void> initialize() async {}

  @override
  void terminate() {}

  @override
  FutureOr<T?> read<T>(String key) => _storage[key] as T?;

  @override
  FutureOr<void> write<T>(String key, T value) {
    _storage[key] = value;
  }

  @override
  FutureOr<void> delete(String key) {
    _storage.remove(key);
  }

  void clear() => _storage.clear();

  bool containsKey(String key) => _storage.containsKey(key);
}

/// Creates a valid JWT token with the given expiry time
String createTestJwt({
  required int exp,
  required int nbf,
  String? orgId,
}) {
  final header = base64Url.encode(utf8.encode('{"alg":"HS256","typ":"JWT"}'));
  final body = base64Url.encode(utf8.encode(jsonEncode({
    'exp': exp,
    'nbf': nbf,
    if (orgId != null) 'org_id': orgId,
  })));
  const signature = 'test_signature';
  return '$header.$body.$signature';
}

void main() {
  late MockPersistor persistor;
  late TokenCache tokenCache;
  const publishableKey = 'pk_test_123';

  setUp(() {
    persistor = MockPersistor();
    tokenCache = TokenCache(
      persistor: persistor,
      publishableKey: publishableKey,
    );
  });

  group('TokenCache', () {
    group('initialization', () {
      test('initializes with empty values', () async {
        await tokenCache.initialize();

        expect(tokenCache.hasClientToken, false);
        expect(tokenCache.hasClientId, false);
        expect(tokenCache.sessionId, '');
        expect(tokenCache.clientToken, '');
        expect(tokenCache.clientId, '');
      });

      test('restores session ID from persistor', () async {
        final cacheId = publishableKey.hashCode;
        await persistor.write('_clerkSession_Id_$cacheId', 'sess_123');

        await tokenCache.initialize();

        expect(tokenCache.sessionId, 'sess_123');
      });

      test('restores client token from persistor', () async {
        final cacheId = publishableKey.hashCode;
        await persistor.write('_clerkClient_Token_$cacheId', 'token_abc');

        await tokenCache.initialize();

        expect(tokenCache.clientToken, 'token_abc');
        expect(tokenCache.hasClientToken, true);
      });

      test('restores client ID from persistor', () async {
        final cacheId = publishableKey.hashCode;
        await persistor.write('_clerkClient_Id_$cacheId', 'client_xyz');

        await tokenCache.initialize();

        expect(tokenCache.clientId, 'client_xyz');
        expect(tokenCache.hasClientId, true);
      });

      test('restores valid session tokens from persistor', () async {
        final cacheId = publishableKey.hashCode;
        final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
        final jwt = createTestJwt(exp: now + 3600, nbf: now - 60);

        final sessionTokenData = jsonEncode({
          '': {'jwt': jwt, 'template_name': null},
        });
        await persistor.write('_clerkSession_Tokens_$cacheId', sessionTokenData);

        await tokenCache.initialize();

        final token = tokenCache.sessionTokenFor(null, null);
        expect(token, isNotNull);
        expect(token!.jwt, jwt);
      });

      test('does not restore expired session tokens', () async {
        final cacheId = publishableKey.hashCode;
        final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
        // Create an expired token (exp in the past)
        final jwt = createTestJwt(exp: now - 3600, nbf: now - 7200);

        final sessionTokenData = jsonEncode({
          '': {'jwt': jwt, 'template_name': null},
        });
        await persistor.write('_clerkSession_Tokens_$cacheId', sessionTokenData);

        await tokenCache.initialize();

        final token = tokenCache.sessionTokenFor(null, null);
        expect(token, isNull);
      });
    });

    group('canRefreshSessionToken', () {
      test('returns false when no client token', () async {
        await tokenCache.initialize();
        expect(tokenCache.canRefreshSessionToken, false);
      });

      test('returns false when no session ID', () async {
        final cacheId = publishableKey.hashCode;
        await persistor.write('_clerkClient_Token_$cacheId', 'token_abc');
        await tokenCache.initialize();
        expect(tokenCache.canRefreshSessionToken, false);
      });

      test('returns true when both client token and session ID exist', () async {
        final cacheId = publishableKey.hashCode;
        await persistor.write('_clerkClient_Token_$cacheId', 'token_abc');
        await persistor.write('_clerkSession_Id_$cacheId', 'sess_123');
        await tokenCache.initialize();
        expect(tokenCache.canRefreshSessionToken, true);
      });
    });

    group('clear', () {
      test('clears all cached values', () async {
        final cacheId = publishableKey.hashCode;
        await persistor.write('_clerkClient_Token_$cacheId', 'token_abc');
        await persistor.write('_clerkClient_Id_$cacheId', 'client_xyz');
        await persistor.write('_clerkSession_Id_$cacheId', 'sess_123');
        await tokenCache.initialize();

        tokenCache.clear();

        expect(tokenCache.sessionId, '');
        expect(tokenCache.clientToken, '');
        expect(tokenCache.clientId, '');
        expect(tokenCache.hasClientToken, false);
        expect(tokenCache.hasClientId, false);
      });

      test('deletes values from persistor', () async {
        final cacheId = publishableKey.hashCode;
        await persistor.write('_clerkClient_Token_$cacheId', 'token_abc');
        await tokenCache.initialize();

        tokenCache.clear();

        expect(persistor.containsKey('_clerkClient_Token_$cacheId'), false);
        expect(persistor.containsKey('_clerkSession_Id_$cacheId'), false);
      });
    });

    group('makeAndCacheSessionToken', () {
      test('creates and caches a session token', () async {
        await tokenCache.initialize();
        final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
        final jwt = createTestJwt(exp: now + 3600, nbf: now - 60);

        final token = tokenCache.makeAndCacheSessionToken(jwt);

        expect(token.jwt, jwt);
        expect(tokenCache.sessionTokenFor(null, null)?.jwt, jwt);
      });

      test('caches token with template name', () async {
        await tokenCache.initialize();
        final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
        final jwt = createTestJwt(exp: now + 3600, nbf: now - 60);

        final token = tokenCache.makeAndCacheSessionToken(jwt, 'my_template');

        expect(token.jwt, jwt);
        expect(token.templateName, 'my_template');
        expect(tokenCache.sessionTokenFor(null, 'my_template')?.jwt, jwt);
      });

      test('persists session tokens', () async {
        await tokenCache.initialize();
        final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
        final jwt = createTestJwt(exp: now + 3600, nbf: now - 60);

        tokenCache.makeAndCacheSessionToken(jwt);

        final cacheId = publishableKey.hashCode;
        expect(persistor.containsKey('_clerkSession_Tokens_$cacheId'), true);
      });
    });

    group('sessionTokenFor', () {
      test('returns null for non-existent token', () async {
        await tokenCache.initialize();
        expect(tokenCache.sessionTokenFor(null, null), isNull);
      });

      test('returns null for expired token', () async {
        await tokenCache.initialize();
        final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
        // Create a token that expires immediately
        final jwt = createTestJwt(exp: now - 100, nbf: now - 200);

        tokenCache.makeAndCacheSessionToken(jwt);

        expect(tokenCache.sessionTokenFor(null, null), isNull);
      });

      test('returns token for organization', () async {
        await tokenCache.initialize();
        final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
        final jwt = createTestJwt(exp: now + 3600, nbf: now - 60, orgId: 'org_123');

        tokenCache.makeAndCacheSessionToken(jwt);

        final token = tokenCache.sessionTokenFor(
          const Organization(id: 'org_123'),
          null,
        );
        expect(token?.jwt, jwt);
      });
    });

    group('terminate', () {
      test('completes without error', () async {
        await tokenCache.initialize();
        expect(() => tokenCache.terminate(), returnsNormally);
      });
    });
  });
}

