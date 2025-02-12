import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A Clerk-branded icon.
///
/// To be used with [ClerkAssets].
///
@immutable
class ClerkIcon extends StatelessWidget {
  /// Constructs a const [ClerkIcon].
  const ClerkIcon(this.assetName, {super.key, this.size = 12.0});

  /// The size of the icon.
  final double size;

  /// The asset name of the icon.
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: size,
      width: size,
      package: 'clerk_flutter',
    );
  }
}
