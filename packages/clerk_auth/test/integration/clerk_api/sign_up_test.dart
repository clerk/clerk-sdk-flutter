import 'package:clerk_auth/clerk_api/clerk_api.dart';
import 'package:common/common.dart';
import 'package:dart_dotenv/dart_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late final Api api;

  final env = TestEnv();

  final logger = Logger();

  setUpAll(() async {
    final dotEnv = DotEnv(filePath: '.env.test');
    final values = dotEnv.getDotEnv();
    env.addAll(values);

    api = Api(publicKey: env.publicKey, publishableKey: env.publishableKey);

    await setUpLogging(printer: TestLogPrinter());
  });

  group('Can sign up:', () {
    test('with email', () async {
      late ApiResponse response;

      response = await api.createSignUp();
      logger.i(response);
      expect(response.client?.signUp?.status, Status.needsFirstFactor);
    });
  });
}
