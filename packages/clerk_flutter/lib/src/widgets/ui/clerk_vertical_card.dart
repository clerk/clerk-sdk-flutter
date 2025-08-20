import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
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
  });

  /// Widget to be displayed in the elevated top card in the stack.
  final Widget topPortion;

  /// Widget to be displayed in the bottom card of the stack. Typically branding and a
  /// text based c.t.a.
  final Widget bottomPortion;

  @override
  Widget build(BuildContext context) {
    final displayConfig = ClerkAuth.displayConfigOf(context);
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: borderRadius12,
        boxShadow: [
          BoxShadow(
            color: ClerkColors.dropShadowGrey,
            offset: Offset(0.0, 6.0),
            blurRadius: 12,
          )
        ],
      ),
      child: Material(
        borderRadius: borderRadius12,
        clipBehavior: Clip.antiAlias,
        color: ClerkColors.lightGrey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                borderRadius: borderRadius6,
                clipBehavior: Clip.antiAlias,
                color: ClerkColors.white,
                elevation: 1.0,
                shadowColor: ClerkColors.seashell,
                child: topPortion,
              ),
              bottomPortion,
              if (displayConfig.branded) ...[
                const Divider(
                  color: ClerkColors.seashell,
                  thickness: 2.0,
                  height: 2.0,
                ),
                verticalMargin12,
                Center(
                  child: SvgPicture.asset(
                    ClerkAssets.securedByClerkLogo,
                    package: 'clerk_flutter',
                  ),
                ),
                verticalMargin12,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
