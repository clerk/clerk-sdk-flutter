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
  group('FromOAuth', () {
    late FromOAuth instance;

    setUp(() {
      instance = FromOAuth(
        status: FromOAuthStatusEnum.unverified,
        strategy: 'oauth_google',
        expireAt: 1234567890,
        attempts: 0,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.status, FromOAuthStatusEnum.unverified);
      expect(instance.strategy, 'oauth_google');
      expect(instance.expireAt, 1234567890);
      expect(instance.attempts, 0);
      expect(instance.error, isNull);
      expect(instance.verifiedAtClient, isNull);
    });

    test('constructor creates instance with optional parameters', () {
      final oauth = FromOAuth(
        status: FromOAuthStatusEnum.verified,
        strategy: 'oauth_github',
        expireAt: 1234567890,
        attempts: 1,
        verifiedAtClient: 'client_123',
      );
      expect(oauth.status, FromOAuthStatusEnum.verified);
      expect(oauth.verifiedAtClient, 'client_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['status'], FromOAuthStatusEnum.unverified);
      expect(json['strategy'], 'oauth_google');
      expect(json['expire_at'], 1234567890);
      expect(json['attempts'], 0);
    });

    test('fromJson returns null for non-map input', () {
      expect(FromOAuth.fromJson('invalid'), isNull);
      expect(FromOAuth.fromJson(123), isNull);
      expect(FromOAuth.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(FromOAuth.listFromJson([]), isEmpty);
      expect(FromOAuth.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('FromOAuth'));
      expect(str, contains('strategy=oauth_google'));
    });

    test('requiredKeys contains required fields', () {
      expect(FromOAuth.requiredKeys, contains('status'));
      expect(FromOAuth.requiredKeys, contains('strategy'));
      expect(FromOAuth.requiredKeys, contains('expire_at'));
      expect(FromOAuth.requiredKeys, contains('attempts'));
    });

    test('status enum values are correct', () {
      expect(FromOAuthStatusEnum.unverified.value, 'unverified');
      expect(FromOAuthStatusEnum.verified.value, 'verified');
    });
  });
}
