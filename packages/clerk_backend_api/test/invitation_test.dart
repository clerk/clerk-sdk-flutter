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
  group('Invitation', () {
    late Invitation instance;
    late Map<String, Object> publicMetadata;

    setUp(() {
      publicMetadata = {'role': 'admin'};
      instance = Invitation(
        object: InvitationObjectEnum.invitation,
        id: 'inv_123',
        emailAddress: 'invited@example.com',
        publicMetadata: publicMetadata,
        revoked: false,
        status: InvitationStatusEnum.pending,
        url: 'https://example.com/invite/abc',
        expiresAt: 1700100000,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, InvitationObjectEnum.invitation);
      expect(instance.id, 'inv_123');
      expect(instance.emailAddress, 'invited@example.com');
      expect(instance.status, InvitationStatusEnum.pending);
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.publicMetadata, publicMetadata);
      expect(instance.revoked, false);
      expect(instance.url, 'https://example.com/invite/abc');
      expect(instance.expiresAt, 1700100000);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], InvitationObjectEnum.invitation);
      expect(json['id'], 'inv_123');
      expect(json['email_address'], 'invited@example.com');
      expect(json['public_metadata'], publicMetadata);
      expect(json['revoked'], false);
      expect(json['status'], InvitationStatusEnum.pending);
      expect(json['url'], 'https://example.com/invite/abc');
      expect(json['expires_at'], 1700100000);
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'invitation',
        'id': 'inv_456',
        'email_address': 'parsed@example.com',
        'public_metadata': {'key': 'value'},
        'revoked': true,
        'status': 'accepted',
        'url': 'https://example.com/invite/xyz',
        'expires_at': 1700200000,
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = Invitation.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, InvitationObjectEnum.invitation);
      expect(parsed.id, 'inv_456');
      expect(parsed.emailAddress, 'parsed@example.com');
      expect(parsed.revoked, true);
      expect(parsed.status, InvitationStatusEnum.accepted);
      expect(parsed.url, 'https://example.com/invite/xyz');
      expect(parsed.expiresAt, 1700200000);
    });

    test('fromJson returns null for non-map input', () {
      expect(Invitation.fromJson('not a map'), isNull);
      expect(Invitation.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'invitation', 'id': 'inv_1', 'email_address': 'a@test.com', 'public_metadata': {}, 'status': 'pending', 'created_at': 1, 'updated_at': 2},
        {'object': 'invitation', 'id': 'inv_2', 'email_address': 'b@test.com', 'public_metadata': {}, 'status': 'accepted', 'created_at': 3, 'updated_at': 4},
      ];
      final list = Invitation.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'inv_1');
      expect(list[1].id, 'inv_2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Invitation.listFromJson([]), isEmpty);
      expect(Invitation.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = Invitation(
        object: InvitationObjectEnum.invitation,
        id: 'inv_123',
        emailAddress: 'invited@example.com',
        publicMetadata: publicMetadata,
        revoked: false,
        status: InvitationStatusEnum.pending,
        url: 'https://example.com/invite/abc',
        expiresAt: 1700100000,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final different = Invitation(
        object: InvitationObjectEnum.invitation,
        id: 'inv_different',
        emailAddress: 'different@example.com',
        status: InvitationStatusEnum.revoked,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = Invitation(
        object: InvitationObjectEnum.invitation,
        id: 'inv_123',
        emailAddress: 'invited@example.com',
        publicMetadata: publicMetadata,
        revoked: false,
        status: InvitationStatusEnum.pending,
        url: 'https://example.com/invite/abc',
        expiresAt: 1700100000,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Invitation'));
      expect(str, contains('inv_123'));
      expect(str, contains('invited@example.com'));
    });

    test('requiredKeys contains required fields', () {
      expect(Invitation.requiredKeys, contains('object'));
      expect(Invitation.requiredKeys, contains('id'));
      expect(Invitation.requiredKeys, contains('email_address'));
      expect(Invitation.requiredKeys, contains('public_metadata'));
      expect(Invitation.requiredKeys, contains('status'));
      expect(Invitation.requiredKeys, contains('created_at'));
      expect(Invitation.requiredKeys, contains('updated_at'));
    });
  });

  group('InvitationObjectEnum', () {
    test('values contains all enum values', () {
      expect(InvitationObjectEnum.values, contains(InvitationObjectEnum.invitation));
    });

    test('toJson returns correct string', () {
      expect(InvitationObjectEnum.invitation.toJson(), 'invitation');
    });

    test('fromJson parses correct value', () {
      expect(InvitationObjectEnum.fromJson('invitation'), InvitationObjectEnum.invitation);
    });

    test('fromJson returns null for unknown value', () {
      expect(InvitationObjectEnum.fromJson('unknown'), isNull);
    });
  });

  group('InvitationStatusEnum', () {
    test('values contains all enum values', () {
      expect(InvitationStatusEnum.values, hasLength(4));
      expect(InvitationStatusEnum.values, contains(InvitationStatusEnum.pending));
      expect(InvitationStatusEnum.values, contains(InvitationStatusEnum.accepted));
      expect(InvitationStatusEnum.values, contains(InvitationStatusEnum.revoked));
      expect(InvitationStatusEnum.values, contains(InvitationStatusEnum.expired));
    });

    test('toJson returns correct string', () {
      expect(InvitationStatusEnum.pending.toJson(), 'pending');
      expect(InvitationStatusEnum.accepted.toJson(), 'accepted');
      expect(InvitationStatusEnum.revoked.toJson(), 'revoked');
      expect(InvitationStatusEnum.expired.toJson(), 'expired');
    });

    test('fromJson parses correct values', () {
      expect(InvitationStatusEnum.fromJson('pending'), InvitationStatusEnum.pending);
      expect(InvitationStatusEnum.fromJson('accepted'), InvitationStatusEnum.accepted);
      expect(InvitationStatusEnum.fromJson('revoked'), InvitationStatusEnum.revoked);
      expect(InvitationStatusEnum.fromJson('expired'), InvitationStatusEnum.expired);
    });

    test('fromJson returns null for unknown value', () {
      expect(InvitationStatusEnum.fromJson('unknown'), isNull);
    });
  });
}
