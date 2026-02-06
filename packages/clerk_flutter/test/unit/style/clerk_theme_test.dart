import 'package:clerk_flutter/src/widgets/ui/style/clerk_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClerkThemeExtension', () {
    test('light theme has expected colors', () {
      final theme = ClerkThemeExtension.light;
      expect(theme.colors.background, Colors.white);
      expect(theme.colors.text, const Color(0xFF3c3c3d));
      expect(theme.colors.accent, const Color(0xFF6c47ff));
    });

    test('dark theme has expected colors', () {
      final theme = ClerkThemeExtension.dark;
      expect(theme.colors.background, Colors.black);
      expect(theme.colors.text, Colors.white);
      expect(theme.colors.accent, const Color(0xFF6c47ff));
    });

    test('light theme has light brightness', () {
      final theme = ClerkThemeExtension.light;
      expect(theme.brightness, Brightness.light);
    });

    test('dark theme has dark brightness', () {
      final theme = ClerkThemeExtension.dark;
      expect(theme.brightness, Brightness.dark);
    });

    test('copyWith creates new instance with updated colors', () {
      final original = ClerkThemeExtension.light;
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

      final copied = original.copyWith(colors: customColors);

      expect(copied.colors.background, Colors.blue);
      expect(copied.colors.text, Colors.white);
      expect(original.colors.background, Colors.white); // Original unchanged
    });

    test('lerp interpolates between themes', () {
      final light = ClerkThemeExtension.light;
      final dark = ClerkThemeExtension.dark;

      final midpoint = light.lerp(dark, 0.5);

      // Background should be between white and black
      expect(midpoint.colors.background, isNot(Colors.white));
      expect(midpoint.colors.background, isNot(Colors.black));
    });

    test('lerp returns self when other is null', () {
      final theme = ClerkThemeExtension.light;
      final result = theme.lerp(null, 0.5);
      expect(result, theme);
    });

    test('borderSide uses colors.borderSide', () {
      final theme = ClerkThemeExtension.light;
      expect(theme.borderSide.color, theme.colors.borderSide);
      expect(theme.borderSide.width, 0.5);
    });
  });

  group('ClerkThemeColors', () {
    test('lerp interpolates all color properties', () {
      const colors1 = ClerkThemeColors(
        background: Colors.white,
        altBackground: Colors.white,
        borderSide: Colors.white,
        text: Colors.white,
        icon: Colors.white,
        lightweightText: Colors.white,
        error: Colors.white,
        accent: Colors.white,
      );

      const colors2 = ClerkThemeColors(
        background: Colors.black,
        altBackground: Colors.black,
        borderSide: Colors.black,
        text: Colors.black,
        icon: Colors.black,
        lightweightText: Colors.black,
        error: Colors.black,
        accent: Colors.black,
      );

      final midpoint = colors1.lerp(colors2, 0.5);

      // All colors should be grey (midpoint between white and black)
      expect(midpoint.background, isNot(Colors.white));
      expect(midpoint.background, isNot(Colors.black));
    });
  });

  group('ClerkThemeStyles', () {
    test('creates styles from colors', () {
      const colors = ClerkThemeColors(
        background: Colors.white,
        altBackground: Color(0xFFdddddd),
        borderSide: Color(0xFFdddddd),
        text: Color(0xFF3c3c3d),
        icon: Color(0xFFaaaaaa),
        lightweightText: Color(0xFFaaaaaa),
        error: Color(0xFFff3333),
        accent: Color(0xFF6c47ff),
      );

      final styles = ClerkThemeStyles(colors: colors);

      expect(styles.heading.color, colors.text);
      expect(styles.error.color, colors.error);
      expect(styles.clickableText.color, colors.accent);
      expect(styles.avatarInitials.color, colors.background);
    });

    test('defaultStylesBuilder creates ClerkThemeStyles', () {
      const colors = ClerkThemeColors(
        background: Colors.white,
        altBackground: Color(0xFFdddddd),
        borderSide: Color(0xFFdddddd),
        text: Color(0xFF3c3c3d),
        icon: Color(0xFFaaaaaa),
        lightweightText: Color(0xFFaaaaaa),
        error: Color(0xFFff3333),
        accent: Color(0xFF6c47ff),
      );

      final styles = ClerkThemeStyles.defaultStylesBuilder(colors);

      expect(styles, isA<ClerkThemeStyles>());
      expect(styles.heading.fontSize, 18.0);
      expect(styles.subheading.fontSize, 14.0);
    });
  });
}

