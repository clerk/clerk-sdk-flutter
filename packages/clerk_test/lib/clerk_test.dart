import 'package:test/test.dart' as test show expect;

export 'package:test/test.dart' hide expect;

export 'src/test_auth_config.dart';
export 'src/test_env.dart';
export 'src/test_http_service.dart';
export 'src/test_http_service_error.dart';
export 'src/test_log_printer.dart';

void expect(dynamic actual, [dynamic matcher = true]) {
  test.expect(actual, matcher);
}
