//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

void main() {
  group('Token', () {
    late Token instance;

    setUp(() {
      instance = Token(
        object: TokenObjectEnum.token,
        jwt: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIn0.dozjgNryP4J3jVmNHl0w5N_XgL0n3I9PlFUP0THsR8U',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, TokenObjectEnum.token);
      expect(instance.jwt, startsWith('eyJ'));
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], TokenObjectEnum.token);
      expect(json['jwt'], startsWith('eyJ'));
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'token',
        'jwt': 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.test.signature',
      };
      final parsed = Token.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, TokenObjectEnum.token);
      expect(parsed.jwt, contains('test'));
    });

    test('fromJson returns null for non-map input', () {
      expect(Token.fromJson('not a map'), isNull);
      expect(Token.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'token', 'jwt': 'jwt1'},
        {'object': 'token', 'jwt': 'jwt2'},
      ];
      final list = Token.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].jwt, 'jwt1');
      expect(list[1].jwt, 'jwt2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Token.listFromJson([]), isEmpty);
      expect(Token.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = Token(
        object: TokenObjectEnum.token,
        jwt: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIn0.dozjgNryP4J3jVmNHl0w5N_XgL0n3I9PlFUP0THsR8U',
      );
      final different = Token(
        object: TokenObjectEnum.token,
        jwt: 'different_jwt',
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = Token(
        object: TokenObjectEnum.token,
        jwt: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIn0.dozjgNryP4J3jVmNHl0w5N_XgL0n3I9PlFUP0THsR8U',
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Token'));
      expect(str, contains('jwt'));
    });

    test('requiredKeys contains required fields', () {
      expect(Token.requiredKeys, contains('object'));
      expect(Token.requiredKeys, contains('jwt'));
    });
  });

  group('TokenObjectEnum', () {
    test('values contains all enum values', () {
      expect(TokenObjectEnum.values, contains(TokenObjectEnum.token));
    });

    test('toJson returns correct string', () {
      expect(TokenObjectEnum.token.toJson(), 'token');
    });

    test('fromJson parses correct value', () {
      expect(TokenObjectEnum.fromJson('token'), TokenObjectEnum.token);
    });

    test('fromJson returns null for unknown value', () {
      expect(TokenObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
