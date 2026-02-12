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
  group('EmailAddressVerification', () {
    late EmailAddressVerification instance;

    setUp(() {
      instance = EmailAddressVerification(
        status: EmailAddressVerificationStatusEnum.verified,
        strategy: EmailAddressVerificationStrategyEnum.emailLink,
        attempts: 1,
        expireAt: 1234567890,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.status, EmailAddressVerificationStatusEnum.verified);
      expect(instance.strategy, EmailAddressVerificationStrategyEnum.emailLink);
      expect(instance.attempts, 1);
      expect(instance.expireAt, 1234567890);
    });

    test('constructor allows null optional parameters', () {
      expect(instance.verifiedAtClient, isNull);
      expect(instance.error, isNull);
      expect(instance.externalVerificationRedirectUrl, isNull);
    });

    test('constructor creates instance with optional parameters', () {
      final verification = EmailAddressVerification(
        status: EmailAddressVerificationStatusEnum.unverified,
        strategy: EmailAddressVerificationStrategyEnum.emailLink,
        attempts: 0,
        expireAt: 1234567890,
        verifiedAtClient: 'client_123',
      );
      expect(verification.verifiedAtClient, 'client_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['status'], EmailAddressVerificationStatusEnum.verified);
      expect(json['strategy'], EmailAddressVerificationStrategyEnum.emailLink);
      expect(json['attempts'], 1);
      expect(json['expire_at'], 1234567890);
    });

    test('fromJson returns null for non-map input', () {
      expect(EmailAddressVerification.fromJson('invalid'), isNull);
      expect(EmailAddressVerification.fromJson(123), isNull);
      expect(EmailAddressVerification.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(EmailAddressVerification.listFromJson([]), isEmpty);
      expect(EmailAddressVerification.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('EmailAddressVerification'));
      expect(str, contains('status='));
    });

    test('requiredKeys contains required fields', () {
      expect(EmailAddressVerification.requiredKeys, contains('status'));
      expect(EmailAddressVerification.requiredKeys, contains('strategy'));
      expect(EmailAddressVerification.requiredKeys, contains('attempts'));
      expect(EmailAddressVerification.requiredKeys, contains('expire_at'));
    });
  });
}
