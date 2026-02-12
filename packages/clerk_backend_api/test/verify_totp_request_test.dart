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
  group('VerifyTOTPRequest', () {
    late VerifyTOTPRequest instance;

    setUp(() {
      instance = VerifyTOTPRequest(
        code: '123456',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.code, '123456');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['code'], '123456');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'code': '654321',
      };
      final result = VerifyTOTPRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.code, '654321');
    });

    test('fromJson returns null for non-map input', () {
      expect(VerifyTOTPRequest.fromJson('invalid'), isNull);
      expect(VerifyTOTPRequest.fromJson(123), isNull);
      expect(VerifyTOTPRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'code': '111111'},
        {'code': '222222'},
      ];
      final result = VerifyTOTPRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].code, '111111');
      expect(result[1].code, '222222');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(VerifyTOTPRequest.listFromJson([]), isEmpty);
      expect(VerifyTOTPRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = VerifyTOTPRequest(
        code: '123456',
      );
      expect(instance, equals(other));

      final different = VerifyTOTPRequest(
        code: '999999',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('VerifyTOTPRequest'));
      expect(str, contains('code=123456'));
    });

    test('requiredKeys contains required fields', () {
      expect(VerifyTOTPRequest.requiredKeys, contains('code'));
    });
  });
}
