import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Skeleton for example pages
class ExamplePage extends StatelessWidget {
  /// Construct a [ExamplePage]
  const ExamplePage({
    super.key,
    required this.onExit,
    required this.child,
  });

  /// Function to perform exit
  final VoidCallback onExit;

  /// child [Widget]
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ClerkColors.whiteSmoke,
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onExit,
          child: const Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: allPadding32,
        child: child,
      ),
    );
  }
}
