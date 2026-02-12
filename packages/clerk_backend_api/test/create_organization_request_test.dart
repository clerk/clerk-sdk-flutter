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
  group('CreateOrganizationRequest', () {
    late CreateOrganizationRequest instance;
    late Map<String, Object> privateMetadata;
    late Map<String, Object> publicMetadata;

    setUp(() {
      privateMetadata = {'secret': 'value'};
      publicMetadata = {'display': 'info'};
      instance = CreateOrganizationRequest(
        name: 'Acme Corp',
        createdBy: 'user_123',
        privateMetadata: privateMetadata,
        publicMetadata: publicMetadata,
        slug: 'acme-corp',
        maxAllowedMemberships: 100,
        createdAt: '2024-01-15T10:30:00.000Z',
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = CreateOrganizationRequest(
        name: 'Test Org',
      );
      expect(minimal.name, 'Test Org');
      expect(minimal.createdBy, isNull);
      expect(minimal.privateMetadata, isEmpty);
      expect(minimal.publicMetadata, isEmpty);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.name, 'Acme Corp');
      expect(instance.createdBy, 'user_123');
      expect(instance.privateMetadata, privateMetadata);
      expect(instance.publicMetadata, publicMetadata);
      expect(instance.slug, 'acme-corp');
      expect(instance.maxAllowedMemberships, 100);
      expect(instance.createdAt, '2024-01-15T10:30:00.000Z');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['name'], 'Acme Corp');
      expect(json['created_by'], 'user_123');
      expect(json['private_metadata'], privateMetadata);
      expect(json['public_metadata'], publicMetadata);
      expect(json['slug'], 'acme-corp');
      expect(json['max_allowed_memberships'], 100);
      expect(json['created_at'], '2024-01-15T10:30:00.000Z');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'name': 'Another Org',
        'created_by': 'user_456',
        'private_metadata': {'key': 'val'},
        'public_metadata': {'pub': 'data'},
        'slug': 'another-org',
        'max_allowed_memberships': 50,
        'created_at': '2024-02-20T15:00:00.000Z',
      };
      final result = CreateOrganizationRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.name, 'Another Org');
      expect(result.createdBy, 'user_456');
      expect(result.slug, 'another-org');
      expect(result.maxAllowedMemberships, 50);
    });

    test('fromJson returns null for non-map input', () {
      expect(CreateOrganizationRequest.fromJson('invalid'), isNull);
      expect(CreateOrganizationRequest.fromJson(123), isNull);
      expect(CreateOrganizationRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'name': 'Org 1'},
        {'name': 'Org 2', 'slug': 'org-2'},
      ];
      final result = CreateOrganizationRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].name, 'Org 1');
      expect(result[1].slug, 'org-2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreateOrganizationRequest.listFromJson([]), isEmpty);
      expect(CreateOrganizationRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = CreateOrganizationRequest(
        name: 'Acme Corp',
        createdBy: 'user_123',
        privateMetadata: privateMetadata,
        publicMetadata: publicMetadata,
        slug: 'acme-corp',
        maxAllowedMemberships: 100,
        createdAt: '2024-01-15T10:30:00.000Z',
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreateOrganizationRequest'));
      expect(str, contains('name=Acme Corp'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreateOrganizationRequest.requiredKeys, contains('name'));
    });
  });
}
