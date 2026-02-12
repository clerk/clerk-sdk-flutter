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
  group('VerifyTOTP200Response', () {
    late VerifyTOTP200Response instance;

    setUp(() {
      instance = VerifyTOTP200Response(
        verified: true,
        codeType: VerifyTOTP200ResponseCodeTypeEnum.totp,
      );
    });

    test('constructor creates instance with optional parameters', () {
      final empty = VerifyTOTP200Response();
      expect(empty.verified, isNull);
      expect(empty.codeType, isNull);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.verified, true);
      expect(instance.codeType, VerifyTOTP200ResponseCodeTypeEnum.totp);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['verified'], true);
      expect(json['code_type'], VerifyTOTP200ResponseCodeTypeEnum.totp);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'verified': true,
        'code_type': 'backup_code',
      };
      final result = VerifyTOTP200Response.fromJson(json);
      expect(result, isNotNull);
      expect(result!.verified, true);
      expect(result.codeType, VerifyTOTP200ResponseCodeTypeEnum.backupCode);
    });

    test('fromJson returns null for non-map input', () {
      expect(VerifyTOTP200Response.fromJson('invalid'), isNull);
      expect(VerifyTOTP200Response.fromJson(123), isNull);
      expect(VerifyTOTP200Response.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'verified': true, 'code_type': 'totp'},
        {'verified': false, 'code_type': 'backup_code'},
      ];
      final result = VerifyTOTP200Response.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].codeType, VerifyTOTP200ResponseCodeTypeEnum.totp);
      expect(result[1].codeType, VerifyTOTP200ResponseCodeTypeEnum.backupCode);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(VerifyTOTP200Response.listFromJson([]), isEmpty);
      expect(VerifyTOTP200Response.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = VerifyTOTP200Response(
        verified: true,
        codeType: VerifyTOTP200ResponseCodeTypeEnum.totp,
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('VerifyTOTP200Response'));
      expect(str, contains('verified=true'));
    });

    test('requiredKeys is empty', () {
      expect(VerifyTOTP200Response.requiredKeys, isEmpty);
    });
  });

  group('VerifyTOTP200ResponseCodeTypeEnum', () {
    test('values contains all enum values', () {
      expect(VerifyTOTP200ResponseCodeTypeEnum.values, contains(VerifyTOTP200ResponseCodeTypeEnum.totp));
      expect(VerifyTOTP200ResponseCodeTypeEnum.values, contains(VerifyTOTP200ResponseCodeTypeEnum.backupCode));
    });

    test('toJson returns correct string', () {
      expect(VerifyTOTP200ResponseCodeTypeEnum.totp.toJson(), 'totp');
      expect(VerifyTOTP200ResponseCodeTypeEnum.backupCode.toJson(), 'backup_code');
    });

    test('fromJson parses correct value', () {
      expect(VerifyTOTP200ResponseCodeTypeEnum.fromJson('totp'), VerifyTOTP200ResponseCodeTypeEnum.totp);
      expect(VerifyTOTP200ResponseCodeTypeEnum.fromJson('backup_code'), VerifyTOTP200ResponseCodeTypeEnum.backupCode);
    });

    test('fromJson returns null for unknown value', () {
      expect(VerifyTOTP200ResponseCodeTypeEnum.fromJson('unknown'), isNull);
    });
  });
}
