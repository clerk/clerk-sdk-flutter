import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/strategy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('StrategyButton', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders with totp strategy', (tester) async {
      var clicked = false;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: StrategyButton(
            strategy: clerk.Strategy.totp,
            onClick: () => clicked = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.lock_clock), findsOneWidget);
      expect(find.byType(MaterialButton), findsOneWidget);
    });

    testWidgets('renders with backupCode strategy', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: StrategyButton(
            strategy: clerk.Strategy.backupCode,
            onClick: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.reorder_sharp), findsOneWidget);
    });

    testWidgets('renders with emailLink strategy', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: StrategyButton(
            strategy: clerk.Strategy.emailLink,
            onClick: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.link_sharp), findsOneWidget);
    });

    testWidgets('renders with emailCode strategy', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: StrategyButton(
            strategy: clerk.Strategy.emailCode,
            onClick: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.email), findsOneWidget);
    });

    testWidgets('renders with phoneCode strategy', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: StrategyButton(
            strategy: clerk.Strategy.phoneCode,
            onClick: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.textsms), findsOneWidget);
    });

    testWidgets('calls onClick when tapped', (tester) async {
      var clicked = false;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: StrategyButton(
            strategy: clerk.Strategy.totp,
            onClick: () => clicked = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();

      expect(clicked, isTrue);
    });

    testWidgets('renders with safeIdentifier for emailLink', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: StrategyButton(
            strategy: clerk.Strategy.emailLink,
            onClick: () {},
            safeIdentifier: 'test@example.com',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MaterialButton), findsOneWidget);
    });

    test('supports returns true for supported strategies', () {
      final totpFactor = clerk.Factor(
        strategy: clerk.Strategy.totp,
        safeIdentifier: null,
        emailAddressId: null,
        phoneNumberId: null,
        web3WalletId: null,
        passkeyId: null,
        isPrimary: true,
        isDefault: false,
      );
      expect(StrategyButton.supports(totpFactor), isTrue);
    });

    test('supports returns false for unsupported strategies', () {
      final passwordFactor = clerk.Factor(
        strategy: clerk.Strategy.password,
        safeIdentifier: null,
        emailAddressId: null,
        phoneNumberId: null,
        web3WalletId: null,
        passkeyId: null,
        isPrimary: true,
        isDefault: false,
      );
      expect(StrategyButton.supports(passwordFactor), isFalse);
    });
  });
}

