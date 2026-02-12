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
  group('EmailAddress', () {
    late EmailAddress instance;
    late List<IdentificationLink> linkedTo;

    setUp(() {
      linkedTo = [
        IdentificationLink(type: 'oauth_google', id: 'link_123'),
      ];
      instance = EmailAddress(
        id: 'email_123',
        object: EmailAddressObjectEnum.emailAddress,
        emailAddress: 'test@example.com',
        reserved: false,
        verification: null,
        linkedTo: linkedTo,
        matchesSsoConnection: true,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, EmailAddressObjectEnum.emailAddress);
      expect(instance.emailAddress, 'test@example.com');
      expect(instance.reserved, false);
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.id, 'email_123');
      expect(instance.matchesSsoConnection, true);
      expect(instance.linkedTo, linkedTo);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'email_123');
      expect(json['object'], EmailAddressObjectEnum.emailAddress);
      expect(json['email_address'], 'test@example.com');
      expect(json['reserved'], false);
      expect(json['verification'], isNull);
      expect(json['linked_to'], linkedTo);
      expect(json['matches_sso_connection'], true);
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'id': 'email_456',
        'object': 'email_address',
        'email_address': 'parsed@example.com',
        'reserved': true,
        'verification': {
          'status': 'verified',
          'strategy': 'email_link',
          'attempts': 1,
          'expire_at': 1700000100,
        },
        'linked_to': [],
        'matches_sso_connection': false,
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = EmailAddress.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.id, 'email_456');
      expect(parsed.object, EmailAddressObjectEnum.emailAddress);
      expect(parsed.emailAddress, 'parsed@example.com');
      expect(parsed.reserved, true);
      expect(parsed.matchesSsoConnection, false);
      expect(parsed.createdAt, 1700000002);
      expect(parsed.updatedAt, 1700000003);
    });

    test('fromJson returns null for non-map input', () {
      expect(EmailAddress.fromJson('not a map'), isNull);
      expect(EmailAddress.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final verification = {'status': 'verified', 'strategy': 'email_link', 'attempts': 1, 'expire_at': 100};
      final jsonArray = [
        {'object': 'email_address', 'email_address': 'a@test.com', 'reserved': false, 'verification': verification, 'linked_to': [], 'created_at': 1, 'updated_at': 2},
        {'object': 'email_address', 'email_address': 'b@test.com', 'reserved': true, 'verification': verification, 'linked_to': [], 'created_at': 3, 'updated_at': 4},
      ];
      final list = EmailAddress.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].emailAddress, 'a@test.com');
      expect(list[1].emailAddress, 'b@test.com');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(EmailAddress.listFromJson([]), isEmpty);
      expect(EmailAddress.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = EmailAddress(
        id: 'email_123',
        object: EmailAddressObjectEnum.emailAddress,
        emailAddress: 'test@example.com',
        reserved: false,
        verification: null,
        linkedTo: linkedTo,
        matchesSsoConnection: true,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final different = EmailAddress(
        object: EmailAddressObjectEnum.emailAddress,
        emailAddress: 'different@example.com',
        reserved: false,
        verification: null,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = EmailAddress(
        id: 'email_123',
        object: EmailAddressObjectEnum.emailAddress,
        emailAddress: 'test@example.com',
        reserved: false,
        verification: null,
        linkedTo: linkedTo,
        matchesSsoConnection: true,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('EmailAddress'));
      expect(str, contains('test@example.com'));
    });

    test('requiredKeys contains required fields', () {
      expect(EmailAddress.requiredKeys, contains('object'));
      expect(EmailAddress.requiredKeys, contains('email_address'));
      expect(EmailAddress.requiredKeys, contains('reserved'));
      expect(EmailAddress.requiredKeys, contains('verification'));
      expect(EmailAddress.requiredKeys, contains('linked_to'));
      expect(EmailAddress.requiredKeys, contains('created_at'));
      expect(EmailAddress.requiredKeys, contains('updated_at'));
    });
  });

  group('EmailAddressObjectEnum', () {
    test('values contains all enum values', () {
      expect(EmailAddressObjectEnum.values, contains(EmailAddressObjectEnum.emailAddress));
    });

    test('toJson returns correct string', () {
      expect(EmailAddressObjectEnum.emailAddress.toJson(), 'email_address');
    });

    test('fromJson parses correct value', () {
      expect(EmailAddressObjectEnum.fromJson('email_address'), EmailAddressObjectEnum.emailAddress);
    });

    test('fromJson returns null for unknown value', () {
      expect(EmailAddressObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
