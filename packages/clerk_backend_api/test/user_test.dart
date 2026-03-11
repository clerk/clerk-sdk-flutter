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
  group('User', () {
    late User instance;

    setUp(() {
      instance = User(
        id: 'user_123',
        object: UserObjectEnum.user,
        externalId: null,
        primaryEmailAddressId: 'email_123',
        primaryPhoneNumberId: null,
        primaryWeb3WalletId: null,
        username: 'testuser',
        firstName: 'Test',
        lastName: 'User',
        hasImage: false,
        passwordEnabled: true,
        twoFactorEnabled: false,
        totpEnabled: false,
        backupCodeEnabled: false,
        mfaEnabledAt: null,
        mfaDisabledAt: null,
        lastSignInAt: 1234567890,
        banned: false,
        locked: false,
        lockoutExpiresInSeconds: null,
        verificationAttemptsRemaining: null,
        updatedAt: 1234567890,
        createdAt: 1234567890,
        deleteSelfEnabled: true,
        createOrganizationEnabled: true,
        lastActiveAt: 1234567890,
        legalAcceptedAt: null,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.id, 'user_123');
      expect(instance.object, UserObjectEnum.user);
      expect(instance.username, 'testuser');
      expect(instance.firstName, 'Test');
      expect(instance.lastName, 'User');
      expect(instance.hasImage, false);
      expect(instance.passwordEnabled, true);
      expect(instance.banned, false);
    });

    test('constructor uses default values for optional lists', () {
      expect(instance.emailAddresses, isEmpty);
      expect(instance.phoneNumbers, isEmpty);
      expect(instance.web3Wallets, isEmpty);
      expect(instance.passkeys, isEmpty);
      expect(instance.externalAccounts, isEmpty);
      expect(instance.samlAccounts, isEmpty);
      expect(instance.organizationMemberships, isEmpty);
    });

    test('constructor uses default values for metadata', () {
      expect(instance.publicMetadata, isEmpty);
      expect(instance.privateMetadata, isEmpty);
      expect(instance.unsafeMetadata, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'user_123');
      expect(json['object'], UserObjectEnum.user);
      expect(json['username'], 'testuser');
      expect(json['first_name'], 'Test');
      expect(json['last_name'], 'User');
      expect(json['has_image'], false);
      expect(json['password_enabled'], true);
      expect(json['banned'], false);
    });

    test('fromJson returns null for non-map input', () {
      expect(User.fromJson('invalid'), isNull);
      expect(User.fromJson(123), isNull);
      expect(User.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(User.listFromJson([]), isEmpty);
      expect(User.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('User'));
      expect(str, contains('id=user_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(User.requiredKeys, contains('id'));
      expect(User.requiredKeys, contains('object'));
      expect(User.requiredKeys, contains('has_image'));
      expect(User.requiredKeys, contains('password_enabled'));
      expect(User.requiredKeys, contains('banned'));
    });

    test('equality works correctly', () {
      final user2 = User(
        id: 'user_123',
        object: UserObjectEnum.user,
        externalId: null,
        primaryEmailAddressId: 'email_123',
        primaryPhoneNumberId: null,
        primaryWeb3WalletId: null,
        username: 'testuser',
        firstName: 'Test',
        lastName: 'User',
        hasImage: false,
        passwordEnabled: true,
        twoFactorEnabled: false,
        totpEnabled: false,
        backupCodeEnabled: false,
        mfaEnabledAt: null,
        mfaDisabledAt: null,
        lastSignInAt: 1234567890,
        banned: false,
        locked: false,
        lockoutExpiresInSeconds: null,
        verificationAttemptsRemaining: null,
        updatedAt: 1234567890,
        createdAt: 1234567890,
        deleteSelfEnabled: true,
        createOrganizationEnabled: true,
        lastActiveAt: 1234567890,
        legalAcceptedAt: null,
      );
      expect(instance, equals(user2));
    });
  });
}
