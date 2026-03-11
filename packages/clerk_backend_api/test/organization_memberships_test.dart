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
  group('OrganizationMemberships', () {
    late OrganizationMemberships instance;

    setUp(() {
      instance = OrganizationMemberships(
        data: [],
        totalCount: 0,
      );
    });

    test('constructor creates instance with default values', () {
      final empty = OrganizationMemberships(totalCount: 0);
      expect(empty.data, isEmpty);
      expect(empty.totalCount, 0);
    });

    test('constructor creates instance with parameters', () {
      final withData = OrganizationMemberships(
        data: [],
        totalCount: 5,
      );
      expect(withData.totalCount, 5);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['data'], isA<List>());
      expect(json['total_count'], 0);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'data': [],
        'total_count': 3,
      };
      final result = OrganizationMemberships.fromJson(json);
      expect(result, isNotNull);
      expect(result!.data, isEmpty);
      expect(result.totalCount, 3);
    });

    test('fromJson returns null for non-map input', () {
      expect(OrganizationMemberships.fromJson('invalid'), isNull);
      expect(OrganizationMemberships.fromJson(123), isNull);
      expect(OrganizationMemberships.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(OrganizationMemberships.listFromJson([]), isEmpty);
      expect(OrganizationMemberships.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('OrganizationMemberships'));
      expect(str, contains('totalCount=0'));
    });

    test('requiredKeys contains required fields', () {
      expect(OrganizationMemberships.requiredKeys, contains('data'));
      expect(OrganizationMemberships.requiredKeys, contains('total_count'));
    });
  });
}
