import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/style/clerk_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemeDataExtension', () {
    test('clerkThemeExtension returns light theme for light brightness', () {
      final themeData = ThemeData(brightness: Brightness.light);
      final extension = themeData.clerkThemeExtension;

      expect(extension.brightness, Brightness.light);
      expect(extension.colors.background, Colors.white);
    });

    test('clerkThemeExtension returns dark theme for dark brightness', () {
      final themeData = ThemeData(brightness: Brightness.dark);
      final extension = themeData.clerkThemeExtension;

      expect(extension.brightness, Brightness.dark);
      expect(extension.colors.background, Colors.black);
    });

    test('clerkThemeExtension returns custom extension when provided', () {
      final customColors = ClerkThemeColors(
        background: Colors.blue,
        altBackground: Colors.blueGrey,
        borderSide: Colors.grey,
        text: Colors.white,
        icon: Colors.white,
        lightweightText: Colors.grey,
        error: Colors.red,
        accent: Colors.purple,
      );
      final customExtension = ClerkThemeExtension(colors: customColors);

      final themeData = ThemeData(
        brightness: Brightness.light,
        extensions: [customExtension],
      );

      final extension = themeData.clerkThemeExtension;

      expect(extension.colors.background, Colors.blue);
      expect(extension.colors.accent, Colors.purple);
    });
  });
}

