import 'package:clerk_auth/src/clerk_auth/persistor.dart';

import '../../test_helpers.dart';

void main() {
  group('Persistor.none', () {
    test('initialize completes without error', () async {
      await Persistor.none.initialize();
      // Should complete without throwing
    });

    test('terminate completes without error', () {
      Persistor.none.terminate();
      // Should complete without throwing
    });

    test('read returns null for any key', () async {
      final result = await Persistor.none.read<String>('any_key');
      expect(result, isNull);
    });

    test('read returns null for different types', () async {
      expect(await Persistor.none.read<int>('int_key'), isNull);
      expect(await Persistor.none.read<bool>('bool_key'), isNull);
      expect(await Persistor.none.read<Map>('map_key'), isNull);
    });

    test('write completes without error', () async {
      await Persistor.none.write('key', 'value');
      // Should complete without throwing
    });

    test('write does not persist values', () async {
      await Persistor.none.write('key', 'value');
      final result = await Persistor.none.read<String>('key');
      expect(result, isNull);
    });

    test('delete completes without error', () async {
      await Persistor.none.delete('key');
      // Should complete without throwing
    });

    test('is a const instance', () {
      expect(identical(Persistor.none, Persistor.none));
    });
  });
}

