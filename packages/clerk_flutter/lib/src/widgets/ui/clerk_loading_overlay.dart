import 'dart:async';

import 'package:clerk_flutter/src/utils/clerk_auth_config.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/widgets.dart';

/// Abstract class proxying [OverlayState]
abstract class AbstractClerkOverlayState {
  /// Insert an [OverlayEntry]
  void insert(OverlayEntry entry);

  /// Remove an [OverlayEntry]
  void remove(OverlayEntry entry);

  /// Is the [OverlayEntry] on display?
  bool isDisplaying(OverlayEntry entry);

  /// Is this [AbstractClerkOverlayState] mounted?
  bool get mounted;
}

/// UI instantiation of [AbstractClerkOverlayState]
class ClerkOverlay extends AbstractClerkOverlayState {
  /// Construct a [ClerkOverlay]
  ClerkOverlay._(this._overlay);

  final OverlayState _overlay;

  @override
  void insert(OverlayEntry entry) => _overlay.insert(entry);

  @override
  void remove(OverlayEntry entry) => entry.remove();

  @override
  bool isDisplaying(OverlayEntry entry) => entry.mounted;

  @override
  bool get mounted => _overlay.context.mounted;

  /// Find the [ClerkOverlay]
  static of(BuildContext context) => ClerkOverlay._(Overlay.of(context));
}

/// Clerk Loading Overlay
class ClerkLoadingOverlay {
  /// Constructs a [ClerkLoadingOverlay]
  ClerkLoadingOverlay(ClerkAuthConfig config)
      : _overlayEntry = OverlayEntry(
          builder: (context) => config.loading ?? defaultLoadingWidget,
        );

  /// The delay between an [insertInto] call and the loading overlay
  /// being displayed
  static const startupDuration = Duration(milliseconds: 300);

  /// The minimum amount of time the loading overlay should remain
  /// on screen for
  static const minimumOnScreenDuration = Duration(milliseconds: 500);

  /// The number of [ClerkLoadingOverlay] requests that are currently
  /// pending
  int count = 0;

  Timer? _displayTimer;
  Timer? _hideTimer;
  DateTime _hideAfter = DateTime(0);

  final OverlayEntry _overlayEntry;

  /// Shows the loading overlay
  void insertInto(AbstractClerkOverlayState overlay) {
    if (++count == 1) {
      _hideTimer?.cancel();
      _hideTimer = null;
      _displayTimer ??= Timer(
        startupDuration,
        () {
          if (overlay.mounted && overlay.isDisplaying(_overlayEntry) == false) {
            _hideAfter = DateTime.timestamp().add(minimumOnScreenDuration);
            overlay.insert(_overlayEntry);
          }
        },
      );
    }
  }

  /// Hides the loading overlay
  void removeFrom(AbstractClerkOverlayState overlay) {
    if (count > 0 && --count == 0) {
      _displayTimer?.cancel();
      _displayTimer = null;

      if (_hideTimer == null && overlay.isDisplaying(_overlayEntry)) {
        final now = DateTime.timestamp();
        if (_hideAfter.isAfter(now)) {
          _hideTimer = Timer(
            _hideAfter.difference(now),
            () {
              _hideTimer = null;
              overlay.remove(_overlayEntry);
            },
          );
        } else {
          overlay.remove(_overlayEntry);
        }
      }
    }
  }
}
