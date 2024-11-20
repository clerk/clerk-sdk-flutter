import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/common.dart';
import 'package:flutter/material.dart';

import 'clerk_auth.dart';

typedef AuthWidgetBuilder = Widget Function(
    BuildContext context, ClerkAuthProvider auth);

class ClerkAuthBuilder extends StatelessWidget {
  const ClerkAuthBuilder({
    super.key,
    this.signedInBuilder,
    this.signedOutBuilder,
    this.builder,
  });

  final AuthWidgetBuilder? signedInBuilder;
  final AuthWidgetBuilder? signedOutBuilder;
  final AuthWidgetBuilder? builder;

  @override
  Widget build(BuildContext context) {
    final auth = ClerkAuth.of(context);
    final user = auth.client.user;

    if (signedInBuilder case AuthWidgetBuilder signedInBuilder
        when user is clerk.User) {
      return signedInBuilder.call(context, auth);
    } else if (signedOutBuilder case AuthWidgetBuilder signedOutBuilder
        when user is! clerk.User) {
      return signedOutBuilder.call(context, auth);
    } else if (builder case AuthWidgetBuilder builder) {
      return builder.call(context, auth);
    }

    return emptyWidget;
  }
}
