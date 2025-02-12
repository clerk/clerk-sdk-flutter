import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Clerk-branded two-panel view.
///
@immutable
class ClerkTwoPanelView extends StatelessWidget {
  ///Constructs a const [ClerkTwoPanelView].
  const ClerkTwoPanelView({
    super.key,
    required this.firstChild,
    required this.secondChild,
  });

  /// The child of the first panel.
  final Widget firstChild;

  /// The child of the second panel.
  final Widget secondChild;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius12,
      clipBehavior: Clip.antiAlias,
      color: ClerkColors.lightGrey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: firstChild,
                ),
                Padding(
                  padding: leftPadding24 + bottomPadding16,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 14.0,
                      width: 121.46,
                      child: SvgPicture.asset(
                        ClerkAssets.securedByClerkLogo,
                        package: 'clerk_flutter',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Material(
              borderRadius: borderRadius12,
              clipBehavior: Clip.antiAlias,
              color: ClerkColors.white,
              elevation: 1.0,
              shadowColor: ClerkColors.seashell,
              child: secondChild,
            ),
          ),
        ],
      ),
    );
  }
}
