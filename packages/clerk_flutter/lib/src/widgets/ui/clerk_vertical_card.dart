import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/widgets/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The [ClerkVerticalCard] will provide a reusable frame for Clerk branded Widgets with a
/// vertical layout.
@immutable
class ClerkVerticalCard extends StatelessWidget {
  /// Constructs a new [ClerkVerticalCard].
  const ClerkVerticalCard({
    super.key,
    required this.topPortion,
    this.bottomPortion = emptyWidget,
    this.middlePortion,
  });

  /// Widget to be displayed in the elevated top card in the stack.
  final Widget topPortion;

  /// Widget to be displayed under the topPortion
  final Widget? middlePortion;

  /// Widget to be displayed in the bottom card of the stack. Typically branding and a
  /// text based c.t.a.
  final Widget bottomPortion;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius12,
      clipBehavior: Clip.antiAlias,
      color: ClerkColors.lightGrey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              borderRadius: borderRadius12,
              clipBehavior: Clip.antiAlias,
              color: ClerkColors.white,
              elevation: 1.0,
              shadowColor: ClerkColors.seashell,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  topPortion,
                  if (middlePortion case Widget middlePortion) //
                    middlePortion,
                ],
              ),
            ),
            bottomPortion,
            const Divider(
              color: ClerkColors.seashell,
              thickness: 2.0,
              height: 2.0,
            ),
            verticalMargin12,
            Center(
              child: SizedBox(
                height: 14.0,
                width: 121.46,
                child: SvgPicture.asset(ClerkAssets.securedByClerkLogo,
                    package: 'clerk_flutter'),
              ),
            ),
            verticalMargin12,
          ],
        ),
      ),
    );
  }
}
