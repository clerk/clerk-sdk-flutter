import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:flutter/material.dart';

import 'clerk_ui.dart';

/// [ClerkAvatar] shows a user image, or the user's initials
///
class ClerkAvatar extends StatelessWidget {
  /// Construct a [ClerkAvatar]
  const ClerkAvatar({
    super.key,
    required this.user,
    this.diameter = 32,
    this.file,
  });

  /// the [clerk.User] object
  final clerk.User user;

  /// the diameter of the avatar
  final double diameter;

  /// an override file location
  final File? file;

  Widget _child() {
    if (file case File file) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(diameter / 2),
        child: Image.file(
          file,
          width: diameter,
          height: diameter,
          fit: BoxFit.cover,
        ),
      );
    }

    if (user.imageUrl case String imageUrl) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(diameter / 2),
        child: Image.network(
          imageUrl,
          width: diameter,
          height: diameter,
          fit: BoxFit.cover,
        ),
      );
    }

    return Text(user.name.initials, style: ClerkTextStyle.subtitleDark);
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: diameter / 2,
      backgroundColor: ClerkColors.mountainMist,
      child: _child(),
    );
  }
}
