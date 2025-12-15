import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_cached_image.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';

/// A Generic header widget for use across the Clerk UI
///
@immutable
class ClerkPanelHeader extends StatelessWidget {
  /// Constructor for [ClerkPanelHeader]
  const ClerkPanelHeader({
    super.key,
    this.subtitle,
    this.title,
    this.padding = horizontalPadding24,
  });

  /// The title, if other than the app title
  final String? title;

  /// Subtitle if required
  final String? subtitle;

  /// Padding around the content
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final display = ClerkAuth.displayConfigOf(context);
    final themeExtension = ClerkAuth.themeExtensionOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: verticalPadding24,
          child: Center(
            child: SizedBox(
              height: 32.0,
              child: display.logoUrl?.isNotEmpty == true
                  ? ClerkCachedImage(display.logoUrl!)
                  : defaultOrgLogo,
            ),
          ),
        ),
        Padding(
          padding: padding,
          child: Text(
            title ?? display.applicationName,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: themeExtension.styles.heading,
          ),
        ),
        if (subtitle case String subtitle) //
          Padding(
            padding: padding,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: themeExtension.styles.subheading,
            ),
          ),
        verticalMargin24,
      ],
    );
  }
}
