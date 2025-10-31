import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/logging.dart';
import 'package:integration_test/integration_test.dart';

import '../test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late final TestEnv env;

  setUpAll(() async {
    env = TestEnv('.env.test');
    await setUpLogging(printer: TestLogPrinter(), level: Level.INFO);
  });

  Future<ClerkAuthConfig> initialiseForTest(String testName) async {
    final httpService = TestHttpService('flow/sign_in_flow_test', env)
      ..recordPath = testName;

    return TestAuthConfig(
      publishableKey: env.publishableKey,
      httpService: httpService,
    ).toClerkAuthConfig();
  }

  group('sign in: ', () {
    testWidgets('with email and password', (tester) async {
      // Load app widget.
      final config = await initialiseForTest('with_email_and_password');
      await tester.pumpWidget(ClerkFlutterTestApp(config: config));
      await tester.pumpAndSettle();

      expect(find.text('Email address or username'), findsOneWidget);
    });
  });
}
