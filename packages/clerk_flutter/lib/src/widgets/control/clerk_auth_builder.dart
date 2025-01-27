import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Typedef for builder invoked by [ClerkAuthBuilder]
typedef AuthWidgetBuilder = Widget Function(
    BuildContext context, ClerkAuthState authState);

/// A [Widget] which builds its subtree in the context of a [ClerkAuthState]
///
/// the [signedInBuilder] will be invoked when a [clerk.User] is available
/// the [signedOutBuilder] will be invoked when a [clerk.User] is not available
/// the [builder] will be invoked if neither of the other two are present
///
class ClerkAuthBuilder extends StatefulWidget {
  /// Construct a [ClerkAuthBuilder]
  const ClerkAuthBuilder({
    super.key,
    this.signedInBuilder,
    this.signedOutBuilder,
    this.builder,
  });

  /// Builder to be invoked when a [clerk.User] is available
  final AuthWidgetBuilder? signedInBuilder;

  /// Builder to be invoked when a [clerk.User] is not available
  final AuthWidgetBuilder? signedOutBuilder;

  /// Builder to be invoked when neither other builder is available
  final AuthWidgetBuilder? builder;

  @override
  State<ClerkAuthBuilder> createState() => _ClerkAuthBuilderState();
}

class _ClerkAuthBuilderState extends State<ClerkAuthBuilder>
    with ClerkTelemetryStateMixin {
  @override
  Map<String, dynamic> get telemetryPayload {
    return {
      if (mounted) //
        'user_is_signed_in': ClerkAuth.of(context).user is clerk.User,
      'signed_in_builder': widget.signedInBuilder is AuthWidgetBuilder,
      'signed_out_builder': widget.signedOutBuilder is AuthWidgetBuilder,
      'builder': widget.builder is AuthWidgetBuilder,
    };
  }

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final user = authState.client.user;

    if (widget.signedInBuilder case AuthWidgetBuilder signedInBuilder
        when user is clerk.User) {
      return signedInBuilder(context, authState);
    }

    if (widget.signedOutBuilder case AuthWidgetBuilder signedOutBuilder
        when user is! clerk.User) {
      return signedOutBuilder(context, authState);
    }

    return widget.builder?.call(context, authState) ?? emptyWidget;
  }
}
