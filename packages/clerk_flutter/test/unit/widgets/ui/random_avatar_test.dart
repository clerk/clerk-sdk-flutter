import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/random_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('RandomAvatar', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores seed parameter', () {
      const widget = RandomAvatar(seed: 'test-seed');
      expect(widget.seed, 'test-seed');
    });

    test('stores size parameter', () {
      const widget = RandomAvatar(seed: 'test', size: 50.0);
      expect(widget.size, 50.0);
    });

    test('defaults size to 28.0', () {
      const widget = RandomAvatar(seed: 'test');
      expect(widget.size, 28.0);
    });

    testWidgets('renders SizedBox', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const RandomAvatar(seed: 'test'),
        ),
      );
      await tester.pump();

      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('renders CircleAvatar', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const RandomAvatar(seed: 'test'),
        ),
      );
      await tester.pump();

      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('renders ClipRRect', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const RandomAvatar(seed: 'test'),
        ),
      );
      await tester.pump();

      expect(find.byType(ClipRRect), findsOneWidget);
    });
  });
}

