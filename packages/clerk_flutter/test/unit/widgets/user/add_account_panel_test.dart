import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_change_observer.dart';
import 'package:clerk_flutter/src/widgets/user/add_account_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('AddAccountPanel', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores onDone callback', () {
      void onDone(BuildContext context) {}
      final widget = AddAccountPanel(onDone: onDone);
      expect(widget.onDone, onDone);
    });

    testWidgets('renders ClerkChangeObserver', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const AddAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkChangeObserver<DateTime>), findsOneWidget);
    });

    testWidgets('renders ClerkAuthentication', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const AddAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkAuthentication), findsOneWidget);
    });

    testWidgets('renders with default state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const AddAccountPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(AddAccountPanel), findsOneWidget);
    });
  });
}

