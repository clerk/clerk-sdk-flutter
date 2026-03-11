import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_profile_nav_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ProfileNavTile', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores icon parameter', () {
      const icon = Icon(Icons.person);
      const widget = ProfileNavTile(
        icon: icon,
        title: 'Test',
        selected: false,
      );
      expect(widget.icon, icon);
    });

    test('stores title parameter', () {
      const widget = ProfileNavTile(
        icon: Icon(Icons.person),
        title: 'Test Title',
        selected: false,
      );
      expect(widget.title, 'Test Title');
    });

    test('stores selected parameter', () {
      const widget = ProfileNavTile(
        icon: Icon(Icons.person),
        title: 'Test',
        selected: true,
      );
      expect(widget.selected, isTrue);
    });

    test('stores onTap callback', () {
      void onTap() {}
      final widget = ProfileNavTile(
        icon: const Icon(Icons.person),
        title: 'Test',
        selected: false,
        onTap: onTap,
      );
      expect(widget.onTap, onTap);
    });

    testWidgets('renders Material', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ProfileNavTile(
            icon: Icon(Icons.person),
            title: 'Test',
            selected: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Material), findsWidgets);
    });

    testWidgets('renders InkWell', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ProfileNavTile(
            icon: Icon(Icons.person),
            title: 'Test',
            selected: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('renders Padding', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ProfileNavTile(
            icon: Icon(Icons.person),
            title: 'Test',
            selected: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('renders Row', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ProfileNavTile(
            icon: Icon(Icons.person),
            title: 'Test',
            selected: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('renders icon widget', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ProfileNavTile(
            icon: Icon(Icons.person),
            title: 'Test',
            selected: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('renders title text', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ProfileNavTile(
            icon: Icon(Icons.person),
            title: 'Test Title',
            selected: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Test Title'), findsOneWidget);
    });
  });
}
