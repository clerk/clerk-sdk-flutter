import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Typedef for builder invoked by [ClerkAuthBuilder]
typedef AuthWidgetBuilder = Widget Function(
  BuildContext context,
  ClerkAuthProvider auth,
);

/// A [Widget] which builds its subtree in the context of a [ClerkAuthProvider]
///
/// the [signedInBuilder] will be invoked when a [clerk.User] is available
/// the [signedOutBuilder] will be invoked when a [clerk.User] is not available
/// the [builder] will be invoked if neither of the other two are present
///
class ClerkAuthBuilder extends TelemetricStatelessWidget {
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
  Map<String, dynamic> toJson() => {
        'signed_in_builder': signedInBuilder is AuthWidgetBuilder,
        'signed_out_builder': signedOutBuilder is AuthWidgetBuilder,
        'builder': builder is AuthWidgetBuilder,
      };

  @override
  Widget build(BuildContext context) {
    final auth = ClerkAuth.of(context);
    final user = auth.client.user;

    if (signedInBuilder case var signedInBuilder? when user is clerk.User) {
      return signedInBuilder(context, auth);
    }

    if (signedOutBuilder case var signedOutBuilder? when user is! clerk.User) {
      return signedOutBuilder(context, auth);
    }

    return builder?.call(context, auth) ?? emptyWidget;
  }
}
