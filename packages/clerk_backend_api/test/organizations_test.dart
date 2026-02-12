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
  group('Organizations', () {
    late Organizations instance;
    late Organization org;

    setUp(() {
      org = Organization(
        object: OrganizationObjectEnum.organization,
        id: 'org_123',
        name: 'Test Org',
        slug: 'test-org',
        hasImage: false,
        maxAllowedMemberships: 10,
        adminDeleteEnabled: true,
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );
      instance = Organizations(
        data: [org],
        totalCount: 1,
      );
    });

    test('constructor creates instance with default values', () {
      final empty = Organizations(totalCount: 0);
      expect(empty.data, isEmpty);
      expect(empty.totalCount, 0);
    });

    test('constructor creates instance with parameters', () {
      expect(instance.data.length, 1);
      expect(instance.data[0].name, 'Test Org');
      expect(instance.totalCount, 1);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['data'], isA<List>());
      expect(json['total_count'], 1);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'data': [
          {
            'object': 'organization',
            'id': 'org_456',
            'name': 'Another Org',
            'slug': 'another-org',
            'has_image': true,
            'max_allowed_memberships': 5,
            'admin_delete_enabled': false,
            'public_metadata': {},
            'created_at': 1234567890,
            'updated_at': 1234567890,
          }
        ],
        'total_count': 1,
      };
      final result = Organizations.fromJson(json);
      expect(result, isNotNull);
      expect(result!.data.length, 1);
      expect(result.totalCount, 1);
    });

    test('fromJson returns null for non-map input', () {
      expect(Organizations.fromJson('invalid'), isNull);
      expect(Organizations.fromJson(123), isNull);
      expect(Organizations.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Organizations.listFromJson([]), isEmpty);
      expect(Organizations.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Organizations'));
      expect(str, contains('totalCount=1'));
    });

    test('requiredKeys contains required fields', () {
      expect(Organizations.requiredKeys, contains('data'));
      expect(Organizations.requiredKeys, contains('total_count'));
    });
  });
}
