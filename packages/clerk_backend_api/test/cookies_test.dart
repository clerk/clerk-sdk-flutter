//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

void main() {
  group('Cookies', () {
    late Cookies instance;

    setUp(() {
      instance = Cookies(
        object: CookiesObjectEnum.cookies,
        cookies: ['__session=abc123; Path=/; HttpOnly', '__client=xyz789; Path=/'],
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, CookiesObjectEnum.cookies);
      expect(instance.cookies, hasLength(2));
    });

    test('constructor uses default empty list for cookies', () {
      final minimal = Cookies(object: CookiesObjectEnum.cookies);
      expect(minimal.cookies, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], CookiesObjectEnum.cookies);
      expect(json['cookies'], hasLength(2));
      expect(json['cookies'][0], contains('__session'));
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'cookies',
        'cookies': ['cookie1=value1', 'cookie2=value2'],
      };
      final parsed = Cookies.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, CookiesObjectEnum.cookies);
      expect(parsed.cookies, hasLength(2));
    });

    test('fromJson returns null for non-map input', () {
      expect(Cookies.fromJson('not a map'), isNull);
      expect(Cookies.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'cookies', 'cookies': ['a=1']},
        {'object': 'cookies', 'cookies': ['b=2']},
      ];
      final list = Cookies.listFromJson(jsonArray);
      expect(list.length, 2);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Cookies.listFromJson([]), isEmpty);
      expect(Cookies.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = Cookies(
        object: CookiesObjectEnum.cookies,
        cookies: ['__session=abc123; Path=/; HttpOnly', '__client=xyz789; Path=/'],
      );
      final different = Cookies(
        object: CookiesObjectEnum.cookies,
        cookies: ['other=value'],
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Cookies'));
    });

    test('requiredKeys contains required fields', () {
      expect(Cookies.requiredKeys, contains('object'));
      expect(Cookies.requiredKeys, contains('cookies'));
    });
  });

  group('CookiesObjectEnum', () {
    test('values contains all enum values', () {
      expect(CookiesObjectEnum.values, contains(CookiesObjectEnum.cookies));
    });

    test('toJson returns correct string', () {
      expect(CookiesObjectEnum.cookies.toJson(), 'cookies');
    });

    test('fromJson parses correct value', () {
      expect(CookiesObjectEnum.fromJson('cookies'), CookiesObjectEnum.cookies);
    });

    test('fromJson returns null for unknown value', () {
      expect(CookiesObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
