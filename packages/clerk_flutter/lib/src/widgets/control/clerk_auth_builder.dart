import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
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
    this.signingInBuilder,
    this.signingUpBuilder,
    this.builder,
  });

  /// Builder to be invoked when a [clerk.User] is available
  final AuthWidgetBuilder? signedInBuilder;

  /// Builder to be invoked when a [clerk.User] is not available
  final AuthWidgetBuilder? signedOutBuilder;

  /// Builder to be invoked when signing in
  final AuthWidgetBuilder? signingInBuilder;

  /// Builder to be invoked when signing up
  final AuthWidgetBuilder? signingUpBuilder;

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
      'user_is_signed_in': telemetryAuth.user is clerk.User,
      'signed_in_builder': widget.signedInBuilder is AuthWidgetBuilder,
      'signed_out_builder': widget.signedOutBuilder is AuthWidgetBuilder,
      'builder': widget.builder is AuthWidgetBuilder,
    };
  }

  @override
  Widget build(BuildContext context) {
    final auth = ClerkAuth.of(context);

    if (auth.client.user is clerk.User) {
      if (widget.signedInBuilder case final signedInBuilder?) {
        return signedInBuilder(context, auth);
      }
    } else {
      if (widget.signingInBuilder case final signingInBuilder?
          when auth.isSigningIn) {
        return signingInBuilder(context, auth);
      }

      if (widget.signingUpBuilder case final signingUpBuilder?
          when auth.isSigningUp) {
        return signingUpBuilder(context, auth);
      }

      if (widget.signedOutBuilder case final signedOutBuilder?) {
        return signedOutBuilder(context, auth);
      }
    }

    return widget.builder?.call(context, auth) ?? emptyWidget;
  }
}
