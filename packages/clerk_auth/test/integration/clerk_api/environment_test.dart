import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late final Api api;
  late final TestEnv env;
  final httpService = TestHttpService();

  setUpAll(() async {
    env = TestEnv('.env.test');
    api = Api(
      publishableKey: env.publishableKey,
      persistor: Persistor.none,
      httpService: httpService,
      localesLookup: testLocalesLookup,
      pollMode: SessionTokenPollMode.lazy,
    );
    await api.initialize();
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  group('Environment:', () {
    test('can fetch', () async {
      await runWithLogging(() async {
        httpService.expect(
          'GET /v1/environment',
          200,
          '{}',
        );
        final data = await api.environment();
        expect(data.isEmpty, false);
      });
    });
  });
}
