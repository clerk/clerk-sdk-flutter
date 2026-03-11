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
  group('SessionActivityResponse', () {
    late SessionActivityResponse instance;

    setUp(() {
      instance = SessionActivityResponse(
        object: 'session_activity',
        id: 'activity_123',
        isMobile: false,
        deviceType: 'desktop',
        browserName: 'Chrome',
        browserVersion: '120.0',
        ipAddress: '192.168.1.1',
        city: 'San Francisco',
        country: 'US',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, 'session_activity');
      expect(instance.id, 'activity_123');
      expect(instance.isMobile, false);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.deviceType, 'desktop');
      expect(instance.browserName, 'Chrome');
      expect(instance.browserVersion, '120.0');
      expect(instance.ipAddress, '192.168.1.1');
      expect(instance.city, 'San Francisco');
      expect(instance.country, 'US');
    });

    test('constructor allows null optional parameters', () {
      final activity = SessionActivityResponse(
        object: 'session_activity',
        id: 'activity_456',
        isMobile: true,
      );
      expect(activity.deviceType, isNull);
      expect(activity.browserName, isNull);
      expect(activity.city, isNull);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], 'session_activity');
      expect(json['id'], 'activity_123');
      expect(json['is_mobile'], false);
      expect(json['device_type'], 'desktop');
      expect(json['browser_name'], 'Chrome');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'session_activity',
        'id': 'activity_123',
        'is_mobile': false,
      };
      final result = SessionActivityResponse.fromJson(json);
      expect(result, isNotNull);
      expect(result!.object, 'session_activity');
      expect(result.id, 'activity_123');
      expect(result.isMobile, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(SessionActivityResponse.fromJson('invalid'), isNull);
      expect(SessionActivityResponse.fromJson(123), isNull);
      expect(SessionActivityResponse.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(SessionActivityResponse.listFromJson([]), isEmpty);
      expect(SessionActivityResponse.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('SessionActivityResponse'));
      expect(str, contains('id=activity_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(SessionActivityResponse.requiredKeys, contains('object'));
      expect(SessionActivityResponse.requiredKeys, contains('id'));
      expect(SessionActivityResponse.requiredKeys, contains('is_mobile'));
    });
  });
}
