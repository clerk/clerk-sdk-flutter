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
  group('SignUpVerification', () {
    late SignUpVerification instance;

    setUp(() {
      instance = SignUpVerification(
        nextAction: SignUpVerificationNextActionEnum.needsPrepare,
        supportedStrategies: ['email_code', 'phone_code'],
      );
    });

    test('constructor creates instance with default values', () {
      final empty = SignUpVerification();
      expect(empty.nextAction, isNull);
      expect(empty.supportedStrategies, isEmpty);
    });

    test('constructor creates instance with parameters', () {
      expect(instance.nextAction, SignUpVerificationNextActionEnum.needsPrepare);
      expect(instance.supportedStrategies, ['email_code', 'phone_code']);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['next_action'], SignUpVerificationNextActionEnum.needsPrepare);
      expect(json['supported_strategies'], ['email_code', 'phone_code']);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'next_action': 'needs_attempt',
        'supported_strategies': ['oauth'],
      };
      final result = SignUpVerification.fromJson(json);
      expect(result, isNotNull);
      expect(result!.nextAction, SignUpVerificationNextActionEnum.needsAttempt);
      expect(result.supportedStrategies, ['oauth']);
    });

    test('fromJson returns null for non-map input', () {
      expect(SignUpVerification.fromJson('invalid'), isNull);
      expect(SignUpVerification.fromJson(123), isNull);
      expect(SignUpVerification.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SignUpVerification.listFromJson([]), isEmpty);
      expect(SignUpVerification.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SignUpVerification'));
      expect(str, contains('nextAction='));
    });

    test('requiredKeys is empty', () {
      expect(SignUpVerification.requiredKeys, isEmpty);
    });
  });

  group('SignUpVerificationNextActionEnum', () {
    test('values contains all enum values', () {
      expect(SignUpVerificationNextActionEnum.values, contains(SignUpVerificationNextActionEnum.needsPrepare));
      expect(SignUpVerificationNextActionEnum.values, contains(SignUpVerificationNextActionEnum.needsAttempt));
      expect(SignUpVerificationNextActionEnum.values, contains(SignUpVerificationNextActionEnum.empty));
    });

    test('toJson returns correct string', () {
      expect(SignUpVerificationNextActionEnum.needsPrepare.toJson(), 'needs_prepare');
      expect(SignUpVerificationNextActionEnum.needsAttempt.toJson(), 'needs_attempt');
      expect(SignUpVerificationNextActionEnum.empty.toJson(), '');
    });

    test('fromJson parses correct value', () {
      expect(SignUpVerificationNextActionEnum.fromJson('needs_prepare'), SignUpVerificationNextActionEnum.needsPrepare);
      expect(SignUpVerificationNextActionEnum.fromJson('needs_attempt'), SignUpVerificationNextActionEnum.needsAttempt);
    });

    test('fromJson returns null for unknown value', () {
      expect(SignUpVerificationNextActionEnum.fromJson('unknown'), isNull);
    });
  });
}
