import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/utils/logging.dart';

import '../../test_helpers.dart';

void main() {
  late Api api;
  late TestEnv env;
  late TestHttpService httpService;

  setUp(() async {
    env = TestEnv('.env.test');
    httpService = TestHttpService('clerk_api/healthcheck_test', env);
    api = Api(
      config: TestAuthConfig(
        publishableKey: env.publishableKey,
        httpService: httpService,
      ),
    );
    await api.initialize();
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  group('Health check:', () {
    test('can test health', () async {
      await runWithLogging(() async {
        httpService.recordPath = 'can_test_health';
        final result = await api.hasConnectivity();
        expect(result, true);
      });
    });
  });
}
