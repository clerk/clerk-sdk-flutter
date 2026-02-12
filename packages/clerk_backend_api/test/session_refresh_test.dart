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
  group('SessionRefresh', () {
    late SessionRefresh instance;

    setUp(() {
      instance = SessionRefresh(
        object: SessionRefreshObjectEnum.cookies,
        jwt: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.test',
        cookies: ['session=abc123; Path=/; HttpOnly'],
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, SessionRefreshObjectEnum.cookies);
      expect(instance.jwt, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.test');
      expect(instance.cookies, ['session=abc123; Path=/; HttpOnly']);
    });

    test('constructor uses default values', () {
      final refresh = SessionRefresh(
        object: SessionRefreshObjectEnum.cookies,
        jwt: 'test_jwt',
      );
      expect(refresh.cookies, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], SessionRefreshObjectEnum.cookies);
      expect(json['jwt'], 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.test');
      expect(json['cookies'], ['session=abc123; Path=/; HttpOnly']);
    });

    test('fromJson returns null for non-map input', () {
      expect(SessionRefresh.fromJson('invalid'), isNull);
      expect(SessionRefresh.fromJson(123), isNull);
      expect(SessionRefresh.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SessionRefresh.listFromJson([]), isEmpty);
      expect(SessionRefresh.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SessionRefresh'));
      expect(str, contains('jwt='));
    });

    test('requiredKeys contains required fields', () {
      expect(SessionRefresh.requiredKeys, contains('object'));
      expect(SessionRefresh.requiredKeys, contains('jwt'));
      expect(SessionRefresh.requiredKeys, contains('cookies'));
    });

    test('object enum values are correct', () {
      expect(SessionRefreshObjectEnum.cookies.value, 'cookies');
    });
  });
}
