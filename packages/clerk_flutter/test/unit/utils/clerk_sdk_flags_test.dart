import 'package:clerk_flutter/src/utils/clerk_sdk_flags.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClerkSdkFlags', () {
    test('default constructor has clearCookiesOnSignOut as false', () {
      const flags = ClerkSdkFlags();
      expect(flags.clearCookiesOnSignOut, false);
    });

    test('can set clearCookiesOnSignOut to true', () {
      const flags = ClerkSdkFlags(clearCookiesOnSignOut: true);
      expect(flags.clearCookiesOnSignOut, true);
    });

    test('can set clearCookiesOnSignOut to false explicitly', () {
      const flags = ClerkSdkFlags(clearCookiesOnSignOut: false);
      expect(flags.clearCookiesOnSignOut, false);
    });
  });
}

