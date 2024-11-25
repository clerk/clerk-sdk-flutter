import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:flutter/widgets.dart';

/// A Clerk-branded text style.
///
/// This class provides a set of Clerk-branded text styles that can be used to
/// style text in widgets.
class ClerkTextStyle {
  const ClerkTextStyle._();

  /// The Clerk-branded text style for headings.
  static const title = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: ClerkColors.darkJungleGreen,
  );

  /// The Clerk-branded text style for subheadings.
  static const subtitle = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.stormGrey,
  );

  /// The Clerk-branded text style for button titles.
  static const buttonTitle = TextStyle(
    fontSize: 12.0,
    color: ClerkColors.stormGrey,
  );

  /// The Clerk-branded text style for button subtitles.
  static const buttonSubtitle = TextStyle(
    fontSize: 10.0,
    color: ClerkColors.midGrey,
  );

  /// The Clerk-branded text style for subheadings in the user profile widget.
  static const subtitleDark = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.darkJungleGreen,
  );

  /// The Clerk-branded text style for input field labels.
  static const inputLabel = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.darkJungleGreen,
  );

  /// The Clerk-branded text style for user button titles.
  static const userButtonTitle = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.midGrey,
  );

  /// The Clerk-branded text style for user button subtitles.
  static const userButtonSubtitle = TextStyle(
    fontSize: 12.0,
    color: ClerkColors.mountainMist,
  );

  /// The Clerk-branded text style for errors.
  static const error = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.incarnadine,
  );
}
