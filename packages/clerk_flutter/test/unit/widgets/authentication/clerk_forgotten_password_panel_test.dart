import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_forgotten_password_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_identifier_input.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkForgottenPasswordPanel', () {
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
          child: const ClerkForgottenPasswordPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkForgottenPasswordPanel), findsOneWidget);
    });

    testWidgets('renders Column', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkForgottenPasswordPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('renders ClerkPanelHeader with title', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkForgottenPasswordPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkPanelHeader), findsOneWidget);
    });

    testWidgets('renders ClerkIdentifierInput in unstarted state',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkForgottenPasswordPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkIdentifierInput), findsOneWidget);
    });

    testWidgets('renders AlertDialog wrapper', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkForgottenPasswordPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
