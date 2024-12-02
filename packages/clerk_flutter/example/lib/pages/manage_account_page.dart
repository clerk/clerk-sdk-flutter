import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

import 'example_page.dart';

/// Sign in to an additional account
class ManageAccountPage extends StatelessWidget {
  /// Construct a [ManageAccountPage]
  const ManageAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExamplePage(
      child: ClerkUserProfile(),
    );
  }
}
