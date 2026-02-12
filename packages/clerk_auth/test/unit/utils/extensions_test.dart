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

  group('Epoch', () {
    test('add returns DateTime with duration added', () {
      final result = DateTimeExt.epoch.add(const Duration(seconds: 10));
      expect(result.microsecondsSinceEpoch, 10000000);
    });

    test('subtract returns DateTime with duration subtracted', () {
      final result = DateTimeExt.epoch.subtract(const Duration(seconds: -10));
      expect(result.microsecondsSinceEpoch, 10000000);
    });

    test('compareTo returns negative for non-epoch DateTime', () {
      final now = DateTime.now();
      expect(DateTimeExt.epoch.compareTo(now) < 0, true);
    });

    test('difference returns zero for two epochs', () {
      expect(DateTimeExt.epoch.difference(DateTimeExt.epoch), Duration.zero);
    });

    test('difference returns negative duration for future DateTime', () {
      final future = DateTime.fromMicrosecondsSinceEpoch(1000000, isUtc: true);
      final diff = DateTimeExt.epoch.difference(future);
      expect(diff.inMicroseconds, -1000000);
    });

    test('isAfter returns false for future DateTime', () {
      final future = DateTime.fromMicrosecondsSinceEpoch(1000, isUtc: true);
      expect(DateTimeExt.epoch.isAfter(future), false);
    });

    test('isBefore returns true for future DateTime', () {
      final future = DateTime.fromMicrosecondsSinceEpoch(1000, isUtc: true);
      expect(DateTimeExt.epoch.isBefore(future), true);
    });

    test('isAtSameMomentAs returns true for epoch', () {
      final epoch = DateTime.fromMicrosecondsSinceEpoch(0, isUtc: true);
      expect(DateTimeExt.epoch.isAtSameMomentAs(epoch), true);
    });

    test('isAtSameMomentAs returns false for non-epoch', () {
      final nonEpoch = DateTime.fromMicrosecondsSinceEpoch(1, isUtc: true);
      expect(DateTimeExt.epoch.isAtSameMomentAs(nonEpoch), false);
    });

    test('date components are correct', () {
      expect(DateTimeExt.epoch.year, 1970);
      expect(DateTimeExt.epoch.month, 1);
      expect(DateTimeExt.epoch.day, 1);
      expect(DateTimeExt.epoch.hour, 0);
      expect(DateTimeExt.epoch.minute, 0);
      expect(DateTimeExt.epoch.second, 0);
      expect(DateTimeExt.epoch.millisecond, 0);
      expect(DateTimeExt.epoch.microsecond, 0);
    });

    test('isUtc returns true', () {
      expect(DateTimeExt.epoch.isUtc, true);
    });

    test('timeZoneName returns UTC', () {
      expect(DateTimeExt.epoch.timeZoneName, 'UTC');
    });

    test('timeZoneOffset returns zero', () {
      expect(DateTimeExt.epoch.timeZoneOffset, Duration.zero);
    });

    test('toIso8601String returns correct format', () {
      expect(DateTimeExt.epoch.toIso8601String(), '1970-01-01T00:00:00.000Z');
    });

    test('toLocal returns local DateTime at epoch', () {
      final local = DateTimeExt.epoch.toLocal();
      expect(local.microsecondsSinceEpoch, 0);
      expect(local.isUtc, false);
    });

    test('toUtc returns itself', () {
      expect(DateTimeExt.epoch.toUtc(), DateTimeExt.epoch);
    });

    test('weekday returns 0', () {
      expect(DateTimeExt.epoch.weekday, 0);
    });
  });

  group('ObjectIdentity', () {
    test('shortHash returns 5 character hex string', () {
      final obj = Object();
      expect(obj.shortHash.length, 5);
    });

    test('describeIdentity includes hash', () {
      final obj = Object();
      final identity = obj.describeIdentity();
      expect(identity.contains('#'), true);
      expect(identity.contains(obj.shortHash), true);
    });
  });
}

