import 'dart:convert';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_auth/src/clerk_api/api.dart';

import '../../test_helpers.dart';

void main() {
  late Api webApi;
  late MockHttpService mockHttp;

  setUp(() {
    mockHttp = MockHttpService();
    webApi = Api(
      config: TestAuthConfig(
        publishableKey: 'pk_test_c29tZWRvbWFpbi5jb20K',
        httpService: mockHttp,
      ),
      isWebOverride: true,
    );
  });

  tearDown(() {
    webApi.terminate();
    mockHttp.reset();
  });

  group('Api on web', () {
    test('GET /client omits CORS-incompatible custom headers', () async {
      await webApi.initialize();
      mockHttp.addClientResponse();

      await webApi.currentClient();

      final headers = mockHttp.calls.first.headers!;
      expect(headers.containsKey('clerk-api-version'), isFalse);
      expect(headers.containsKey('x-flutter-sdk-version'), isFalse);
      expect(headers.containsKey('x-mobile'), isFalse);
      // x-clerk-client-id is only set in test mode anyway, but the
      // assertion documents intent and guards against future regressions
      // if someone wires test mode through to web.
      expect(headers.containsKey('x-clerk-client-id'), isFalse);
      // Sanity: the safelisted headers are still present.
      expect(headers.containsKey('accept'), isTrue);
      expect(headers.containsKey('accept-language'), isTrue);
    });

    test('GET /client omits Content-Type header on web', () async {
      await webApi.initialize();
      mockHttp.addClientResponse();

      await webApi.currentClient();

      final headers = mockHttp.calls.first.headers!;
      expect(headers.containsKey('content-type'), isFalse);
    });

    test('GET /client URI carries __clerk_api_version query param on web',
        () async {
      await webApi.initialize();
      mockHttp.addClientResponse();

      await webApi.currentClient();

      final qp = mockHttp.calls.first.uri.queryParameters;
      expect(qp['__clerk_api_version'], ClerkConstants.clerkApiVersion);
      // _is_native must still be present — we are NOT changing the
      // native-mode token flow, only the headers.
      expect(qp['_is_native'], 'true');
    });

    test('POST /client/sign_ins keeps form-urlencoded Content-Type on web',
        () async {
      await webApi.initialize();
      mockHttp.addSignInResponse();

      await webApi.createSignIn(
        identifier: 'test@example.com',
        password: 'password123',
      );

      final headers = mockHttp.calls.first.headers!;
      expect(
        headers['content-type'],
        'application/x-www-form-urlencoded',
      );
    });

    test(
        'POST /client/sign_ins on web omits all custom headers and '
        'carries __clerk_api_version', () async {
      await webApi.initialize();
      mockHttp.addSignInResponse();

      await webApi.createSignIn(
        identifier: 'test@example.com',
        password: 'password123',
      );

      final call = mockHttp.calls.first;
      final headers = call.headers!;
      expect(headers.containsKey('clerk-api-version'), isFalse);
      expect(headers.containsKey('x-flutter-sdk-version'), isFalse);
      expect(headers.containsKey('x-mobile'), isFalse);
      expect(headers.containsKey('x-clerk-client-id'), isFalse);
      expect(
        call.uri.queryParameters['__clerk_api_version'],
        ClerkConstants.clerkApiVersion,
      );
    });

    test('DELETE /client (signOut) on web omits all custom headers', () async {
      await webApi.initialize();
      mockHttp.addEmptyResponse();

      await webApi.signOut();

      final headers = mockHttp.calls.first.headers!;
      expect(headers.containsKey('clerk-api-version'), isFalse);
      expect(headers.containsKey('x-flutter-sdk-version'), isFalse);
      expect(headers.containsKey('x-mobile'), isFalse);
      expect(headers.containsKey('x-clerk-client-id'), isFalse);
    });

    test('environment() URI on web carries __clerk_api_version', () async {
      mockHttp.addEnvironmentResponse();

      await webApi.environment();

      final call = mockHttp.calls.first;
      // /environment is the one path that goes through _fetch without
      // a headers map at all (see environment() in api.dart), so
      // call.headers is null. Assert that explicitly so a future refactor
      // that accidentally starts sending headers here gets caught.
      expect(call.headers, isNull);
      expect(
        call.uri.queryParameters['__clerk_api_version'],
        ClerkConstants.clerkApiVersion,
      );
    });

    test('Authorization header is still sent on web once a token exists',
        () async {
      await webApi.initialize();

      // First call: server responds with an Authorization header. The
      // SDK's TokenCache reads this and stores it as the client token
      // (see TokenCache.updateFrom at token_cache.dart:152).
      final seedClientJson = {
        'object': 'client',
        'id': 'client_seed',
        'sessions': <Map<String, dynamic>>[],
        'last_active_session_id': null,
        'sign_in': null,
        'sign_up': null,
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };
      mockHttp.addResponse(MockHttpResponse(
        body: jsonEncode({'response': seedClientJson}),
        headers: const {'authorization': 'tok_test_xyz'},
      ));
      // Second call: ordinary client response. We only care about the
      // outgoing headers here.
      mockHttp.addClientResponse();

      await webApi.currentClient();
      await webApi.currentClient();

      final secondHeaders = mockHttp.calls[1].headers!;
      expect(secondHeaders['authorization'], 'tok_test_xyz');
    });
  });

  group('Api on native (regression guard)', () {
    late Api nativeApi;
    late MockHttpService nativeMockHttp;

    setUp(() {
      nativeMockHttp = MockHttpService();
      nativeApi = Api(
        config: TestAuthConfig(
          publishableKey: 'pk_test_c29tZWRvbWFpbi5jb20K',
          httpService: nativeMockHttp,
        ),
        // No isWebOverride — _isWeb defaults to kIsWeb, which is `false`
        // when running under the Dart VM.
      );
    });

    tearDown(() {
      nativeApi.terminate();
      nativeMockHttp.reset();
    });

    test('GET /client still includes all custom headers on native', () async {
      await nativeApi.initialize();
      nativeMockHttp.addClientResponse();

      await nativeApi.currentClient();

      final headers = nativeMockHttp.calls.first.headers!;
      expect(
        headers['clerk-api-version'],
        ClerkConstants.clerkApiVersion,
      );
      expect(
        headers['x-flutter-sdk-version'],
        ClerkConstants.flutterSdkVersion,
      );
      expect(headers['x-mobile'], '1');
      expect(headers['content-type'], 'application/json');
    });

    test('GET /client URI does NOT carry __clerk_api_version on native',
        () async {
      await nativeApi.initialize();
      nativeMockHttp.addClientResponse();

      await nativeApi.currentClient();

      final qp = nativeMockHttp.calls.first.uri.queryParameters;
      expect(qp.containsKey('__clerk_api_version'), isFalse);
      expect(qp['_is_native'], 'true');
    });
  });
}
