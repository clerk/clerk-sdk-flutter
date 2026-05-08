import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';

import '../../test_helpers.dart';

void main() {
  group('signOut offline behaviour', () {
    late MockHttpService mockHttp;
    late Auth auth;

    setUp(() async {
      mockHttp = MockHttpService();
      auth = Auth(
        config: TestAuthConfig(
          publishableKey: TestAuthConfig.kPublishableKey,
          httpService: mockHttp,
        ),
      );

      // initialize() calls POST /client then GET /environment. Queue an
      // authenticated client response (Authorization header seeds the token
      // cache via TokenCache.updateFrom) so the session is active after init.
      mockHttp.addAuthenticatedClientWithSessionResponse();
      mockHttp.addEnvironmentResponse();
      await auth.initialize();
    });

    tearDown(() {
      auth.terminate();
    });

    test('auth is signed in after initialization with active session', () {
      expect(auth.isSignedIn, true);
    });

    test(
      'signOut clears local auth state immediately even when network is unavailable',
      () async {
        mockHttp.isOffline = true;

        await auth.signOut();

        expect(auth.isSignedIn, false);
      },
    );

    // This test documents the core bug: after an offline signOut the token
    // cache retains credentials. When connectivity returns and the background
    // refresh fires, those credentials are sent in the Authorization header,
    // the server recognises the still-active session and the user is silently
    // re-authenticated.
    //
    // Expected behaviour: signOut() must clear the local token cache regardless
    // of network outcome, so a subsequent refresh carries no credentials and
    // the server returns an empty client.
    test(
      'after offline signOut, background client refresh does not re-authenticate the user',
      () async {
        mockHttp.isOffline = true;
        await auth.signOut();
        expect(auth.isSignedIn, false);

        // Connectivity returns. Without credentials the real Clerk server returns
        // an empty client with no active sessions.
        mockHttp.isOffline = false;
        mockHttp.addClientResponse();

        // Simulate the background _clientTimer firing.
        await auth.refreshClient();

        expect(auth.isSignedIn, false);
      },
    );

    test(
      'after offline signOut, subsequent client refresh request carries no auth credentials',
      () async {
        mockHttp.isOffline = true;
        await auth.signOut();

        mockHttp.isOffline = false;
        mockHttp.addClientResponse();
        await auth.refreshClient();

        final refreshCall = mockHttp.calls.last;
        expect(refreshCall.headers?[HttpHeaders.authorizationHeader], isNull);
      },
    );
  });
}
