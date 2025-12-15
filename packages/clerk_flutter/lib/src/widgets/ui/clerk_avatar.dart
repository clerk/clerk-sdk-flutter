import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_cached_image.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/clerk_theme.dart';
import 'package:flutter/material.dart';

/// [ClerkAvatar] shows a user image, or the user's initials
///
class ClerkAvatar extends StatelessWidget {
  /// Construct a [ClerkAvatar]
  const ClerkAvatar({
    super.key,
    this.name,
    this.imageUrl,
    this.diameter = 32,
    this.file,
    this.borderRadius,
  });

  /// the name
  final String? name;

  /// the imageUrl
  final String? imageUrl;

  /// the diameter of the avatar
  final double diameter;

  /// an override file location
  final File? file;

  /// A [BorderRadius] for non-circular avatars
  final BorderRadius? borderRadius;

  Widget _child(ClerkThemeExtension themeExtension) {
    if (file case File file) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(diameter / 2),
        child: Image.file(
          file,
          width: diameter,
          height: diameter,
          fit: BoxFit.cover,
        ),
      );
    }

    if (imageUrl case String imageUrl when imageUrl.isNotEmpty) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(diameter / 2),
        child: ClerkCachedImage(
          imageUrl,
          width: diameter,
          height: diameter,
          fit: BoxFit.cover,
        ),
      );
    }

    return SizedBox.square(
      dimension: diameter,
      child: name is String && name!.isNotEmpty
          ? Center(
              child: Text(name!.initials,
                  style: themeExtension.styles.avatarInitials),
            )
          : emptyWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(diameter / 2),
        color: themeExtension.colors.text,
      ),
      child: _child(themeExtension),
    );
  }
}
