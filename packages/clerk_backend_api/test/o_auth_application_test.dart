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
  group('OAuthApplication', () {
    late OAuthApplication instance;

    setUp(() {
      instance = OAuthApplication(
        object: OAuthApplicationObjectEnum.oauthApplication,
        id: 'oauth_123',
        instanceId: 'inst_123',
        name: 'Test OAuth App',
        clientId: 'client_123',
        clientUri: 'https://example.com',
        clientImageUrl: null,
        dynamicallyRegistered: false,
        consentScreenEnabled: true,
        pkceRequired: true,
        public: false,
        scopes: 'openid profile email',
        redirectUris: ['https://example.com/callback'],
        callbackUrl: 'https://example.com/callback',
        authorizeUrl: 'https://auth.example.com/authorize',
        tokenFetchUrl: 'https://auth.example.com/token',
        userInfoUrl: 'https://auth.example.com/userinfo',
        discoveryUrl: 'https://auth.example.com/.well-known/openid-configuration',
        tokenIntrospectionUrl: 'https://auth.example.com/introspect',
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.id, 'oauth_123');
      expect(instance.object, OAuthApplicationObjectEnum.oauthApplication);
      expect(instance.instanceId, 'inst_123');
      expect(instance.name, 'Test OAuth App');
      expect(instance.clientId, 'client_123');
      expect(instance.public, false);
      expect(instance.pkceRequired, true);
    });

    test('constructor uses default values for optional lists', () {
      final app = OAuthApplication(
        object: OAuthApplicationObjectEnum.oauthApplication,
        id: 'oauth_456',
        instanceId: 'inst_456',
        name: 'Another App',
        clientId: 'client_456',
        clientUri: null,
        clientImageUrl: null,
        dynamicallyRegistered: false,
        consentScreenEnabled: false,
        pkceRequired: false,
        public: true,
        scopes: 'openid',
        callbackUrl: 'https://example.com/cb',
        authorizeUrl: 'https://auth.example.com/authorize',
        tokenFetchUrl: 'https://auth.example.com/token',
        userInfoUrl: 'https://auth.example.com/userinfo',
        discoveryUrl: 'https://auth.example.com/.well-known/openid-configuration',
        tokenIntrospectionUrl: 'https://auth.example.com/introspect',
        createdAt: 1234567890,
        updatedAt: 1234567890,
      );
      expect(app.redirectUris, isEmpty);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'oauth_123');
      expect(json['object'], OAuthApplicationObjectEnum.oauthApplication);
      expect(json['instance_id'], 'inst_123');
      expect(json['name'], 'Test OAuth App');
      expect(json['client_id'], 'client_123');
      expect(json['public'], false);
      expect(json['scopes'], 'openid profile email');
    });

    test('fromJson returns null for non-map input', () {
      expect(OAuthApplication.fromJson('invalid'), isNull);
      expect(OAuthApplication.fromJson(123), isNull);
      expect(OAuthApplication.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(OAuthApplication.listFromJson([]), isEmpty);
      expect(OAuthApplication.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('OAuthApplication'));
      expect(str, contains('id=oauth_123'));
    });

    test('requiredKeys contains required fields', () {
      expect(OAuthApplication.requiredKeys, contains('object'));
      expect(OAuthApplication.requiredKeys, contains('id'));
      expect(OAuthApplication.requiredKeys, contains('instance_id'));
      expect(OAuthApplication.requiredKeys, contains('name'));
      expect(OAuthApplication.requiredKeys, contains('client_id'));
    });
  });
}
