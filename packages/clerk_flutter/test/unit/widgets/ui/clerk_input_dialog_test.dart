import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_input_dialog.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkInputDialog', () {
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
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ClerkInputDialog.show(
                    context,
                    child: const Text('Test Child'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            },
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('renders cancel button', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ClerkInputDialog.show(
                    context,
                    child: const Text('Test'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            },
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(ClerkMaterialButton), findsWidgets);
    });

    testWidgets('renders OK button when showOk is true', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ClerkInputDialog.show(
                    context,
                    child: const Text('Test'),
                    showOk: true,
                  );
                },
                child: const Text('Show Dialog'),
              );
            },
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Should have 2 buttons: Cancel and OK
      expect(find.byType(ClerkMaterialButton), findsNWidgets(2));
    });

    testWidgets('does not render OK button when showOk is false', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ClerkInputDialog.show(
                    context,
                    child: const Text('Test'),
                    showOk: false,
                  );
                },
                child: const Text('Show Dialog'),
              );
            },
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Should have only 1 button: Cancel
      expect(find.byType(ClerkMaterialButton), findsOneWidget);
    });

    testWidgets('renders Center', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ClerkInputDialog.show(
                    context,
                    child: const Text('Test'),
                  );
                },
                child: const Text('Show Dialog'),
              );
            },
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(Center), findsWidgets);
    });
  });
}

