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
  group('SignUp', () {
    late SignUp instance;
    late SignUpVerifications verifications;

    setUp(() {
      verifications = SignUpVerifications(
        emailAddress: null,
        phoneNumber: null,
        web3Wallet: null,
        externalAccount: null,
      );
      instance = SignUp(
        object: SignUpObjectEnum.signUpAttempt,
        id: 'signup_123',
        status: SignUpStatusEnum.missingRequirements,
        verifications: verifications,
        username: 'testuser',
        emailAddress: 'test@example.com',
        phoneNumber: null,
        web3Wallet: null,
        passwordEnabled: true,
        firstName: 'Test',
        lastName: 'User',
        customAction: false,
        externalId: null,
        createdSessionId: null,
        createdUserId: null,
        abandonAt: 1234567890,
        legalAcceptedAt: null,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.id, 'signup_123');
      expect(instance.object, SignUpObjectEnum.signUpAttempt);
      expect(instance.status, SignUpStatusEnum.missingRequirements);
      expect(instance.username, 'testuser');
      expect(instance.emailAddress, 'test@example.com');
      expect(instance.passwordEnabled, true);
    });

    test('constructor uses default values for optional lists', () {
      expect(instance.requiredFields, isEmpty);
      expect(instance.optionalFields, isEmpty);
      expect(instance.missingFields, isEmpty);
      expect(instance.unverifiedFields, isEmpty);
    });

    test('constructor uses default values for metadata', () {
      expect(instance.unsafeMetadata, isEmpty);
      expect(instance.publicMetadata, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'signup_123');
      expect(json['object'], SignUpObjectEnum.signUpAttempt);
      expect(json['status'], SignUpStatusEnum.missingRequirements);
      expect(json['username'], 'testuser');
      expect(json['email_address'], 'test@example.com');
      expect(json['password_enabled'], true);
    });

    test('fromJson returns null for non-map input', () {
      expect(SignUp.fromJson('invalid'), isNull);
      expect(SignUp.fromJson(123), isNull);
      expect(SignUp.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SignUp.listFromJson([]), isEmpty);
      expect(SignUp.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SignUp'));
      expect(str, contains('id=signup_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(SignUp.requiredKeys, contains('object'));
      expect(SignUp.requiredKeys, contains('id'));
      expect(SignUp.requiredKeys, contains('status'));
      expect(SignUp.requiredKeys, contains('verifications'));
    });

    test('status enum values are correct', () {
      expect(SignUpStatusEnum.missingRequirements.value, 'missing_requirements');
      expect(SignUpStatusEnum.complete.value, 'complete');
      expect(SignUpStatusEnum.abandoned.value, 'abandoned');
    });
  });
}
