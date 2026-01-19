import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:flutter/material.dart';

/// Clerk Error Handler
typedef ClerkErrorHandler = FutureOr<void> Function(
  BuildContext context,
  clerk.ClerkError error,
);

/// Widget to display error messages as errors are received
/// from the [ClerkAuthState].
///
/// [ClerkErrorListener] must be placed in the widget tree below both a
/// [ClerkAuth] widget and a [Scaffold]
///
class ClerkErrorListener extends StatefulWidget {
  /// Construct a [ClerkErrorListener] widget
  const ClerkErrorListener({
    super.key,
    this.handler,
    required this.child,
  });

  /// Implement this function to handle errors
  final ClerkErrorHandler? handler;

  /// Child to wrap
  final Widget child;

  @override
  State<ClerkErrorListener> createState() => _ClerkErrorListenerState();
}

class _ClerkErrorListenerState extends State<ClerkErrorListener> {
  StreamSubscription<void>? _errorSub;

  Future<void> _errorHandler(clerk.ClerkError error) async {
    if (widget.handler case ClerkErrorHandler handler) {
      return handler(context, error);
    }
    try {
      final messenger = ScaffoldMessenger.of(context);
      final localizations = ClerkAuth.localizationsOf(context);
      final themeExtension = ClerkAuth.themeExtensionOf(context);
      final message = error.localizedMessage(localizations);
      final controller = messenger.showSnackBar(
        SnackBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          content: Text(
            message,
            style: themeExtension.styles.subheading.copyWith(
              color: themeExtension.colors.background,
            ),
          ),
        ),
      );

      await controller.closed;
    } catch (_) {
      debugPrint(
        'ClerkErrorListener must be placed beneath a ScaffoldMessenger or MaterialApp '
        'in the widget tree and the tree must contain a Scaffold to display errors, '
        'or a handler provided.',
      );
      rethrow;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _errorSub?.cancel();
    _errorSub = ClerkAuth.errorStreamOf(context) //
        .asyncMap(_errorHandler)
        .listen(null);
  }

  @override
  void dispose() {
    _errorSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
