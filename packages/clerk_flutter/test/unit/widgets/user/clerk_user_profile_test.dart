import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/user/clerk_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkUserProfile', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserProfile(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkUserProfile), findsOneWidget);
    });

    testWidgets('renders when signed out', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserProfile(),
        ),
      );
      await tester.pump();

      // Should render something even when signed out
      expect(find.byType(ClerkUserProfile), findsOneWidget);
    });
  });
}

