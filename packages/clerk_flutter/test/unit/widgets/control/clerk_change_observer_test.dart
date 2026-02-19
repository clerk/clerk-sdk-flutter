import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_change_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkChangeObserver', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders child from builder', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkChangeObserver<String>(
            builder: (context) => const Text('Observer Child'),
            onChange: null,
            accumulateData: () => [],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Observer Child'), findsOneWidget);
    });

    testWidgets('accumulates data on init', (tester) async {
      var accumulateCalled = false;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkChangeObserver<String>(
            builder: (context) => const Text('Content'),
            onChange: null,
            accumulateData: () {
              accumulateCalled = true;
              return ['item1', 'item2'];
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(accumulateCalled, isTrue);
    });

    testWidgets('renders with onChange callback', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkChangeObserver<int>(
            builder: (context) => const Text('With Callback'),
            onChange: (context) {},
            accumulateData: () => [1, 2, 3],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('With Callback'), findsOneWidget);
    });

    testWidgets('disposes listener on widget dispose', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkChangeObserver<String>(
            builder: (context) => const Text('Disposable'),
            onChange: null,
            accumulateData: () => [],
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Replace with different widget to trigger dispose
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Text('Replaced'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Replaced'), findsOneWidget);
    });

    testWidgets('calls onChange when data changes', (tester) async {
      var data = <String>[];
      var onChangeCalled = false;
      BuildContext? capturedContext;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkChangeObserver<String>(
            builder: (context) => const Text('Observer'),
            onChange: (context) {
              onChangeCalled = true;
              capturedContext = context;
            },
            accumulateData: () => data,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(onChangeCalled, isFalse);

      // Change the data
      data = ['new-item'];

      // Trigger a change by notifying listeners
      authState.notifyListeners();
      await tester.pump();

      expect(onChangeCalled, isTrue);
      expect(capturedContext, isNotNull);
    });

    testWidgets('does not call onChange when data is unchanged', (tester) async {
      final data = <String>['item1', 'item2'];
      var onChangeCalled = false;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkChangeObserver<String>(
            builder: (context) => const Text('Observer'),
            onChange: (context) {
              onChangeCalled = true;
            },
            accumulateData: () => data,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(onChangeCalled, isFalse);

      // Trigger a change but data is the same
      authState.notifyListeners();
      await tester.pump();

      expect(onChangeCalled, isFalse);
    });
  });
}

