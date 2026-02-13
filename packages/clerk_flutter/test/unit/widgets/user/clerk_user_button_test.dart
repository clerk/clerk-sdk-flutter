import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/user/clerk_user_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkUserButton', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores showName parameter', () {
      const widget = ClerkUserButton(showName: false);
      expect(widget.showName, isFalse);
    });

    test('defaults showName to true', () {
      const widget = ClerkUserButton();
      expect(widget.showName, isTrue);
    });

    test('stores sessionActions parameter', () {
      final actions = [
        ClerkUserAction(
          label: 'Test',
          callback: (context, authState) {},
        ),
      ];
      final widget = ClerkUserButton(sessionActions: actions);
      expect(widget.sessionActions, actions);
    });

    test('stores additionalActions parameter', () {
      final actions = [
        ClerkUserAction(
          label: 'Test',
          callback: (context, authState) {},
        ),
      ];
      final widget = ClerkUserButton(additionalActions: actions);
      expect(widget.additionalActions, actions);
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserButton(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkUserButton), findsOneWidget);
    });

    testWidgets('renders when signed out', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkUserButton(),
        ),
      );
      await tester.pump();

      // Should render something even when signed out
      expect(find.byType(ClerkUserButton), findsOneWidget);
    });
  });
}

