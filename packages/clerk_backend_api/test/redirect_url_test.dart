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
  group('RedirectURL', () {
    late RedirectURL instance;

    setUp(() {
      instance = RedirectURL(
        object: RedirectURLObjectEnum.redirectUrl,
        id: 'redir_123',
        url: 'https://example.com/callback',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, RedirectURLObjectEnum.redirectUrl);
      expect(instance.id, 'redir_123');
      expect(instance.url, 'https://example.com/callback');
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], RedirectURLObjectEnum.redirectUrl);
      expect(json['id'], 'redir_123');
      expect(json['url'], 'https://example.com/callback');
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'redirect_url',
        'id': 'redir_456',
        'url': 'https://example.com/other',
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = RedirectURL.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, RedirectURLObjectEnum.redirectUrl);
      expect(parsed.id, 'redir_456');
      expect(parsed.url, 'https://example.com/other');
    });

    test('fromJson returns null for non-map input', () {
      expect(RedirectURL.fromJson('not a map'), isNull);
      expect(RedirectURL.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'redirect_url', 'id': 'r1', 'url': 'https://a.com', 'created_at': 1, 'updated_at': 2},
        {'object': 'redirect_url', 'id': 'r2', 'url': 'https://b.com', 'created_at': 3, 'updated_at': 4},
      ];
      final list = RedirectURL.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'r1');
      expect(list[1].id, 'r2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(RedirectURL.listFromJson([]), isEmpty);
      expect(RedirectURL.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = RedirectURL(
        object: RedirectURLObjectEnum.redirectUrl,
        id: 'redir_123',
        url: 'https://example.com/callback',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final different = RedirectURL(
        object: RedirectURLObjectEnum.redirectUrl,
        id: 'redir_different',
        url: 'https://different.com',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = RedirectURL(
        object: RedirectURLObjectEnum.redirectUrl,
        id: 'redir_123',
        url: 'https://example.com/callback',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('RedirectURL'));
      expect(str, contains('redir_123'));
      expect(str, contains('https://example.com/callback'));
    });

    test('requiredKeys contains required fields', () {
      expect(RedirectURL.requiredKeys, contains('object'));
      expect(RedirectURL.requiredKeys, contains('id'));
      expect(RedirectURL.requiredKeys, contains('url'));
      expect(RedirectURL.requiredKeys, contains('created_at'));
      expect(RedirectURL.requiredKeys, contains('updated_at'));
    });
  });

  group('RedirectURLObjectEnum', () {
    test('values contains all enum values', () {
      expect(RedirectURLObjectEnum.values, contains(RedirectURLObjectEnum.redirectUrl));
    });

    test('toJson returns correct string', () {
      expect(RedirectURLObjectEnum.redirectUrl.toJson(), 'redirect_url');
    });

    test('fromJson parses correct value', () {
      expect(RedirectURLObjectEnum.fromJson('redirect_url'), RedirectURLObjectEnum.redirectUrl);
    });

    test('fromJson returns null for unknown value', () {
      expect(RedirectURLObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
