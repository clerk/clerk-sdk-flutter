import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkCachedImage', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('creates with url string', () {
      const url = 'https://example.com/image.png';
      final image = ClerkCachedImage(url);

      expect(image.uri.toString(), url);
    });

    test('stores fit parameter', () {
      const url = 'https://example.com/image.png';
      final image = ClerkCachedImage(url, fit: BoxFit.cover);

      expect(image.fit, BoxFit.cover);
    });

    test('stores width parameter', () {
      const url = 'https://example.com/image.png';
      final image = ClerkCachedImage(url, width: 100);

      expect(image.width, 100);
    });

    test('stores height parameter', () {
      const url = 'https://example.com/image.png';
      final image = ClerkCachedImage(url, height: 50);

      expect(image.height, 50);
    });

    test('stores invertColors parameter', () {
      const url = 'https://example.com/image.png';
      final image = ClerkCachedImage(url, invertColors: true);

      expect(image.invertColors, isTrue);
    });

    testWidgets('renders SizedBox when no data', (tester) async {
      const url = 'https://example.com/image.png';

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCachedImage(url, width: 100, height: 100),
        ),
      );
      await tester.pump();

      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('renders StreamBuilder', (tester) async {
      const url = 'https://example.com/image.png';

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: ClerkCachedImage(url),
        ),
      );
      await tester.pump();

      expect(find.byType(StreamBuilder), findsOneWidget);
    });
  });
}

