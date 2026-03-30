@TestOn('browser')
library;

import 'package:clerk_flutter/src/utils/default_caching_persistor_web.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DefaultCachingPersistor persistor;

  setUp(() async {
    persistor = DefaultCachingPersistor();
    await persistor.initialize();
  });

  tearDown(() {
    persistor.terminate();
  });

  group('ClerkFileCache stream (IndexedDB)', () {
    test('returns empty for unreachable URL with no cache', () async {
      final uri = Uri.parse('https://test.invalid/no-cache.png');
      final results = await persistor.stream(uri).toList();
      expect(results, isEmpty);
    });

    test('returns empty when fetch fails and nothing is cached', () async {
      // This test verifies the full round-trip through stream():
      // 1. First call fetches from network → stores in IndexedDB
      // 2. Second call reads from IndexedDB cache
      //
      // We can't test with a real HTTP server in this environment,
      // but we verify that stream() handles missing cache + failed
      // fetch gracefully (returns empty, doesn't throw).
      final uri = Uri.parse('https://test.invalid/image.png');

      final first = await persistor.stream(uri).toList();
      expect(first, isEmpty); // no cache, fetch fails

      final second = await persistor.stream(uri).toList();
      expect(second, isEmpty); // still no cache (nothing was stored)
    });
  });

  group('initialization', () {
    test('opens IndexedDB without error', () async {
      final p = DefaultCachingPersistor();
      await p.initialize();
      p.terminate();
    });

    test('multiple initializations do not throw', () async {
      final p = DefaultCachingPersistor();
      await p.initialize();
      await p.initialize();
      p.terminate();
    });
  });
}
