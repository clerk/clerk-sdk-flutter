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
  group('SAML', () {
    late SAML instance;

    setUp(() {
      instance = SAML(
        status: SAMLStatusEnum.unverified,
        strategy: SAMLStrategyEnum.saml,
        externalVerificationRedirectUrl: 'https://example.com/saml',
        expireAt: 1234567890,
        attempts: 0,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.status, SAMLStatusEnum.unverified);
      expect(instance.strategy, SAMLStrategyEnum.saml);
      expect(instance.externalVerificationRedirectUrl, 'https://example.com/saml');
      expect(instance.expireAt, 1234567890);
      expect(instance.attempts, 0);
    });

    test('constructor allows null optional parameters', () {
      final saml = SAML(
        status: SAMLStatusEnum.verified,
        strategy: SAMLStrategyEnum.saml,
        externalVerificationRedirectUrl: null,
        expireAt: 1234567890,
        attempts: null,
      );
      expect(saml.externalVerificationRedirectUrl, isNull);
      expect(saml.error, isNull);
      expect(saml.verifiedAtClient, isNull);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['status'], SAMLStatusEnum.unverified);
      expect(json['strategy'], SAMLStrategyEnum.saml);
      expect(json['external_verification_redirect_url'], 'https://example.com/saml');
      expect(json['expire_at'], 1234567890);
    });

    test('fromJson returns null for non-map input', () {
      expect(SAML.fromJson('invalid'), isNull);
      expect(SAML.fromJson(123), isNull);
      expect(SAML.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SAML.listFromJson([]), isEmpty);
      expect(SAML.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SAML'));
      expect(str, contains('status='));
    });

    test('requiredKeys contains required fields', () {
      expect(SAML.requiredKeys, contains('status'));
      expect(SAML.requiredKeys, contains('strategy'));
      expect(SAML.requiredKeys, contains('expire_at'));
    });

    test('status enum values are correct', () {
      expect(SAMLStatusEnum.unverified.value, 'unverified');
      expect(SAMLStatusEnum.verified.value, 'verified');
      expect(SAMLStatusEnum.expired.value, 'expired');
    });
  });
}
