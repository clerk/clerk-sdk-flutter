import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

/// Clerk Error Handler
typedef ClerkErrorHandler = FutureOr<void> Function(
  BuildContext context,
  AuthError error,
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
    this.handler = defaultErrorHandler,
    required this.child,
  });

  /// Implement this function to handle errors
  final ClerkErrorHandler handler;

  /// Child to wrap
  final Widget child;

  /// Default Error Handler
  static void defaultErrorHandler(
    BuildContext context,
    AuthError error,
  ) {
    final localizations = ClerkAuth.localizationsOf(context);
    final message = error.localizedMessage(localizations);

    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) {
      if (kDebugMode) {
        debugPrint(
          'Warning: no ScaffoldMessenger found '
          'to display error: $message',
        );
      }
      return;
    }

    messenger.showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        content: Text(
          message,
          style: ClerkTextStyle.subtitle.copyWith(
            color: ClerkColors.white,
          ),
        ),
      ),
    );
  }

  @override
  State<ClerkErrorListener> createState() => _ClerkErrorListenerState();
}

class _ClerkErrorListenerState extends State<ClerkErrorListener> {
  late StreamSubscription<void> _errorSub;

  @override
  void initState() {
    super.initState();
    _errorSub = ClerkAuth.errorStreamOf(context)
        // This does not apply here, as this subscription only exists whilst
        // the context is mounted
        // ignore: use_build_context_synchronously
        .asyncMap((error) => widget.handler(context, error))
        .listen(null);
  }

  @override
  void dispose() {
    _errorSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
