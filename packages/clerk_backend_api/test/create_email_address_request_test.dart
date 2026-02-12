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
  group('CreateEmailAddressRequest', () {
    late CreateEmailAddressRequest instance;

    setUp(() {
      instance = CreateEmailAddressRequest(
        userId: 'user_123',
        emailAddress: 'test@example.com',
        verified: true,
        primary: true,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = CreateEmailAddressRequest(
        userId: 'user_456',
        emailAddress: 'user@example.com',
      );
      expect(minimal.userId, 'user_456');
      expect(minimal.emailAddress, 'user@example.com');
      expect(minimal.verified, isNull);
      expect(minimal.primary, isNull);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.userId, 'user_123');
      expect(instance.emailAddress, 'test@example.com');
      expect(instance.verified, true);
      expect(instance.primary, true);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['user_id'], 'user_123');
      expect(json['email_address'], 'test@example.com');
      expect(json['verified'], true);
      expect(json['primary'], true);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'user_id': 'user_789',
        'email_address': 'another@example.com',
        'verified': false,
        'primary': false,
      };
      final result = CreateEmailAddressRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.userId, 'user_789');
      expect(result.emailAddress, 'another@example.com');
      expect(result.verified, false);
      expect(result.primary, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(CreateEmailAddressRequest.fromJson('invalid'), isNull);
      expect(CreateEmailAddressRequest.fromJson(123), isNull);
      expect(CreateEmailAddressRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'user_id': 'user_1', 'email_address': 'user1@example.com'},
        {'user_id': 'user_2', 'email_address': 'user2@example.com', 'verified': true},
      ];
      final result = CreateEmailAddressRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].emailAddress, 'user1@example.com');
      expect(result[1].verified, true);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreateEmailAddressRequest.listFromJson([]), isEmpty);
      expect(CreateEmailAddressRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = CreateEmailAddressRequest(
        userId: 'user_123',
        emailAddress: 'test@example.com',
        verified: true,
        primary: true,
      );
      expect(instance, equals(other));

      final different = CreateEmailAddressRequest(
        userId: 'user_different',
        emailAddress: 'different@example.com',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreateEmailAddressRequest'));
      expect(str, contains('userId=user_123'));
      expect(str, contains('emailAddress=test@example.com'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreateEmailAddressRequest.requiredKeys, contains('user_id'));
      expect(CreateEmailAddressRequest.requiredKeys, contains('email_address'));
    });
  });
}
