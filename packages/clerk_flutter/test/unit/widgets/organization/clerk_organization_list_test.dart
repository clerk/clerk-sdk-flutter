import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/organization/clerk_organization_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkOrganizationList', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores actions parameter', () {
      final actions = [
        ClerkUserAction(
          label: 'Test',
          callback: (context, authState) {},
        ),
      ];
      const widget = ClerkOrganizationList(actions: actions);
      expect(widget.actions, actions);
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkOrganizationList(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkOrganizationList), findsOneWidget);
    });

    testWidgets('renders when signed out', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkOrganizationList(),
        ),
      );
      await tester.pump();

      // Should render something even when signed out
      expect(find.byType(ClerkOrganizationList), findsOneWidget);
    });
  });
}

