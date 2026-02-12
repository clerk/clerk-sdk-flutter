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
  group('SessionTask', () {
    late SessionTask instance;

    setUp(() {
      instance = SessionTask(key: 'verify_email');
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.key, 'verify_email');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['key'], 'verify_email');
    });

    test('fromJson creates instance from map', () {
      final json = {'key': 'verify_phone'};
      final result = SessionTask.fromJson(json);
      expect(result, isNotNull);
      expect(result!.key, 'verify_phone');
    });

    test('fromJson returns null for non-map input', () {
      expect(SessionTask.fromJson('invalid'), isNull);
      expect(SessionTask.fromJson(123), isNull);
      expect(SessionTask.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SessionTask.listFromJson([]), isEmpty);
      expect(SessionTask.listFromJson(null), isEmpty);
    });

    test('equality works correctly', () {
      final other = SessionTask(key: 'verify_email');
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SessionTask'));
      expect(str, contains('key=verify_email'));
    });

    test('requiredKeys contains required fields', () {
      expect(SessionTask.requiredKeys, contains('key'));
    });
  });
}
