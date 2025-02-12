import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// Clerk-branded profile navigation tile.
///
@immutable
class ProfileNavTile extends StatelessWidget {
  /// Constructs a const [ProfileNavTile].
  const ProfileNavTile({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
    this.onTap,
  });

  /// The icon to display in the navigation tile.
  final Widget icon;

  /// The title to display in the navigation tile.
  final String title;

  /// Whether the navigation tile is selected.
  final bool selected;

  /// Callback to be invoked when the navigation tile is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius12,
      clipBehavior: Clip.antiAlias,
      color: selected ? ClerkColors.dawnPink : Colors.transparent,
      child: InkWell(
        onTap: () => onTap?.call(),
        child: Padding(
          padding: horizontalPadding14 + verticalPadding16,
          child: Row(
            children: [
              icon,
              horizontalMargin8,
              Text(
                title,
                style: selected
                    ? ClerkTextStyle.subtitle
                        .copyWith(color: ClerkColors.darkJungleGreen)
                    : ClerkTextStyle.subtitle,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
