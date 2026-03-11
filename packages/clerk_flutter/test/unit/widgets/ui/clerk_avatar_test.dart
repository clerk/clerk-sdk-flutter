import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_avatar.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  late ClerkAuthState authState;

  setUp(() async {
    authState = await createTestAuthState();
  });

  tearDown(() {
    authState.terminate();
  });

  group('ClerkAvatar', () {
    testWidgets('renders with default diameter', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkAvatar), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
    });

    testWidgets('renders with custom diameter', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(diameter: 64),
        ),
      );
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, 64);
      expect(sizedBox.height, 64);
    });

    testWidgets('displays initials when name is provided', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(name: 'John Doe'),
        ),
      );
      await tester.pump();

      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('displays single initial for single name', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(name: 'Alice'),
        ),
      );
      await tester.pump();

      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('displays multiple initials for multiple names',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(name: 'Alice Bob Charlie'),
        ),
      );
      await tester.pump();

      expect(find.text('ABC'), findsOneWidget);
    });

    testWidgets('renders empty when name is empty', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(name: ''),
        ),
      );
      await tester.pump();

      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('renders ClerkCachedImage when imageUrl is provided',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(imageUrl: 'https://example.com/avatar.jpg'),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkCachedImage), findsOneWidget);
      expect(find.byType(ClipRRect), findsWidgets);
    });

    testWidgets('does not render ClerkCachedImage when imageUrl is empty',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(imageUrl: '', name: 'John Doe'),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkCachedImage), findsNothing);
      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('renders with custom borderRadius', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(
            name: 'Test',
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkAvatar), findsOneWidget);
    });

    testWidgets('renders DecoratedBox with correct structure', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const ClerkAvatar(name: 'Test'),
        ),
      );
      await tester.pump();

      expect(find.byType(DecoratedBox), findsWidgets);
    });
  });
}
