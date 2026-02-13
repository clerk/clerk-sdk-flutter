import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/organization/clerk_organization_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkOrganizationProfile', () {
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
          child: const ClerkOrganizationProfile(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
    });

    testWidgets('renders when signed out', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkOrganizationProfile(),
        ),
      );
      await tester.pump();

      // Should render something even when signed out
      expect(find.byType(ClerkOrganizationProfile), findsOneWidget);
    });
  });
}

