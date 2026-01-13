import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// Style of [ClerkMaterialButton].
///
enum ClerkMaterialButtonStyle {
  /// light
  light,

  /// dark
  dark;
}

/// A reusable and Clerk themed [MaterialButton].
///
@immutable
class ClerkMaterialButton extends StatelessWidget {
  /// Constructs a new [ClerkMaterialButton].
  const ClerkMaterialButton({
    super.key,
    this.onPressed,
    required this.label,
    this.style = ClerkMaterialButtonStyle.dark,
    this.elevation = 2.0,
    this.square = false,
    this.height = 32,
  });

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// [Widget] to be displayed in button.
  final Widget label;

  /// Light or dark styled button.
  final ClerkMaterialButtonStyle style;

  /// Elevation creating shadow effect.
  final double elevation;

  /// Should the button be square?
  final bool square;

  /// height of the button
  final double height;

  @override
  Widget build(BuildContext context) {
    final dark = style == ClerkMaterialButtonStyle.dark;
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    final color =
        dark ? themeExtension.colors.accent : themeExtension.colors.background;
    final textColor =
        dark ? themeExtension.colors.background : themeExtension.colors.text;
    final child = DefaultTextStyle(
      style: themeExtension.styles.button.copyWith(color: textColor),
      child: IconTheme(
        data: IconThemeData(color: textColor, size: 16.0),
        child: Padding(
          padding: horizontalPadding4,
          child: label,
        ),
      ),
    );

    return SizedBox(
      height: height,
      width: square ? height : null,
      child: FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(color),
          foregroundColor: WidgetStateProperty.all(textColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height / 6),
              side: themeExtension.borderSide,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
