import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkErrorListener', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkErrorListener(
              child: Text('Child Content'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Child Content'), findsOneWidget);
    });

    testWidgets('calls custom handler when error occurs', (tester) async {
      var handlerCalled = false;
      clerk.ClerkError? receivedError;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: ClerkErrorListener(
              handler: (context, error) {
                handlerCalled = true;
                receivedError = error;
              },
              child: const Text('Content'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Trigger an error
      final error = clerk.ClerkError.clientAppError(message: 'Test error');
      authState.handleError(error);

      await tester.pump();

      expect(handlerCalled, isTrue);
      expect(receivedError?.message, 'Test error');
    });

    testWidgets('shows snackbar when no custom handler', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: ClerkErrorListener(
              child: Text('Content'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Trigger an error
      final error = clerk.ClerkError.clientAppError(message: 'Snackbar error');
      authState.handleError(error);

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Snackbar should be shown
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}

