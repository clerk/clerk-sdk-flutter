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
  group('DeletedObject', () {
    late DeletedObject instance;

    setUp(() {
      instance = DeletedObject(
        object: 'user',
        id: 'user_123',
        slug: 'my-user-slug',
        deleted: true,
        externalId: 'ext_456',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, 'user');
      expect(instance.deleted, true);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.id, 'user_123');
      expect(instance.slug, 'my-user-slug');
      expect(instance.externalId, 'ext_456');
    });

    test('constructor creates instance with minimal required params', () {
      final minimal = DeletedObject(
        object: 'organization',
        deleted: false,
      );
      expect(minimal.object, 'organization');
      expect(minimal.deleted, false);
      expect(minimal.id, isNull);
      expect(minimal.slug, isNull);
      expect(minimal.externalId, isNull);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], 'user');
      expect(json['id'], 'user_123');
      expect(json['slug'], 'my-user-slug');
      expect(json['deleted'], true);
      expect(json['external_id'], 'ext_456');
    });

    test('toJson handles null optional fields', () {
      final minimal = DeletedObject(
        object: 'session',
        deleted: true,
      );
      final json = minimal.toJson();
      expect(json['object'], 'session');
      expect(json['deleted'], true);
      expect(json['id'], isNull);
      expect(json['slug'], isNull);
      expect(json['external_id'], isNull);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'invitation',
        'id': 'inv_789',
        'slug': 'invite-slug',
        'deleted': true,
        'external_id': 'ext_abc',
      };
      final parsed = DeletedObject.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, 'invitation');
      expect(parsed.id, 'inv_789');
      expect(parsed.slug, 'invite-slug');
      expect(parsed.deleted, true);
      expect(parsed.externalId, 'ext_abc');
    });

    test('fromJson returns null for non-map input', () {
      expect(DeletedObject.fromJson('not a map'), isNull);
      expect(DeletedObject.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'user', 'id': 'user_1', 'deleted': true},
        {'object': 'user', 'id': 'user_2', 'deleted': false},
      ];
      final list = DeletedObject.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'user_1');
      expect(list[0].deleted, true);
      expect(list[1].id, 'user_2');
      expect(list[1].deleted, false);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(DeletedObject.listFromJson([]), isEmpty);
      expect(DeletedObject.listFromJson(null), isEmpty);
    });

    test('mapFromJson creates map from json', () {
      final jsonMap = {
        'key1': {'object': 'user', 'id': 'user_1', 'deleted': true},
        'key2': {'object': 'user', 'id': 'user_2', 'deleted': true},
      };
      final map = DeletedObject.mapFromJson(jsonMap);
      expect(map.length, 2);
      expect(map['key1']?.id, 'user_1');
      expect(map['key2']?.id, 'user_2');
    });

    test('equality operator works correctly', () {
      final same = DeletedObject(
        object: 'user',
        id: 'user_123',
        slug: 'my-user-slug',
        deleted: true,
        externalId: 'ext_456',
      );
      final different = DeletedObject(
        object: 'user',
        id: 'user_different',
        deleted: true,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = DeletedObject(
        object: 'user',
        id: 'user_123',
        slug: 'my-user-slug',
        deleted: true,
        externalId: 'ext_456',
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('DeletedObject'));
      expect(str, contains('user_123'));
      expect(str, contains('deleted=true'));
    });

    test('requiredKeys contains required fields', () {
      expect(DeletedObject.requiredKeys, contains('object'));
      expect(DeletedObject.requiredKeys, contains('deleted'));
      expect(DeletedObject.requiredKeys.length, 2);
    });
  });
}
