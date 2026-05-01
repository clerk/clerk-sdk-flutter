import 'package:clerk_auth/src/utils/platform_check/platform_check.dart';

import '../../test_helpers.dart';

void main() {
  group('platform_check', () {
    test('isWeb is false when running on the Dart VM', () {
      expect(isWeb, isFalse);
    });
  });
}
