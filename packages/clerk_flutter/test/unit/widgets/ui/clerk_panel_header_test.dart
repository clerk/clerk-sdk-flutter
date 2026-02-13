import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkPanelHeader', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    testWidgets('renders with default title from display config', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkPanelHeader(),
        ),
      );
      await tester.pumpAndSettle();

      // Should render without error
      expect(find.byType(ClerkPanelHeader), findsOneWidget);
    });

    testWidgets('renders with custom title', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkPanelHeader(
            title: 'Custom Title',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Custom Title'), findsOneWidget);
    });

    testWidgets('renders with subtitle', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkPanelHeader(
            title: 'Title',
            subtitle: 'Subtitle Text',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle Text'), findsOneWidget);
    });

    testWidgets('renders without subtitle when not provided', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkPanelHeader(
            title: 'Title Only',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Title Only'), findsOneWidget);
    });

    testWidgets('uses custom padding', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkPanelHeader(
            title: 'Padded Title',
            padding: EdgeInsets.all(32.0),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Padded Title'), findsOneWidget);
    });
  });
}

