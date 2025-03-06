import 'dart:async';

import 'package:clerk_flutter/src/clerk_auth_state.dart';
import 'package:flutter/material.dart';

/// Class to hold details of user actions available
/// from the UI.
///
class ClerkUserAction {
  /// Construct a [ClerkUserAction]
  const ClerkUserAction({
    required this.label,
    required this.callback,
    this.icon,
    this.asset,
  });

  /// The icon for this action as an SVG asset
  final String? asset;

  /// The icon for this action as an [IconData]
  final IconData? icon;

  /// The label for this action
  final String label;

  /// The callback to be invoked when tapped
  final FutureOr<void> Function(BuildContext, ClerkAuthState) callback;
}
