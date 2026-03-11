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
  group('ClerkErrors', () {
    late ClerkErrors instance;
    late ClerkError error;

    setUp(() {
      error = ClerkError(
        message: 'Test error',
        longMessage: 'This is a test error',
        code: 'test_error',
      );
      instance = ClerkErrors(
        errors: [error],
        meta: {'key': 'value'},
        clerkTraceId: 'trace_123',
      );
    });

    test('constructor creates instance with default values', () {
      final empty = ClerkErrors();
      expect(empty.errors, isEmpty);
      expect(empty.meta, isNull);
      expect(empty.clerkTraceId, isNull);
    });

    test('constructor creates instance with parameters', () {
      expect(instance.errors.length, 1);
      expect(instance.errors[0].message, 'Test error');
      expect(instance.meta, {'key': 'value'});
      expect(instance.clerkTraceId, 'trace_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['errors'], isA<List>());
      expect(json['meta'], {'key': 'value'});
      expect(json['clerk_trace_id'], 'trace_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'errors': [
          {'message': 'Error 1', 'long_message': 'Long error 1', 'code': 'err1'}
        ],
        'meta': {'info': 'data'},
        'clerk_trace_id': 'trace_456',
      };
      final result = ClerkErrors.fromJson(json);
      expect(result, isNotNull);
      expect(result!.errors.length, 1);
      expect(result.clerkTraceId, 'trace_456');
    });

    test('fromJson returns null for non-map input', () {
      expect(ClerkErrors.fromJson('invalid'), isNull);
      expect(ClerkErrors.fromJson(123), isNull);
      expect(ClerkErrors.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(ClerkErrors.listFromJson([]), isEmpty);
      expect(ClerkErrors.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('ClerkErrors'));
      expect(str, contains('errors='));
    });

    test('requiredKeys contains required fields', () {
      expect(ClerkErrors.requiredKeys, contains('errors'));
    });
  });
}
