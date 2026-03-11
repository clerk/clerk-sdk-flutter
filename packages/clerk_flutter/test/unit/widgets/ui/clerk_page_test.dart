import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkPage', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders ClerkAuth when shown', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Test'),
                      );
                    },
                    child: const Text('Show'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.byType(ClerkAuth), findsWidgets);
    });

    testWidgets('renders Scaffold when shown', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Test'),
                      );
                    },
                    child: const Text('Show'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsWidgets);
    });

    testWidgets('renders AppBar when shown', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Test'),
                      );
                    },
                    child: const Text('Show'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders Padding when shown', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Test'),
                      );
                    },
                    child: const Text('Show'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('renders builder content when shown', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Test Content'),
                      );
                    },
                    child: const Text('Show'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('show method pushes route', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Page Content'),
                      );
                    },
                    child: const Text('Show Page'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      // Tap button to show page
      await tester.tap(find.text('Show Page'));
      await tester.pumpAndSettle();

      // Page content should be visible
      expect(find.text('Page Content'), findsOneWidget);
    });

    testWidgets('show method with routeName', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Named Route'),
                        routeName: '/test-route',
                      );
                    },
                    child: const Text('Show Named Page'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      // Tap button to show page
      await tester.tap(find.text('Show Named Page'));
      await tester.pumpAndSettle();

      // Page content should be visible
      expect(find.text('Named Route'), findsOneWidget);
    });

    testWidgets('renders Builder widget when shown', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Test'),
                      );
                    },
                    child: const Text('Show'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.byType(Builder), findsWidgets);
    });

    testWidgets('uses theme colors for background', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Test'),
                      );
                    },
                    child: const Text('Show'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold).last);
      expect(scaffold.backgroundColor, isNotNull);
    });

    testWidgets('AppBar has forceMaterialTransparency', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Test'),
                      );
                    },
                    child: const Text('Show'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.forceMaterialTransparency, isTrue);
    });

    testWidgets('AppBar uses theme foreground color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ClerkAuth(
            authState: authState,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      ClerkPage.show(
                        context,
                        builder: (context) => const Text('Test'),
                      );
                    },
                    child: const Text('Show'),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.foregroundColor, isNotNull);
    });
  });
}
