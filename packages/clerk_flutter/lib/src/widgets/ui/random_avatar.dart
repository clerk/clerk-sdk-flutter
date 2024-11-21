import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// An avatar for testing purposes.
///
/// Will generate a random avatar based on the provided seed.
///
@immutable
class RandomAvatar extends StatelessWidget {
  /// Constructs a new [RandomAvatar].
  const RandomAvatar({super.key, required this.seed, this.size = 28.0});

  /// The seed to use for generating the avatar.
  final String seed;

  /// The size of the avatar.
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircleAvatar(
        backgroundColor: ClerkColors.brightGrey,
        radius: size / 2.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size),
          child: SvgPicture.network(
            'https://api.dicebear.com/9.x/dylan/svg?seed=$seed',
          ),
        ),
      ),
    );
  }
}
