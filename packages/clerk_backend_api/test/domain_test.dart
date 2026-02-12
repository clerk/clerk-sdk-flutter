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
  group('Domain', () {
    late Domain instance;
    late List<CNameTarget> cnameTargets;

    setUp(() {
      cnameTargets = [
        CNameTarget(host: 'clerk.example.com', value: 'target.clerk.dev', required_: true),
        CNameTarget(host: 'accounts.example.com', value: 'accounts.clerk.dev', required_: false),
      ];
      instance = Domain(
        object: DomainObjectEnum.domain,
        id: 'dmn_123',
        name: 'example.com',
        isSatellite: false,
        frontendApiUrl: 'https://clerk.example.com',
        accountsPortalUrl: 'https://accounts.example.com',
        proxyUrl: 'https://proxy.example.com',
        developmentOrigin: 'http://localhost:3000',
        cnameTargets: cnameTargets,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, DomainObjectEnum.domain);
      expect(instance.id, 'dmn_123');
      expect(instance.name, 'example.com');
      expect(instance.isSatellite, false);
      expect(instance.frontendApiUrl, 'https://clerk.example.com');
      expect(instance.developmentOrigin, 'http://localhost:3000');
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.accountsPortalUrl, 'https://accounts.example.com');
      expect(instance.proxyUrl, 'https://proxy.example.com');
      expect(instance.cnameTargets, cnameTargets);
      expect(instance.cnameTargets!.length, 2);
    });

    test('constructor creates instance with minimal required params', () {
      final minimal = Domain(
        object: DomainObjectEnum.domain,
        id: 'dmn_min',
        name: 'minimal.com',
        isSatellite: true,
        frontendApiUrl: 'https://clerk.minimal.com',
        developmentOrigin: 'http://localhost:4000',
      );
      expect(minimal.object, DomainObjectEnum.domain);
      expect(minimal.id, 'dmn_min');
      expect(minimal.isSatellite, true);
      expect(minimal.accountsPortalUrl, isNull);
      expect(minimal.proxyUrl, isNull);
      expect(minimal.cnameTargets, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], DomainObjectEnum.domain);
      expect(json['id'], 'dmn_123');
      expect(json['name'], 'example.com');
      expect(json['is_satellite'], false);
      expect(json['frontend_api_url'], 'https://clerk.example.com');
      expect(json['accounts_portal_url'], 'https://accounts.example.com');
      expect(json['proxy_url'], 'https://proxy.example.com');
      expect(json['development_origin'], 'http://localhost:3000');
      expect(json['cname_targets'], cnameTargets);
    });

    test('toJson handles null optional fields', () {
      final minimal = Domain(
        object: DomainObjectEnum.domain,
        id: 'dmn_min',
        name: 'minimal.com',
        isSatellite: true,
        frontendApiUrl: 'https://clerk.minimal.com',
        developmentOrigin: 'http://localhost:4000',
        cnameTargets: null,
      );
      final json = minimal.toJson();
      expect(json['accounts_portal_url'], isNull);
      expect(json['proxy_url'], isNull);
      expect(json['cname_targets'], isNull);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'domain',
        'id': 'dmn_parsed',
        'name': 'parsed.com',
        'is_satellite': false,
        'frontend_api_url': 'https://clerk.parsed.com',
        'accounts_portal_url': 'https://accounts.parsed.com',
        'proxy_url': null,
        'development_origin': 'http://localhost:5000',
        'cname_targets': [
          {'host': 'test.com', 'value': 'target.com', 'required': true},
        ],
      };
      final parsed = Domain.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, DomainObjectEnum.domain);
      expect(parsed.id, 'dmn_parsed');
      expect(parsed.name, 'parsed.com');
      expect(parsed.isSatellite, false);
      expect(parsed.frontendApiUrl, 'https://clerk.parsed.com');
      expect(parsed.accountsPortalUrl, 'https://accounts.parsed.com');
      expect(parsed.proxyUrl, isNull);
      expect(parsed.developmentOrigin, 'http://localhost:5000');
      expect(parsed.cnameTargets, isNotNull);
      expect(parsed.cnameTargets!.length, 1);
      expect(parsed.cnameTargets![0].host, 'test.com');
    });

    test('fromJson returns null for non-map input', () {
      expect(Domain.fromJson('not a map'), isNull);
      expect(Domain.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'domain', 'id': 'dmn_1', 'name': 'one.com', 'is_satellite': false, 'frontend_api_url': 'https://one.com', 'development_origin': 'http://localhost:1'},
        {'object': 'domain', 'id': 'dmn_2', 'name': 'two.com', 'is_satellite': true, 'frontend_api_url': 'https://two.com', 'development_origin': 'http://localhost:2'},
      ];
      final list = Domain.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'dmn_1');
      expect(list[1].id, 'dmn_2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Domain.listFromJson([]), isEmpty);
      expect(Domain.listFromJson(null), isEmpty);
    });

    test('mapFromJson creates map from json', () {
      final jsonMap = {
        'key1': {'object': 'domain', 'id': 'dmn_1', 'name': 'one.com', 'is_satellite': false, 'frontend_api_url': 'https://one.com', 'development_origin': 'http://localhost:1'},
        'key2': {'object': 'domain', 'id': 'dmn_2', 'name': 'two.com', 'is_satellite': true, 'frontend_api_url': 'https://two.com', 'development_origin': 'http://localhost:2'},
      };
      final map = Domain.mapFromJson(jsonMap);
      expect(map.length, 2);
      expect(map['key1']?.id, 'dmn_1');
      expect(map['key2']?.id, 'dmn_2');
    });

    test('equality operator works correctly', () {
      final same = Domain(
        object: DomainObjectEnum.domain,
        id: 'dmn_123',
        name: 'example.com',
        isSatellite: false,
        frontendApiUrl: 'https://clerk.example.com',
        accountsPortalUrl: 'https://accounts.example.com',
        proxyUrl: 'https://proxy.example.com',
        developmentOrigin: 'http://localhost:3000',
        cnameTargets: cnameTargets,
      );
      final different = Domain(
        object: DomainObjectEnum.domain,
        id: 'dmn_different',
        name: 'different.com',
        isSatellite: true,
        frontendApiUrl: 'https://different.com',
        developmentOrigin: 'http://localhost:9999',
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = Domain(
        object: DomainObjectEnum.domain,
        id: 'dmn_123',
        name: 'example.com',
        isSatellite: false,
        frontendApiUrl: 'https://clerk.example.com',
        accountsPortalUrl: 'https://accounts.example.com',
        proxyUrl: 'https://proxy.example.com',
        developmentOrigin: 'http://localhost:3000',
        cnameTargets: cnameTargets,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Domain'));
      expect(str, contains('dmn_123'));
      expect(str, contains('example.com'));
    });

    test('requiredKeys contains required fields', () {
      expect(Domain.requiredKeys, contains('object'));
      expect(Domain.requiredKeys, contains('id'));
      expect(Domain.requiredKeys, contains('name'));
      expect(Domain.requiredKeys, contains('is_satellite'));
      expect(Domain.requiredKeys, contains('frontend_api_url'));
      expect(Domain.requiredKeys, contains('development_origin'));
      expect(Domain.requiredKeys.length, 6);
    });
  });

  group('DomainObjectEnum', () {
    test('values contains all enum values', () {
      expect(DomainObjectEnum.values, contains(DomainObjectEnum.domain));
      expect(DomainObjectEnum.values.length, 1);
    });

    test('toJson returns correct string', () {
      expect(DomainObjectEnum.domain.toJson(), 'domain');
    });

    test('fromJson parses correct value', () {
      expect(DomainObjectEnum.fromJson('domain'), DomainObjectEnum.domain);
    });

    test('fromJson returns null for unknown value', () {
      expect(DomainObjectEnum.fromJson('unknown'), isNull);
    });

    test('toString returns value', () {
      expect(DomainObjectEnum.domain.toString(), 'domain');
    });
  });
}
