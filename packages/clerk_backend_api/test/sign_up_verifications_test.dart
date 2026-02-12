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
  group('SignUpVerifications', () {
    late SignUpVerifications instance;

    setUp(() {
      instance = SignUpVerifications(
        emailAddress: null,
        phoneNumber: null,
        web3Wallet: null,
        externalAccount: null,
      );
    });

    test('constructor creates instance with null values', () {
      expect(instance.emailAddress, isNull);
      expect(instance.phoneNumber, isNull);
      expect(instance.web3Wallet, isNull);
      expect(instance.externalAccount, isNull);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['email_address'], isNull);
      expect(json['phone_number'], isNull);
      expect(json['web3_wallet'], isNull);
      expect(json['external_account'], isNull);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'email_address': {'next_action': 'needs_prepare', 'supported_strategies': ['email_code']},
        'phone_number': {'next_action': 'needs_attempt', 'supported_strategies': ['phone_code']},
        'web3_wallet': {'supported_strategies': []},
        'external_account': {'provider': 'google'},
      };
      final result = SignUpVerifications.fromJson(json);
      expect(result, isNotNull);
      expect(result!.emailAddress, isNotNull);
      expect(result.externalAccount, isNotNull);
    });

    test('fromJson returns null for non-map input', () {
      expect(SignUpVerifications.fromJson('invalid'), isNull);
      expect(SignUpVerifications.fromJson(123), isNull);
      expect(SignUpVerifications.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SignUpVerifications.listFromJson([]), isEmpty);
      expect(SignUpVerifications.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = SignUpVerifications(
        emailAddress: null,
        phoneNumber: null,
        web3Wallet: null,
        externalAccount: null,
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SignUpVerifications'));
      expect(str, contains('emailAddress=null'));
    });

    test('requiredKeys contains required fields', () {
      expect(SignUpVerifications.requiredKeys, contains('email_address'));
      expect(SignUpVerifications.requiredKeys, contains('phone_number'));
      expect(SignUpVerifications.requiredKeys, contains('web3_wallet'));
      expect(SignUpVerifications.requiredKeys, contains('external_account'));
    });
  });
}
