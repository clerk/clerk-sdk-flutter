//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

void main() {
  group('ClerkError', () {
    late ClerkError instance;
    late Object meta;

    setUp(() {
      meta = {'key': 'value'};
      instance = ClerkError(
        message: 'Something went wrong',
        longMessage: 'A detailed description of what went wrong',
        code: 'error_code_123',
        meta: meta,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.message, 'Something went wrong');
      expect(instance.longMessage, 'A detailed description of what went wrong');
      expect(instance.code, 'error_code_123');
      expect(instance.meta, meta);
    });

    test('constructor creates instance without optional meta', () {
      final minimal = ClerkError(
        message: 'Error',
        longMessage: 'Long error',
        code: 'err_01',
      );
      expect(minimal.message, 'Error');
      expect(minimal.longMessage, 'Long error');
      expect(minimal.code, 'err_01');
      expect(minimal.meta, isNull);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['message'], 'Something went wrong');
      expect(json['long_message'], 'A detailed description of what went wrong');
      expect(json['code'], 'error_code_123');
      expect(json['meta'], meta);
    });

    test('toJson handles null meta', () {
      final minimal = ClerkError(
        message: 'Error',
        longMessage: 'Long error',
        code: 'err_01',
      );
      final json = minimal.toJson();
      expect(json['meta'], isNull);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'message': 'Parsed error',
        'long_message': 'Parsed long message',
        'code': 'parsed_code',
        'meta': {'info': 'extra'},
      };
      final parsed = ClerkError.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.message, 'Parsed error');
      expect(parsed.longMessage, 'Parsed long message');
      expect(parsed.code, 'parsed_code');
      expect(parsed.meta, {'info': 'extra'});
    });

    test('fromJson returns null for non-map input', () {
      expect(ClerkError.fromJson('not a map'), isNull);
      expect(ClerkError.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'message': 'Error 1', 'long_message': 'Long 1', 'code': 'code1'},
        {'message': 'Error 2', 'long_message': 'Long 2', 'code': 'code2'},
      ];
      final list = ClerkError.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].message, 'Error 1');
      expect(list[1].message, 'Error 2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(ClerkError.listFromJson([]), isEmpty);
      expect(ClerkError.listFromJson(null), isEmpty);
    });

    test('mapFromJson creates map from json', () {
      final jsonMap = {
        'err1': {'message': 'Error 1', 'long_message': 'Long 1', 'code': 'code1'},
        'err2': {'message': 'Error 2', 'long_message': 'Long 2', 'code': 'code2'},
      };
      final map = ClerkError.mapFromJson(jsonMap);
      expect(map.length, 2);
      expect(map['err1']?.message, 'Error 1');
      expect(map['err2']?.message, 'Error 2');
    });

    test('equality operator works correctly', () {
      final same = ClerkError(
        message: 'Something went wrong',
        longMessage: 'A detailed description of what went wrong',
        code: 'error_code_123',
        meta: meta,
      );
      final different = ClerkError(
        message: 'Different error',
        longMessage: 'Different long message',
        code: 'different_code',
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = ClerkError(
        message: 'Something went wrong',
        longMessage: 'A detailed description of what went wrong',
        code: 'error_code_123',
        meta: meta,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('ClerkError'));
      expect(str, contains('Something went wrong'));
      expect(str, contains('error_code_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(ClerkError.requiredKeys, contains('message'));
      expect(ClerkError.requiredKeys, contains('long_message'));
      expect(ClerkError.requiredKeys, contains('code'));
      expect(ClerkError.requiredKeys.length, 3);
    });
  });
}
