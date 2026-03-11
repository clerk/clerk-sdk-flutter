import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkAuthentication', () {
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
          child: const ClerkAuthentication(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkAuthentication), findsOneWidget);
    });

    testWidgets('renders ClerkVerticalCard', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAuthentication(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkVerticalCard), findsOneWidget);
    });

    testWidgets('renders Column', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAuthentication(),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('renders when environment is available', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAuthentication(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkAuthentication), findsOneWidget);
    });
  });
}
