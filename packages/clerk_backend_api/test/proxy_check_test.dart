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
  group('ProxyCheck', () {
    late ProxyCheck instance;

    setUp(() {
      instance = ProxyCheck(
        object: ProxyCheckObjectEnum.proxyCheck,
        id: 'pchk_123',
        domainId: 'dmn_456',
        lastRunAt: 1700000000,
        proxyUrl: 'https://proxy.example.com',
        successful: true,
        createdAt: 1699000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, ProxyCheckObjectEnum.proxyCheck);
      expect(instance.id, 'pchk_123');
      expect(instance.domainId, 'dmn_456');
      expect(instance.lastRunAt, 1700000000);
      expect(instance.proxyUrl, 'https://proxy.example.com');
      expect(instance.successful, true);
      expect(instance.createdAt, 1699000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], ProxyCheckObjectEnum.proxyCheck);
      expect(json['id'], 'pchk_123');
      expect(json['domain_id'], 'dmn_456');
      expect(json['last_run_at'], 1700000000);
      expect(json['proxy_url'], 'https://proxy.example.com');
      expect(json['successful'], true);
      expect(json['created_at'], 1699000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'proxy_check',
        'id': 'pchk_789',
        'domain_id': 'dmn_012',
        'last_run_at': 1700000002,
        'proxy_url': 'https://other.example.com',
        'successful': false,
        'created_at': 1699000001,
        'updated_at': 1700000003,
      };
      final parsed = ProxyCheck.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, ProxyCheckObjectEnum.proxyCheck);
      expect(parsed.id, 'pchk_789');
      expect(parsed.successful, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(ProxyCheck.fromJson('not a map'), isNull);
      expect(ProxyCheck.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {
          'object': 'proxy_check', 'id': 'p1', 'domain_id': 'd1',
          'last_run_at': 1, 'proxy_url': 'u1', 'successful': true,
          'created_at': 1, 'updated_at': 1
        },
        {
          'object': 'proxy_check', 'id': 'p2', 'domain_id': 'd2',
          'last_run_at': 2, 'proxy_url': 'u2', 'successful': false,
          'created_at': 2, 'updated_at': 2
        },
      ];
      final list = ProxyCheck.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'p1');
      expect(list[1].id, 'p2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(ProxyCheck.listFromJson([]), isEmpty);
      expect(ProxyCheck.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = ProxyCheck(
        object: ProxyCheckObjectEnum.proxyCheck,
        id: 'pchk_123',
        domainId: 'dmn_456',
        lastRunAt: 1700000000,
        proxyUrl: 'https://proxy.example.com',
        successful: true,
        createdAt: 1699000000,
        updatedAt: 1700000001,
      );
      final different = ProxyCheck(
        object: ProxyCheckObjectEnum.proxyCheck,
        id: 'pchk_other',
        domainId: 'dmn_other',
        lastRunAt: 1,
        proxyUrl: 'https://other.com',
        successful: false,
        createdAt: 1,
        updatedAt: 1,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('ProxyCheck'));
      expect(str, contains('pchk_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(ProxyCheck.requiredKeys, contains('object'));
      expect(ProxyCheck.requiredKeys, contains('id'));
      expect(ProxyCheck.requiredKeys, contains('domain_id'));
      expect(ProxyCheck.requiredKeys, contains('proxy_url'));
      expect(ProxyCheck.requiredKeys, contains('successful'));
    });
  });

  group('ProxyCheckObjectEnum', () {
    test('values contains all enum values', () {
      expect(ProxyCheckObjectEnum.values, contains(ProxyCheckObjectEnum.proxyCheck));
    });

    test('toJson returns correct string', () {
      expect(ProxyCheckObjectEnum.proxyCheck.toJson(), 'proxy_check');
    });

    test('fromJson parses correct value', () {
      expect(ProxyCheckObjectEnum.fromJson('proxy_check'), ProxyCheckObjectEnum.proxyCheck);
    });

    test('fromJson returns null for unknown value', () {
      expect(ProxyCheckObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
