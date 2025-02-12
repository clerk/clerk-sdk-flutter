import 'package:clerk_flutter/src/clerk_user_action.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// A row for use in one of the panels expressing an [action]
/// that a user can take
///
class ClerkActionRow extends StatelessWidget {
  /// Construct a [ClerkActionRow]
  const ClerkActionRow({super.key, required this.action});

  /// The [action] to be expressed
  final ClerkUserAction action;

  @override
  Widget build(BuildContext context) {
    final auth = ClerkAuth.of(context, listen: false);
    return Padding(
      padding: allPadding16,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => action.callback(context, auth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClerkIcon(action.asset, size: 16),
            horizontalMargin32,
            Text(action.label, style: ClerkTextStyle.buttonTitleDark),
          ],
        ),
      ),
    );
  }
}
