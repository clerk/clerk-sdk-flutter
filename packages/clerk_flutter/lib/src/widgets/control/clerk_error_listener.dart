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
    this.errorStream,
    required this.child,
  });

  /// Implement this function to handle errors
  final ClerkErrorHandler? handler;

  /// Optionals stream to listen for errors on, so that consuming app
  /// can interrogate errors as they occur as well as the standard
  /// Clerk UI applying
  final StreamController<clerk.ClerkError>? errorStream;

  /// Child to wrap
  final Widget child;

  @override
  State<ClerkErrorListener> createState() => _ClerkErrorListenerState();
}

class _ClerkErrorListenerState extends State<ClerkErrorListener> {
  late final StreamController<clerk.ClerkError> _errorStream =
      widget.errorStream ?? StreamController<clerk.ClerkError>.broadcast();
  late final StreamSubscription<void> _errorSub;

  @override
  void initState() {
    super.initState();
    _errorSub = _errorStream.stream.asyncMap(_errorHandler).listen(null);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ClerkAuth.of(context, listen: false).setErrorSink(_errorStream);
  }

  @override
  void dispose() {
    _errorSub.cancel();
    if (widget.errorStream == null) {
      // we created this error stream, so we should close it
      _errorStream.close();
    }
    super.dispose();
  }

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
  Widget build(BuildContext context) => widget.child;
}
