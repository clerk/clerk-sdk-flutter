// ignore_for_file: avoid_print

import 'package:test/test.dart' as test show expect;

export 'package:test/test.dart' hide expect;

export 'test_support/test_support.dart';

// Override for the standard expect that lets us leave out
// the second parameter if it's simply `true`
void expect(dynamic actual, [dynamic matcher = true]) {
  test.expect(actual, matcher);
}
