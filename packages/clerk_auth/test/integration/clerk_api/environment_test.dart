import 'package:clerk_auth/clerk_auth.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late final Api api;
  late final TestEnv env;
  final httpClient = TestHttpClient();

  setUpAll(() async {
    env = TestEnv('.env.test');
    api = Api(
      publishableKey: env.publishableKey,
      client: httpClient,
    );
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  group('Environment:', () {
    test('can fetch', () async {
      await runWithLogging(() async {
        httpClient.expect(
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
