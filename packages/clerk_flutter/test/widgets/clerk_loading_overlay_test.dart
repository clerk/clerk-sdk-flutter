import 'dart:async';

import 'package:clerk_flutter/src/utils/clerk_auth_config.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_loading_overlay.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_overlay_host.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

const startupDuration = ClerkLoadingOverlay.startupDuration;
const minOnScreenTime = ClerkLoadingOverlay.minimumOnScreenDuration;
const delayCushion = Duration(milliseconds: 100);

extension on DateTime {
  static const _marginOfError = Duration(milliseconds: 25);

  bool isRoundAbout(DateTime other) => difference(other).abs() < _marginOfError;

  int operator -(DateTime other) => difference(other).inMilliseconds;
}

void expectThat(bool result, {String? reason}) =>
    expect(result, true, reason: reason);

void main() {
  group('ClerkLoadingOverlay:', () {
    const config = ClerkAuthConfig(publishableKey: 'NOT A KEY');
    final overlayEntry = ClerkLoadingOverlay(config);

    test('can show and hide a loading overlay in a timely fashion', () async {
      final startTime = DateTime.timestamp();
      final displayCompleter = Completer<DateTime>();
      final hideCompleter = Completer<DateTime>();

      final overlay = _TestOverlayHostState(
        onDisplay: (entries) => displayCompleter.complete(DateTime.timestamp()),
        onHide: (entries) => hideCompleter.complete(DateTime.timestamp()),
      );

      overlayEntry.insertInto(overlay);
      final displayTime = await displayCompleter.future;

      overlayEntry.removeFrom(overlay);
      final hideTime = await hideCompleter.future;

      final expectedDisplayTime = startTime.add(startupDuration);
      final expectedHideTime = displayTime.add(minOnScreenTime);

      expectThat(
        displayTime.isRoundAbout(expectedDisplayTime),
        reason:
            'Not displayed at right time: ${expectedDisplayTime - displayTime}ms out',
      );

      expectThat(
        hideTime.isRoundAbout(expectedHideTime),
        reason:
            'Not hidden at right time: ${expectedHideTime - hideTime}ms out',
      );
    });

    test('will show nothing if cancelled before being shown', () async {
      bool displayAttempted = false;
      bool hideAttempted = false;

      final overlay = _TestOverlayHostState(
        onDisplay: (entries) => displayAttempted = true,
        onHide: (entries) => hideAttempted = true,
      );

      overlayEntry.insertInto(overlay);

      // shorter time than required to show the overlay
      await Future.delayed(startupDuration - delayCushion);

      overlayEntry.removeFrom(overlay);

      // more than enough time for it to have been inserted and removed
      await Future.delayed(startupDuration + minOnScreenTime + delayCushion);

      expect(displayAttempted, false, reason: 'Display shouldn’t be attempted');
      expect(hideAttempted, false, reason: 'Hide shouldn’t be attempted');
    });

    test('will stay on screen for multiple overlapping calls', () async {
      int displayCount = 0;
      int hideCount = 0;

      DateTime? hideTime;

      final overlay = _TestOverlayHostState(
        onDisplay: (entries) {
          displayCount++;
          expectThat(
            entries.length == 1,
            reason: 'Wrong number of entries on display: ${entries.length}',
          );
        },
        onHide: (entries) {
          hideCount++;
          hideTime = DateTime.timestamp();
          expectThat(
            entries.isEmpty,
            reason: 'Wrong number of entries on hide: ${entries.length}',
          );
        },
      );

      overlayEntry.insertInto(overlay);

      // shorter time than required to show the overlay
      await Future.delayed(startupDuration - delayCushion);

      overlayEntry.insertInto(overlay);

      await Future.delayed(startupDuration - delayCushion);
      overlayEntry.removeFrom(overlay);

      // time for it to have been inserted
      // but not yet removed
      await Future.delayed(startupDuration);

      overlayEntry.insertInto(overlay);

      await Future.delayed(startupDuration - delayCushion);
      overlayEntry.removeFrom(overlay);

      await Future.delayed(startupDuration - delayCushion);
      overlayEntry.removeFrom(overlay);

      expectThat(
        displayCount == 1,
        reason: 'Wrong number of display insertions: $displayCount',
      );

      expectThat(
        hideCount == 1,
        reason: 'Wrong number of display insertions: $displayCount',
      );

      final now = DateTime.timestamp();
      expectThat(
        hideTime!.isRoundAbout(now),
        reason: 'Not hidden at right time: ${now - hideTime!}ms out',
      );
    });
  });
}

class _TestOverlayHost extends StatefulWidget {
  const _TestOverlayHost();

  @override
  State<_TestOverlayHost> createState() => _TestOverlayHostState();
}

class _TestOverlayHostState extends State<_TestOverlayHost>
    implements ClerkOverlay<_TestOverlayHost> {
  _TestOverlayHostState({this.onDisplay, this.onHide});

  final overlays = <Widget>[];

  final ValueChanged<List<Widget>>? onDisplay;
  final ValueChanged<List<Widget>>? onHide;

  @override
  void insert(Widget overlay) {
    overlays.add(overlay);
    onDisplay?.call(overlays.toList());
  }

  @override
  void remove(Widget overlay) {
    overlays.remove(overlay);
    onHide?.call(overlays.toList());
  }

  @override
  bool isDisplaying(Widget overlay) => overlays.contains(overlay);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
