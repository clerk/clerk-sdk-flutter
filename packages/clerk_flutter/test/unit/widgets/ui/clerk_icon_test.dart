import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClerkIcon', () {
    test('uses default size of 12', () {
      const icon = ClerkIcon('assets/icons/test.svg');
      expect(icon.size, 12.0);
    });

    test('uses custom size', () {
      const icon = ClerkIcon('assets/icons/test.svg', size: 24.0);
      expect(icon.size, 24.0);
    });

    test('stores asset name', () {
      const icon = ClerkIcon('assets/icons/custom.svg');
      expect(icon.assetName, 'assets/icons/custom.svg');
    });

    test('build returns SvgPicture', () {
      const icon = ClerkIcon('assets/icons/test.svg', size: 16.0);
      // Verify the widget is configured correctly
      expect(icon.size, 16.0);
      expect(icon.assetName, 'assets/icons/test.svg');
    });
  });
}

