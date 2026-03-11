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
  group('SvixURL', () {
    late SvixURL instance;

    setUp(() {
      instance = SvixURL(
        svixUrl: 'https://app.svix.com/login#key=abc123',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.svixUrl, 'https://app.svix.com/login#key=abc123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['svix_url'], 'https://app.svix.com/login#key=abc123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'svix_url': 'https://app.svix.com/login#key=xyz789',
      };
      final parsed = SvixURL.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.svixUrl, 'https://app.svix.com/login#key=xyz789');
    });

    test('fromJson returns null for non-map input', () {
      expect(SvixURL.fromJson('not a map'), isNull);
      expect(SvixURL.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'svix_url': 'https://a.com'},
        {'svix_url': 'https://b.com'},
      ];
      final list = SvixURL.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].svixUrl, 'https://a.com');
      expect(list[1].svixUrl, 'https://b.com');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SvixURL.listFromJson([]), isEmpty);
      expect(SvixURL.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = SvixURL(svixUrl: 'https://app.svix.com/login#key=abc123');
      final different = SvixURL(svixUrl: 'https://different.com');
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = SvixURL(svixUrl: 'https://app.svix.com/login#key=abc123');
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SvixURL'));
      expect(str, contains('https://app.svix.com/login#key=abc123'));
    });

    test('requiredKeys contains required fields', () {
      expect(SvixURL.requiredKeys, contains('svix_url'));
    });
  });
}
