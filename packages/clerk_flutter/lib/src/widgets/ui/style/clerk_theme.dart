import 'package:flutter/material.dart';

const _lightColors = ClerkThemeColors(
  background: Colors.white,
  altBackground: Color(0xFFdddddd),
  borderSide: Color(0xFFdddddd),
  text: Color(0xFF3c3c3d),
  lightweightText: Color(0xFF5e5f6e),
  error: Color(0xFFff3333),
  link: Color(0xFF0066ff),
);

const _darkColors = ClerkThemeColors(
  background: Colors.black,
  altBackground: Color(0xFF333333),
  borderSide: Color(0xFF333333),
  text: Colors.white,
  lightweightText: Color(0xFFdddddd),
  error: Color(0xFFff3333),
  link: Color(0xFF0066ff),
);

/// Builder for styles object
///
typedef ClerkThemeStylesBuilder = ClerkThemeStyles Function(
  ClerkThemeColors colors,
);

/// An extension for the Clerk theme
///
class ClerkThemeExtension extends ThemeExtension<ClerkThemeExtension> {
  /// Constructor
  ClerkThemeExtension({
    required this.colors,
    this.stylesBuilder = ClerkThemeStyles.defaultStylesBuilder,
  });

  /// Colors to be used by the theme
  final ClerkThemeColors colors;

  /// Styles to be used by the theme
  late final ClerkThemeStyles styles = stylesBuilder(colors);

  /// Border side
  late final borderSide = BorderSide(width: 0.5, color: colors.borderSide);

  /// Builder for styles
  final ClerkThemeStylesBuilder stylesBuilder;

  @override
  ClerkThemeExtension copyWith({
    ClerkThemeColors? colors,
    ClerkThemeStylesBuilder? stylesBuilder,
  }) {
    return ClerkThemeExtension(
      colors: colors ?? this.colors,
      stylesBuilder: stylesBuilder ?? this.stylesBuilder,
    );
  }

  @override
  ClerkThemeExtension lerp(
    covariant ClerkThemeExtension? other,
    double t,
  ) {
    if (other case ClerkThemeExtension other) {
      return ClerkThemeExtension(
        colors: colors.lerp(other.colors, t),
        stylesBuilder: t < 0.5 ? stylesBuilder : other.stylesBuilder,
      );
    }
    return this;
  }

  /// Light theme
  static final light = ClerkThemeExtension(colors: _lightColors);

  /// Dark theme
  static final dark = ClerkThemeExtension(colors: _darkColors);
}

/// Colors to be used by the theme
///
class ClerkThemeColors {
  /// Constructor
  const ClerkThemeColors({
    required this.background,
    required this.altBackground,
    required this.borderSide,
    required this.text,
    required this.lightweightText,
    required this.error,
    required this.link,
  });

  /// background color
  final Color background;

  /// alternate background color
  final Color altBackground;

  /// border side color
  final Color borderSide;

  /// text color
  final Color text;

  /// lightweight text color
  final Color lightweightText;

  /// error color
  final Color error;

  /// link color
  final Color link;

  /// lerp
  ClerkThemeColors lerp(ClerkThemeColors other, double t) {
    return ClerkThemeColors(
      background: Color.lerp(background, other.background, t)!,
      altBackground: Color.lerp(altBackground, other.altBackground, t)!,
      borderSide: Color.lerp(borderSide, other.borderSide, t)!,
      text: Color.lerp(text, other.text, t)!,
      lightweightText: Color.lerp(lightweightText, other.lightweightText, t)!,
      error: Color.lerp(error, other.error, t)!,
      link: Color.lerp(link, other.link, t)!,
    );
  }
}

/// Text styles used by Clerk furniture
///
class ClerkThemeStyles {
  /// Constructor
  ClerkThemeStyles({required ClerkThemeColors colors}) : _colors = colors;

  /// Default builder
  factory ClerkThemeStyles.defaultStylesBuilder(ClerkThemeColors colors) =>
      ClerkThemeStyles(colors: colors);

  /// Colors to be used by the theme
  final ClerkThemeColors _colors;

  /// headings
  late final heading = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: _colors.text,
  );

  /// subheadings
  late final subheading = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: _colors.text,
  );

  /// avatar initials
  late final avatarInitials = TextStyle(
    fontSize: 14.0,
    color: _colors.background,
    letterSpacing: 1,
    height: 1.2,
  );

  /// input field labels
  late final inputText = TextStyle(
    fontSize: 14.0,
    color: _colors.text,
    letterSpacing: 0.1,
    height: 1.2,
  );

  /// errors
  late final error = TextStyle(
    fontSize: 14.0,
    color: _colors.error,
  );

  /// text
  late final text = TextStyle(
    fontSize: 12,
    color: _colors.text,
  );

  /// subtext
  late final subtext = TextStyle(
    fontSize: 10.0,
    color: _colors.lightweightText,
  );

  /// clickable text
  late final clickableText = text.copyWith(
    color: _colors.link,
  );

  /// row labels
  late final rowLabel = TextStyle(
    fontSize: 5.0,
    height: 1.3,
    color: _colors.text,
  );

  /// button text
  late final button = text.copyWith(
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );
}
