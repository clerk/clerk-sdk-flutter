import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/utils/logging.dart';

import '../../test_helpers.dart';

void main() {
  late Api api;
  late TestEnv env;
  late TestHttpService httpService;

  setUp(() async {
    env = TestEnv('.env.test');
    httpService =
        TestHttpService('integration/clerk_api/environment_test', env);
    api = Api(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );
    await api.initialize();
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  group('Environment:', () {
    test('can fetch', () async {
      await runWithLogging(() async {
        httpService.recordPath = 'can_fetch_env';
        httpService.expect(HttpMethod.get, '/v1/environment');
        final data = await api.environment();
        expect(data.isEmpty, false);
      });
    });
  });
}
