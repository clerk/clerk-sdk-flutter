import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkPanel', () {
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
          child: const ClerkPanel(
            child: Text('Panel Content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Panel Content'), findsOneWidget);
    });

    testWidgets('applies default padding of EdgeInsets.zero', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkPanel(
            child: Text('Content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final padding = tester.widget<Padding>(find.byType(Padding).last);
      expect(padding.padding, EdgeInsets.zero);
    });

    testWidgets('applies custom padding', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkPanel(
            padding: EdgeInsets.all(16),
            child: Text('Padded Content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final padding = tester.widget<Padding>(find.byType(Padding).last);
      expect(padding.padding, const EdgeInsets.all(16));
    });

    testWidgets('wraps child in DecoratedBox', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkPanel(
            child: Text('Decorated'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DecoratedBox), findsWidgets);
    });

    testWidgets('wraps child in DefaultTextStyle', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkPanel(
            child: Text('Styled'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DefaultTextStyle), findsWidgets);
    });
  });
}

