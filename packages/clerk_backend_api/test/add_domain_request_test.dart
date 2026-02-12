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
  group('AddDomainRequest', () {
    test('constructor creates instance with required parameters', () {
      final instance = AddDomainRequest(
        name: 'example.com',
        isSatellite: true,
      );
      expect(instance.name, 'example.com');
      expect(instance.isSatellite, true);
      expect(instance.proxyUrl, isNull);
    });

    test('constructor creates instance with optional parameters', () {
      final instance = AddDomainRequest(
        name: 'example.com',
        isSatellite: true,
        proxyUrl: 'https://proxy.example.com',
      );
      expect(instance.proxyUrl, 'https://proxy.example.com');
    });

    test('toJson produces correct map', () {
      final instance = AddDomainRequest(
        name: 'example.com',
        isSatellite: true,
        proxyUrl: 'https://proxy.example.com',
      );
      final json = instance.toJson();
      expect(json['name'], 'example.com');
      expect(json['is_satellite'], true);
      expect(json['proxy_url'], 'https://proxy.example.com');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'name': 'example.com',
        'is_satellite': true,
        'proxy_url': 'https://proxy.example.com',
      };
      final instance = AddDomainRequest.fromJson(json);
      expect(instance, isNotNull);
      expect(instance!.name, 'example.com');
      expect(instance.isSatellite, true);
      expect(instance.proxyUrl, 'https://proxy.example.com');
    });

    test('fromJson returns null for non-map input', () {
      expect(AddDomainRequest.fromJson(null), isNull);
      expect(AddDomainRequest.fromJson('string'), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'name': 'example1.com', 'is_satellite': true},
        {'name': 'example2.com', 'is_satellite': false},
      ];
      final list = AddDomainRequest.listFromJson(jsonList);
      expect(list.length, 2);
      expect(list[0].name, 'example1.com');
      expect(list[1].name, 'example2.com');
    });

    test('equality operator works correctly', () {
      final instance1 = AddDomainRequest(name: 'example.com', isSatellite: true);
      final instance2 = AddDomainRequest(name: 'example.com', isSatellite: true);
      final instance3 = AddDomainRequest(name: 'other.com', isSatellite: true);
      expect(instance1, equals(instance2));
      expect(instance1, isNot(equals(instance3)));
    });

    test('hashCode is consistent', () {
      final instance1 = AddDomainRequest(name: 'example.com', isSatellite: true);
      final instance2 = AddDomainRequest(name: 'example.com', isSatellite: true);
      expect(instance1.hashCode, equals(instance2.hashCode));
    });

    test('toString returns expected format', () {
      final instance = AddDomainRequest(name: 'example.com', isSatellite: true);
      final str = instance.toString();
      expect(str, contains('AddDomainRequest['));
      expect(str, contains('name='));
    });
  });
}
