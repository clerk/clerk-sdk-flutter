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
  group('JWTTemplate', () {
    late JWTTemplate instance;
    late Object claims;

    setUp(() {
      claims = {'sub': '{{user.id}}', 'name': '{{user.first_name}}'};
      instance = JWTTemplate(
        object: JWTTemplateObjectEnum.jwtTemplate,
        id: 'jwt_123',
        name: 'Custom JWT',
        claims: claims,
        lifetime: 3600,
        allowedClockSkew: 5,
        customSigningKey: false,
        signingAlgorithm: 'RS256',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, JWTTemplateObjectEnum.jwtTemplate);
      expect(instance.id, 'jwt_123');
      expect(instance.name, 'Custom JWT');
      expect(instance.claims, claims);
      expect(instance.lifetime, 3600);
      expect(instance.allowedClockSkew, 5);
      expect(instance.customSigningKey, false);
      expect(instance.signingAlgorithm, 'RS256');
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], JWTTemplateObjectEnum.jwtTemplate);
      expect(json['id'], 'jwt_123');
      expect(json['name'], 'Custom JWT');
      expect(json['claims'], claims);
      expect(json['lifetime'], 3600);
      expect(json['allowed_clock_skew'], 5);
      expect(json['custom_signing_key'], false);
      expect(json['signing_algorithm'], 'RS256');
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'jwt_template',
        'id': 'jwt_456',
        'name': 'Another JWT',
        'claims': {'aud': 'api'},
        'lifetime': 7200,
        'allowed_clock_skew': 10,
        'custom_signing_key': true,
        'signing_algorithm': 'ES256',
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = JWTTemplate.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, JWTTemplateObjectEnum.jwtTemplate);
      expect(parsed.id, 'jwt_456');
      expect(parsed.name, 'Another JWT');
      expect(parsed.lifetime, 7200);
      expect(parsed.customSigningKey, true);
      expect(parsed.signingAlgorithm, 'ES256');
    });

    test('fromJson returns null for non-map input', () {
      expect(JWTTemplate.fromJson('not a map'), isNull);
      expect(JWTTemplate.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'jwt_template', 'id': 'j1', 'name': 'JWT 1', 'claims': {}, 'lifetime': 100, 'allowed_clock_skew': 1, 'custom_signing_key': false, 'signing_algorithm': 'RS256', 'created_at': 1, 'updated_at': 2},
        {'object': 'jwt_template', 'id': 'j2', 'name': 'JWT 2', 'claims': {}, 'lifetime': 200, 'allowed_clock_skew': 2, 'custom_signing_key': true, 'signing_algorithm': 'ES256', 'created_at': 3, 'updated_at': 4},
      ];
      final list = JWTTemplate.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'j1');
      expect(list[1].id, 'j2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(JWTTemplate.listFromJson([]), isEmpty);
      expect(JWTTemplate.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = JWTTemplate(
        object: JWTTemplateObjectEnum.jwtTemplate,
        id: 'jwt_123',
        name: 'Custom JWT',
        claims: claims,
        lifetime: 3600,
        allowedClockSkew: 5,
        customSigningKey: false,
        signingAlgorithm: 'RS256',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final different = JWTTemplate(
        object: JWTTemplateObjectEnum.jwtTemplate,
        id: 'jwt_different',
        name: 'Different',
        claims: {},
        lifetime: 100,
        allowedClockSkew: 1,
        customSigningKey: true,
        signingAlgorithm: 'ES256',
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('JWTTemplate'));
      expect(str, contains('jwt_123'));
      expect(str, contains('Custom JWT'));
    });

    test('requiredKeys contains required fields', () {
      expect(JWTTemplate.requiredKeys, contains('object'));
      expect(JWTTemplate.requiredKeys, contains('id'));
      expect(JWTTemplate.requiredKeys, contains('name'));
      expect(JWTTemplate.requiredKeys, contains('claims'));
      expect(JWTTemplate.requiredKeys, contains('lifetime'));
      expect(JWTTemplate.requiredKeys, contains('allowed_clock_skew'));
      expect(JWTTemplate.requiredKeys, contains('custom_signing_key'));
      expect(JWTTemplate.requiredKeys, contains('signing_algorithm'));
      expect(JWTTemplate.requiredKeys, contains('created_at'));
      expect(JWTTemplate.requiredKeys, contains('updated_at'));
    });
  });

  group('JWTTemplateObjectEnum', () {
    test('values contains all enum values', () {
      expect(JWTTemplateObjectEnum.values, contains(JWTTemplateObjectEnum.jwtTemplate));
    });

    test('toJson returns correct string', () {
      expect(JWTTemplateObjectEnum.jwtTemplate.toJson(), 'jwt_template');
    });

    test('fromJson parses correct value', () {
      expect(JWTTemplateObjectEnum.fromJson('jwt_template'), JWTTemplateObjectEnum.jwtTemplate);
    });

    test('fromJson returns null for unknown value', () {
      expect(JWTTemplateObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
