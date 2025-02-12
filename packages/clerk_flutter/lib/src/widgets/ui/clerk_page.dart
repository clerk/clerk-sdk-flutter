import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:flutter/material.dart';

/// Sign in to an additional account
class ClerkPage extends StatelessWidget {
  /// Construct a [ClerkPage]
  const ClerkPage._({
    required this.authState,
    required this.builder,
  });

  /// An injected [ClerkAuthState]
  final ClerkAuthState authState;

  /// The [builder] for the child
  final WidgetBuilder builder;

  /// static method to show an [AddAccountPanel]
  static Future<void> show(
    BuildContext context, {
    required WidgetBuilder builder,
    String? routeName,
  }) async {
    final authState = ClerkAuth.of(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return ClerkPage._(authState: authState, builder: builder);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      authState: authState,
      child: Scaffold(
        backgroundColor: ClerkColors.whiteSmoke,
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: hor24bottom16,
          child: Builder(builder: builder),
        ),
      ),
    );
  }
}
