import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

void main() {
  group('StringExtension', () {
    group('initials', () {
      test('returns initials from space-delimited words', () {
        expect('John Doe'.initials, 'JD');
        expect('Alice Bob Charlie'.initials, 'ABC');
      });

      test('returns uppercase initials', () {
        expect('john doe'.initials, 'JD');
        expect('alice bob'.initials, 'AB');
      });

      test('handles single word', () {
        expect('John'.initials, 'J');
      });

      test('handles empty string', () {
        expect(''.initials, '');
      });

      test('filters out non-alphanumeric starting characters', () {
        // Words starting with non-alphanumeric are filtered out
        expect('John @Doe'.initials, 'J'); // @Doe is filtered out
        expect('!John Doe'.initials, 'D'); // !John is filtered out
      });

      test('includes numeric initials', () {
        expect('John 2nd Doe'.initials, 'J2D');
      });
    });

    group('b64decoded', () {
      test('decodes base64 encoded string', () {
        // 'Hello' in base64
        expect('SGVsbG8='.b64decoded, 'Hello');
      });

      test('decodes base64 with padding', () {
        // 'Hi' in base64
        expect('SGk='.b64decoded, 'Hi');
      });
    });

    group('orNullIfEmpty', () {
      test('returns string when not empty', () {
        expect('hello'.orNullIfEmpty, 'hello');
      });

      test('returns null when empty', () {
        expect(''.orNullIfEmpty, isNull);
      });
    });
  });

  group('MapExtension', () {
    group('toStringMap', () {
      test('converts map to string map', () {
        final map = {'key1': 123, 'key2': true, 'key3': 'value'};
        final stringMap = map.toStringMap();

        expect(stringMap['key1'], '123');
        expect(stringMap['key2'], 'true');
        expect(stringMap['key3'], 'value');
      });

      test('handles empty map', () {
        final map = <String, dynamic>{};
        expect(map.toStringMap(), isEmpty);
      });
    });
  });

  group('ListExtension', () {
    group('addOrReplaceAll', () {
      test('adds new items to list', () {
        final list = [1, 2, 3];
        list.addOrReplaceAll([4, 5], by: (i) => i);
        expect(list, [1, 2, 3, 4, 5]);
      });

      test('replaces existing items by identifier', () {
        final list = [
          {'id': 1, 'name': 'John'},
          {'id': 2, 'name': 'Jane'},
        ];
        list.addOrReplaceAll(
          [
            {'id': 1, 'name': 'Johnny'}
          ],
          by: (m) => m['id'],
        );
        expect(list[0]['name'], 'Johnny');
        expect(list.length, 2);
      });
    });

    group('removeFirstOrNull', () {
      test('removes and returns first matching item', () {
        final list = [1, 2, 3, 4, 5];
        final removed = list.removeFirstOrNull((i) => i > 2);
        expect(removed, 3);
        expect(list, [1, 2, 4, 5]);
      });

      test('returns null when no match found', () {
        final list = [1, 2, 3];
        final removed = list.removeFirstOrNull((i) => i > 10);
        expect(removed, isNull);
        expect(list, [1, 2, 3]);
      });
    });

    group('doesNotContain', () {
      test('returns true when item not in list', () {
        expect([1, 2, 3].doesNotContain(4));
      });

      test('returns false when item in list', () {
        expect([1, 2, 3].doesNotContain(2), false);
      });
    });
  });

  group('DurationExt', () {
    test('isZero returns true for zero duration', () {
      expect(Duration.zero.isZero);
    });

    test('isZero returns false for non-zero duration', () {
      expect(const Duration(seconds: 1).isZero, false);
    });

    test('isNotZero returns true for non-zero duration', () {
      expect(const Duration(seconds: 1).isNotZero);
    });

    test('isNotZero returns false for zero duration', () {
      expect(Duration.zero.isNotZero, false);
    });
  });

  group('DateTimeExt', () {
    test('epoch is a const DateTime at epoch', () {
      expect(DateTimeExt.epoch.millisecondsSinceEpoch, 0);
    });

    test('utcEpochSeconds creates DateTime from seconds', () {
      final dt = DateTimeExt.utcEpochSeconds(1000);
      expect(dt.millisecondsSinceEpoch, 1000000);
    });

    test('utcEpochMillis creates DateTime from milliseconds', () {
      final dt = DateTimeExt.utcEpochMillis(1000);
      expect(dt.millisecondsSinceEpoch, 1000);
    });
  });
}

