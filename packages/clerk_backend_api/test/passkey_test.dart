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
  group('Passkey', () {
    late Passkey instance;
    late PasskeyVerification verification;

    setUp(() {
      verification = PasskeyVerification(
        status: PasskeyVerificationStatusEnum.verified,
        strategy: PasskeyVerificationStrategyEnum.passkey,
        attempts: 1,
        expireAt: 1700000000,
      );
      instance = Passkey(
        id: 'pk_123',
        object: PasskeyObjectEnum.passkey,
        name: 'My Passkey',
        lastUsedAt: 1600000000,
        verification: verification,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = Passkey(
        object: PasskeyObjectEnum.passkey,
        name: 'Test Passkey',
        lastUsedAt: 1600000000,
        verification: null,
      );
      expect(minimal.object, PasskeyObjectEnum.passkey);
      expect(minimal.name, 'Test Passkey');
      expect(minimal.lastUsedAt, 1600000000);
      expect(minimal.verification, isNull);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.id, 'pk_123');
      expect(instance.object, PasskeyObjectEnum.passkey);
      expect(instance.name, 'My Passkey');
      expect(instance.lastUsedAt, 1600000000);
      expect(instance.verification, verification);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'pk_123');
      expect(json['object'], PasskeyObjectEnum.passkey);
      expect(json['name'], 'My Passkey');
      expect(json['last_used_at'], 1600000000);
      expect(json['verification'], isNotNull);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'id': 'pk_456',
        'object': 'passkey',
        'name': 'Another Passkey',
        'last_used_at': 1600002000,
        'verification': {
          'status': 'verified',
          'strategy': 'passkey',
          'attempts': 2,
          'expire_at': 1700000000,
        },
      };
      final result = Passkey.fromJson(json);
      expect(result, isNotNull);
      expect(result!.id, 'pk_456');
      expect(result.object, PasskeyObjectEnum.passkey);
      expect(result.name, 'Another Passkey');
      expect(result.lastUsedAt, 1600002000);
      expect(result.verification, isNotNull);
    });

    test('fromJson returns null for non-map input', () {
      expect(Passkey.fromJson('invalid'), isNull);
      expect(Passkey.fromJson(123), isNull);
      expect(Passkey.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {
          'object': 'passkey',
          'name': 'Passkey 1',
          'last_used_at': 1600000000,
          'verification': {
            'status': 'verified',
            'strategy': 'passkey',
            'attempts': 1,
            'expire_at': 1700000000,
          },
        },
        {
          'object': 'passkey',
          'name': 'Passkey 2',
          'last_used_at': 1600001000,
          'verification': {
            'status': 'verified',
            'strategy': 'passkey',
            'attempts': 1,
            'expire_at': 1700000000,
          },
        },
      ];
      final result = Passkey.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].name, 'Passkey 1');
      expect(result[1].name, 'Passkey 2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Passkey.listFromJson([]), isEmpty);
      expect(Passkey.listFromJson(null), isEmpty);
    });

    test('mapFromJson creates map from json', () {
      final jsonMap = {
        'key1': {
          'object': 'passkey',
          'name': 'Passkey 1',
          'last_used_at': 1600000000,
          'verification': {
            'status': 'verified',
            'strategy': 'passkey',
            'attempts': 1,
            'expire_at': 1700000000,
          },
        },
      };
      final result = Passkey.mapFromJson(jsonMap);
      expect(result.length, 1);
      expect(result['key1']!.name, 'Passkey 1');
    });

    test('equality operator works correctly', () {
      final other = Passkey(
        id: 'pk_123',
        object: PasskeyObjectEnum.passkey,
        name: 'My Passkey',
        lastUsedAt: 1600000000,
        verification: verification,
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      final other = Passkey(
        id: 'pk_123',
        object: PasskeyObjectEnum.passkey,
        name: 'My Passkey',
        lastUsedAt: 1600000000,
        verification: verification,
      );
      expect(instance.hashCode, equals(other.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Passkey'));
      expect(str, contains('name=My Passkey'));
    });

    test('requiredKeys contains required fields', () {
      expect(Passkey.requiredKeys, contains('object'));
      expect(Passkey.requiredKeys, contains('name'));
      expect(Passkey.requiredKeys, contains('last_used_at'));
      expect(Passkey.requiredKeys, contains('verification'));
    });
  });

  group('PasskeyObjectEnum', () {
    test('values contains all enum values', () {
      expect(PasskeyObjectEnum.values, contains(PasskeyObjectEnum.passkey));
    });

    test('toJson returns correct string', () {
      expect(PasskeyObjectEnum.passkey.toJson(), 'passkey');
    });

    test('fromJson parses correct value', () {
      expect(PasskeyObjectEnum.fromJson('passkey'), PasskeyObjectEnum.passkey);
    });

    test('fromJson returns null for unknown value', () {
      expect(PasskeyObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
