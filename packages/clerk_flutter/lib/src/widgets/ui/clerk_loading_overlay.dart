import 'dart:async';

import 'package:clerk_flutter/src/utils/clerk_auth_config.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/widgets.dart';

/// Clerk Loading Overlay
class ClerkLoadingOverlay {
  /// Constructs a [ClerkLoadingOverlay]
  ClerkLoadingOverlay(ClerkAuthConfig config)
      : _overlayEntry = OverlayEntry(
          builder: (context) => config.loading ?? defaultLoadingWidget,
        );

  static const _startupDuration = Duration(milliseconds: 300);
  static const _minimumOnScreenDuration = Duration(milliseconds: 500);

  Timer? _startupTimer;
  Timer? _cancelTimer;
  DateTime _cancelAfter = DateTime(0);

  final OverlayEntry _overlayEntry;

  /// Shows the loading overlay
  void insertInto(OverlayState overlay) {
    _cancelTimer?.cancel();
    _cancelTimer = null;
    if (_overlayEntry.mounted == false && _startupTimer == null) {
      _startupTimer = Timer(
        _startupDuration,
        () {
          if (overlay.context.mounted) {
            overlay.insert(_overlayEntry);
            _cancelAfter = DateTime.timestamp().add(_minimumOnScreenDuration);
          }
        },
      );
    }
  }

  /// Hides the loading overlay
  void remove() {
    _startupTimer?.cancel();
    _startupTimer == null;

    _cancelTimer?.cancel();
    _cancelTimer = null;

    if (_overlayEntry.mounted) {
      final now = DateTime.timestamp();
      if (_cancelAfter.isAfter(now)) {
        _cancelTimer = Timer(
          _cancelAfter.difference(now),
          () {
            _cancelTimer = null;
            _overlayEntry.remove();
          },
        );
      } else {
        _overlayEntry.remove();
      }
    }
  }
}
