import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Skeleton for example pages
class ExamplePage extends StatelessWidget {
  /// Construct a [ExamplePage]
  const ExamplePage({
    super.key,
    required this.child,
  });

  /// child [Widget]
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ClerkColors.whiteSmoke,
      appBar: AppBar(
        leading: const CloseButton(),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: horizontalPadding32,
        child: child,
      ),
    );
  }
}
