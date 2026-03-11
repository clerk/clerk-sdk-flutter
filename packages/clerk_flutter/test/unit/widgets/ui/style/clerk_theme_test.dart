import 'package:clerk_flutter/src/widgets/ui/style/clerk_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClerkThemeExtension', () {
    test('stores colors parameter', () {
      const colors = ClerkThemeColors(
        background: Colors.white,
        altBackground: Colors.grey,
        borderSide: Colors.black,
        text: Colors.black,
        icon: Colors.blue,
        lightweightText: Colors.grey,
        error: Colors.red,
        accent: Colors.purple,
      );
      final theme = ClerkThemeExtension(colors: colors);
      expect(theme.colors, colors);
    });

    test('has light theme', () {
      expect(ClerkThemeExtension.light, isNotNull);
      expect(ClerkThemeExtension.light.colors.background, Colors.white);
    });

    test('has dark theme', () {
      expect(ClerkThemeExtension.dark, isNotNull);
      expect(ClerkThemeExtension.dark.colors.background, Colors.black);
    });

    test('copyWith creates new instance with updated colors', () {
      final theme = ClerkThemeExtension.light;
      const newColors = ClerkThemeColors(
        background: Colors.red,
        altBackground: Colors.grey,
        borderSide: Colors.black,
        text: Colors.black,
        icon: Colors.blue,
        lightweightText: Colors.grey,
        error: Colors.red,
        accent: Colors.purple,
      );
      final newTheme = theme.copyWith(colors: newColors);
      expect(newTheme.colors, newColors);
    });

    test('copyWith preserves colors when not provided', () {
      final theme = ClerkThemeExtension.light;
      final newTheme = theme.copyWith();
      expect(newTheme.colors, theme.colors);
    });

    test('lerp returns this when other is null', () {
      final theme = ClerkThemeExtension.light;
      final result = theme.lerp(null, 0.5);
      expect(result, theme);
    });

    test('lerp interpolates between themes', () {
      final theme1 = ClerkThemeExtension.light;
      final theme2 = ClerkThemeExtension.dark;
      final result = theme1.lerp(theme2, 0.5);
      expect(result, isNotNull);
    });

    test('has borderSide property', () {
      final theme = ClerkThemeExtension.light;
      expect(theme.borderSide, isNotNull);
      expect(theme.borderSide.color, theme.colors.borderSide);
    });

    test('has brightness property', () {
      final lightTheme = ClerkThemeExtension.light;
      expect(lightTheme.brightness, Brightness.light);

      final darkTheme = ClerkThemeExtension.dark;
      expect(darkTheme.brightness, Brightness.dark);
    });

    test('has styles property', () {
      final theme = ClerkThemeExtension.light;
      expect(theme.styles, isNotNull);
    });
  });

  group('ClerkThemeColors', () {
    test('stores all color parameters', () {
      const colors = ClerkThemeColors(
        background: Colors.white,
        altBackground: Colors.grey,
        borderSide: Colors.black,
        text: Colors.black,
        icon: Colors.blue,
        lightweightText: Colors.grey,
        error: Colors.red,
        accent: Colors.purple,
      );
      expect(colors.background, Colors.white);
      expect(colors.altBackground, Colors.grey);
      expect(colors.borderSide, Colors.black);
      expect(colors.text, Colors.black);
      expect(colors.icon, Colors.blue);
      expect(colors.lightweightText, Colors.grey);
      expect(colors.error, Colors.red);
      expect(colors.accent, Colors.purple);
    });

    test('lerp interpolates colors', () {
      const colors1 = ClerkThemeColors(
        background: Colors.white,
        altBackground: Colors.grey,
        borderSide: Colors.black,
        text: Colors.black,
        icon: Colors.blue,
        lightweightText: Colors.grey,
        error: Colors.red,
        accent: Colors.purple,
      );
      const colors2 = ClerkThemeColors(
        background: Colors.black,
        altBackground: Colors.white,
        borderSide: Colors.white,
        text: Colors.white,
        icon: Colors.red,
        lightweightText: Colors.white,
        error: Colors.blue,
        accent: Colors.green,
      );
      final result = colors1.lerp(colors2, 0.5);
      expect(result, isNotNull);
    });
  });

  group('ClerkThemeStyles', () {
    test('defaultStylesBuilder creates styles', () {
      const colors = ClerkThemeColors(
        background: Colors.white,
        altBackground: Colors.grey,
        borderSide: Colors.black,
        text: Colors.black,
        icon: Colors.blue,
        lightweightText: Colors.grey,
        error: Colors.red,
        accent: Colors.purple,
      );
      final styles = ClerkThemeStyles.defaultStylesBuilder(colors);
      expect(styles, isNotNull);
      expect(styles.heading, isNotNull);
      expect(styles.subheading, isNotNull);
      expect(styles.button, isNotNull);
      expect(styles.rowLabel, isNotNull);
    });
  });
}
