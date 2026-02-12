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
  group('CreateRedirectURLRequest', () {
    late CreateRedirectURLRequest instance;

    setUp(() {
      instance = CreateRedirectURLRequest(
        url: 'https://my-app.com/oauth-callback',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.url, 'https://my-app.com/oauth-callback');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['url'], 'https://my-app.com/oauth-callback');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'url': 'my-app://oauth-callback',
      };
      final result = CreateRedirectURLRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.url, 'my-app://oauth-callback');
    });

    test('fromJson returns null for non-map input', () {
      expect(CreateRedirectURLRequest.fromJson('invalid'), isNull);
      expect(CreateRedirectURLRequest.fromJson(123), isNull);
      expect(CreateRedirectURLRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'url': 'https://app1.com/callback'},
        {'url': 'https://app2.com/callback'},
      ];
      final result = CreateRedirectURLRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].url, 'https://app1.com/callback');
      expect(result[1].url, 'https://app2.com/callback');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreateRedirectURLRequest.listFromJson([]), isEmpty);
      expect(CreateRedirectURLRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = CreateRedirectURLRequest(
        url: 'https://my-app.com/oauth-callback',
      );
      expect(instance, equals(other));

      final different = CreateRedirectURLRequest(
        url: 'https://different.com/callback',
      );
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreateRedirectURLRequest'));
      expect(str, contains('url=https://my-app.com/oauth-callback'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreateRedirectURLRequest.requiredKeys, contains('url'));
    });
  });
}
