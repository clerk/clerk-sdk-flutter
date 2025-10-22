// ignore_for_file: avoid_print

import 'package:test/test.dart' as test show expect;

export 'package:clerk_test/src/test_auth_config.dart';
export 'package:clerk_test/src/test_env.dart';
export 'package:clerk_test/src/test_http_service.dart';
export 'package:clerk_test/src/test_http_service_error.dart';
export 'package:clerk_test/src/test_log_printer.dart';
export 'package:test/test.dart' hide expect;

// Override for the standard expect that lets us leave out
// the second parameter if it's simply `true`
void expect(dynamic actual, [dynamic matcher = true]) {
  test.expect(actual, matcher);
}
