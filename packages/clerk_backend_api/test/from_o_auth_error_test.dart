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
  group('FromOAuthError', () {
    late FromOAuthError instance;

    setUp(() {
      instance = FromOAuthError(
        message: 'Error message',
        longMessage: 'A longer error message',
        code: 'oauth_error',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.message, 'Error message');
      expect(instance.longMessage, 'A longer error message');
      expect(instance.code, 'oauth_error');
      expect(instance.meta, isNull);
      expect(instance.clerkTraceId, isNull);
    });

    test('constructor creates instance with optional parameters', () {
      final error = FromOAuthError(
        message: 'Error',
        longMessage: 'Long error',
        code: 'error_code',
        meta: {'key': 'value'},
        clerkTraceId: 'trace_123',
      );
      expect(error.meta, {'key': 'value'});
      expect(error.clerkTraceId, 'trace_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['message'], 'Error message');
      expect(json['long_message'], 'A longer error message');
      expect(json['code'], 'oauth_error');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'message': 'Error message',
        'long_message': 'A longer error message',
        'code': 'oauth_error',
      };
      final result = FromOAuthError.fromJson(json);
      expect(result, isNotNull);
      expect(result!.message, 'Error message');
      expect(result.longMessage, 'A longer error message');
      expect(result.code, 'oauth_error');
    });

    test('fromJson returns null for non-map input', () {
      expect(FromOAuthError.fromJson('invalid'), isNull);
      expect(FromOAuthError.fromJson(123), isNull);
      expect(FromOAuthError.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(FromOAuthError.listFromJson([]), isEmpty);
      expect(FromOAuthError.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('FromOAuthError'));
      expect(str, contains('message=Error message'));
    });

    test('requiredKeys contains required fields', () {
      expect(FromOAuthError.requiredKeys, contains('message'));
      expect(FromOAuthError.requiredKeys, contains('long_message'));
      expect(FromOAuthError.requiredKeys, contains('code'));
    });
  });
}
