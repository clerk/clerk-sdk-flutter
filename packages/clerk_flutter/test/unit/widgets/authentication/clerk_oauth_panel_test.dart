import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/authentication/clerk_oauth_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkOAuthPanel', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores onStrategyChosen callback', () {
      void onStrategyChosen(clerk.Strategy strategy) {}
      final widget = ClerkOAuthPanel(onStrategyChosen: onStrategyChosen);
      expect(widget.onStrategyChosen, onStrategyChosen);
    });

    test('creates state', () {
      const widget = ClerkOAuthPanel();
      expect(widget.createState(), isA<State<ClerkOAuthPanel>>());
    });

    testWidgets('renders ClerkAuthBuilder', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkOAuthPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkAuthBuilder), findsOneWidget);
    });

    testWidgets('renders with default state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkOAuthPanel(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkOAuthPanel), findsOneWidget);
    });
  });
}

