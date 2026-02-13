import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/social_connection_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('SocialConnectionButton', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders with social connection', (tester) async {
      final connection = clerk.SocialConnection(
        strategy: clerk.Strategy.oauthGoogle,
        name: 'Google',
        logoUrl: 'https://example.com/google.png',
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: SocialConnectionButton(
            connection: connection,
            onPressed: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MaterialButton), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;
      final connection = clerk.SocialConnection(
        strategy: clerk.Strategy.oauthGoogle,
        name: 'Google',
        logoUrl: 'https://example.com/google.png',
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: SocialConnectionButton(
            connection: connection,
            onPressed: () => pressed = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();

      expect(pressed, isTrue);
    });

    testWidgets('shows reduced opacity when disabled', (tester) async {
      final connection = clerk.SocialConnection(
        strategy: clerk.Strategy.oauthGoogle,
        name: 'Google',
        logoUrl: 'https://example.com/google.png',
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: SocialConnectionButton(
            connection: connection,
            onPressed: null,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final opacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(opacity.opacity, 0.5);
    });

    testWidgets('shows full opacity when enabled', (tester) async {
      final connection = clerk.SocialConnection(
        strategy: clerk.Strategy.oauthGoogle,
        name: 'Google',
        logoUrl: 'https://example.com/google.png',
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: SocialConnectionButton(
            connection: connection,
            onPressed: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      final opacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(opacity.opacity, 1.0);
    });

    testWidgets('renders initials when logoUrl is empty', (tester) async {
      final connection = clerk.SocialConnection(
        strategy: clerk.Strategy.oauthGoogle,
        name: 'Google',
        logoUrl: '',
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: SocialConnectionButton(
            connection: connection,
            onPressed: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('G'), findsOneWidget);
    });

    testWidgets('has fixed size', (tester) async {
      final connection = clerk.SocialConnection(
        strategy: clerk.Strategy.oauthGoogle,
        name: 'Google',
        logoUrl: 'https://example.com/google.png',
      );

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: SocialConnectionButton(
            connection: connection,
            onPressed: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 45);
      expect(sizedBox.height, 30);
    });
  });
}

