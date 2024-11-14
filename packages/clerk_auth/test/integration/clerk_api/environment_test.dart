import 'dart:convert';

import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late final Api api;
  late final TestEnv env;

  setUpAll(() async {
    env = TestEnv('.env.test');
    api = Api(publicKey: env.publicKey, publishableKey: env.publishableKey);
    await setUpLogging(printer: TestLogPrinter());
  });

  group('Environment:', () {
    test('can fetch', () async {
      await runWithLogging(() async {
        final data = await api.environment();
        // ignore: avoid_print
        print(jsonEncode(data.toJson()));
        expect(data.isEmpty, false);
      });
    });
  });
}
