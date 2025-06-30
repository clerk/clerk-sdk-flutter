import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
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
    this.padding = horizontalPadding48,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: verticalPadding24,
          child: Center(
            child: SizedBox.square(
              dimension: 32.0,
              child: display.logoUrl?.isNotEmpty == true
                  ? Image.network(display.logoUrl!)
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
            style: ClerkTextStyle.title,
          ),
        ),
        if (subtitle case String subtitle) //
          Padding(
            padding: padding,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: ClerkTextStyle.subtitle,
            ),
          ),
        verticalMargin24,
      ],
    );
  }
}
