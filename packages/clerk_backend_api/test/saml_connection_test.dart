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
  group('SAMLConnection', () {
    late SAMLConnection instance;

    setUp(() {
      instance = SAMLConnection(
        id: 'saml_conn_123',
        name: 'Test SAML Connection',
        domain: 'example.com',
        domains: ['example.com', 'test.com'],
        active: true,
        provider: 'okta',
        syncUserAttributes: true,
        allowSubdomains: false,
        allowIdpInitiated: true,
        disableAdditionalIdentifications: false,
        createdAt: 1700000000,
        updatedAt: 1700001000,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = SAMLConnection(
        id: 'saml_1',
        name: 'Minimal',
        active: false,
        provider: 'azure',
        syncUserAttributes: false,
        createdAt: 1700000000,
        updatedAt: 1700001000,
      );
      expect(minimal.id, 'saml_1');
      expect(minimal.name, 'Minimal');
      expect(minimal.domain, isNull);
      expect(minimal.domains, isEmpty);
      expect(minimal.active, false);
      expect(minimal.provider, 'azure');
      expect(minimal.syncUserAttributes, false);
      expect(minimal.allowSubdomains, isNull);
      expect(minimal.allowIdpInitiated, isNull);
      expect(minimal.disableAdditionalIdentifications, isNull);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.id, 'saml_conn_123');
      expect(instance.name, 'Test SAML Connection');
      expect(instance.domain, 'example.com');
      expect(instance.domains, ['example.com', 'test.com']);
      expect(instance.active, true);
      expect(instance.provider, 'okta');
      expect(instance.syncUserAttributes, true);
      expect(instance.allowSubdomains, false);
      expect(instance.allowIdpInitiated, true);
      expect(instance.disableAdditionalIdentifications, false);
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700001000);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'saml_conn_123');
      expect(json['name'], 'Test SAML Connection');
      expect(json['domain'], 'example.com');
      expect(json['domains'], ['example.com', 'test.com']);
      expect(json['active'], true);
      expect(json['provider'], 'okta');
      expect(json['sync_user_attributes'], true);
      expect(json['allow_subdomains'], false);
      expect(json['allow_idp_initiated'], true);
      expect(json['disable_additional_identifications'], false);
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700001000);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'id': 'saml_456',
        'name': 'Another Connection',
        'domain': 'other.com',
        'domains': ['other.com'],
        'active': false,
        'provider': 'onelogin',
        'sync_user_attributes': false,
        'allow_subdomains': true,
        'allow_idp_initiated': false,
        'disable_additional_identifications': true,
        'created_at': 1600000000,
        'updated_at': 1600001000,
      };
      final result = SAMLConnection.fromJson(json);
      expect(result, isNotNull);
      expect(result!.id, 'saml_456');
      expect(result.name, 'Another Connection');
      expect(result.domain, 'other.com');
      expect(result.domains, ['other.com']);
      expect(result.active, false);
      expect(result.provider, 'onelogin');
      expect(result.syncUserAttributes, false);
      expect(result.allowSubdomains, true);
      expect(result.allowIdpInitiated, false);
      expect(result.disableAdditionalIdentifications, true);
    });

    test('fromJson returns null for non-map input', () {
      expect(SAMLConnection.fromJson('invalid'), isNull);
      expect(SAMLConnection.fromJson(123), isNull);
      expect(SAMLConnection.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {
          'id': 'saml_1',
          'name': 'First',
          'active': true,
          'provider': 'okta',
          'sync_user_attributes': true,
          'created_at': 1700000000,
          'updated_at': 1700001000,
        },
        {
          'id': 'saml_2',
          'name': 'Second',
          'active': false,
          'provider': 'azure',
          'sync_user_attributes': false,
          'created_at': 1700000000,
          'updated_at': 1700001000,
        },
      ];
      final result = SAMLConnection.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].id, 'saml_1');
      expect(result[1].id, 'saml_2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SAMLConnection.listFromJson([]), isEmpty);
      expect(SAMLConnection.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SAMLConnection'));
      expect(str, contains('id=saml_conn_123'));
      expect(str, contains('name=Test SAML Connection'));
    });

    test('requiredKeys contains required fields', () {
      expect(SAMLConnection.requiredKeys, contains('id'));
      expect(SAMLConnection.requiredKeys, contains('name'));
      expect(SAMLConnection.requiredKeys, contains('active'));
      expect(SAMLConnection.requiredKeys, contains('provider'));
      expect(SAMLConnection.requiredKeys, contains('sync_user_attributes'));
      expect(SAMLConnection.requiredKeys, contains('created_at'));
      expect(SAMLConnection.requiredKeys, contains('updated_at'));
    });
  });
}
