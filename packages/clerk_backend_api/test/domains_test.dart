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
  group('Domains', () {
    late Domains instance;
    late Domain domain;

    setUp(() {
      domain = Domain(
        object: DomainObjectEnum.domain,
        id: 'domain_123',
        name: 'example.com',
        isSatellite: false,
        frontendApiUrl: 'https://api.example.com',
        accountsPortalUrl: 'https://accounts.example.com',
        developmentOrigin: 'http://localhost:3000',
        cnameTargets: [],
      );
      instance = Domains(
        data: [domain],
        totalCount: 1,
      );
    });

    test('constructor creates instance with default values', () {
      final empty = Domains(totalCount: 0);
      expect(empty.data, isEmpty);
      expect(empty.totalCount, 0);
    });

    test('constructor creates instance with parameters', () {
      expect(instance.data.length, 1);
      expect(instance.data[0].name, 'example.com');
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
            'object': 'domain',
            'id': 'domain_456',
            'name': 'test.com',
            'is_satellite': true,
            'frontend_api_url': 'https://api.test.com',
            'accounts_portal_url': 'https://accounts.test.com',
            'development_origin': 'http://localhost:3000',
            'cname_targets': [],
          }
        ],
        'total_count': 1,
      };
      final result = Domains.fromJson(json);
      expect(result, isNotNull);
      expect(result!.data.length, 1);
      expect(result.totalCount, 1);
    });

    test('fromJson returns null for non-map input', () {
      expect(Domains.fromJson('invalid'), isNull);
      expect(Domains.fromJson(123), isNull);
      expect(Domains.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Domains.listFromJson([]), isEmpty);
      expect(Domains.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Domains'));
      expect(str, contains('totalCount=1'));
    });

    test('requiredKeys contains required fields', () {
      expect(Domains.requiredKeys, contains('data'));
      expect(Domains.requiredKeys, contains('total_count'));
    });
  });
}
