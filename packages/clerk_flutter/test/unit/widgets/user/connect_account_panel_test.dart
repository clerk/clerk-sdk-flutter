import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_oauth_panel.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_change_observer.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel_header.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:clerk_flutter/src/widgets/user/connect_account_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ConnectAccountPanel', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores onDone callback', () {
      void onDone(BuildContext context) {}
      final widget = ConnectAccountPanel(onDone: onDone);
      expect(widget.onDone, onDone);
    });

    testWidgets('renders ClerkVerticalCard', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ConnectAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkVerticalCard), findsOneWidget);
    });

    testWidgets('renders Column', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ConnectAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('renders ClerkPanelHeader', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ConnectAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkPanelHeader), findsOneWidget);
    });

    testWidgets('renders ClerkAuthBuilder', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ConnectAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkAuthBuilder), findsWidgets);
    });

    testWidgets('renders Padding', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ConnectAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('renders ClerkChangeObserver', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ConnectAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkChangeObserver<DateTime>), findsOneWidget);
    });

    testWidgets('renders ClerkOAuthPanel', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ConnectAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkOAuthPanel), findsOneWidget);
    });
  });
}

