import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_sign_out_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkSignOutPanel', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('creates state', () {
      const widget = ClerkSignOutPanel();
      expect(widget.createState(), isA<State<ClerkSignOutPanel>>());
    });

    testWidgets('renders Padding', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignOutPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('renders ClerkMaterialButton', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignOutPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkMaterialButton), findsOneWidget);
    });

    testWidgets('renders Text widget', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkSignOutPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(Text), findsWidgets);
    });
  });
}

