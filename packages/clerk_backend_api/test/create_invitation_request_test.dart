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
  group('CreateInvitationRequest', () {
    late CreateInvitationRequest instance;
    late Map<String, Object> metadata;

    setUp(() {
      metadata = {'role': 'admin', 'team': 'engineering'};
      instance = CreateInvitationRequest(
        emailAddress: 'test@example.com',
        publicMetadata: metadata,
        redirectUrl: 'https://example.com/callback',
        notify: true,
        ignoreExisting: false,
        expiresInDays: 7,
        templateSlug: CreateInvitationRequestTemplateSlugEnum.invitation,
      );
    });

    test('constructor creates instance with required parameters', () {
      final minimal = CreateInvitationRequest(
        emailAddress: 'user@example.com',
      );
      expect(minimal.emailAddress, 'user@example.com');
      expect(minimal.publicMetadata, isEmpty);
      expect(minimal.notify, true); // default value
      expect(minimal.ignoreExisting, false); // default value
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.emailAddress, 'test@example.com');
      expect(instance.publicMetadata, metadata);
      expect(instance.redirectUrl, 'https://example.com/callback');
      expect(instance.notify, true);
      expect(instance.ignoreExisting, false);
      expect(instance.expiresInDays, 7);
      expect(instance.templateSlug, CreateInvitationRequestTemplateSlugEnum.invitation);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['email_address'], 'test@example.com');
      expect(json['public_metadata'], metadata);
      expect(json['redirect_url'], 'https://example.com/callback');
      expect(json['notify'], true);
      expect(json['ignore_existing'], false);
      expect(json['expires_in_days'], 7);
      expect(json['template_slug'], CreateInvitationRequestTemplateSlugEnum.invitation);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'email_address': 'another@example.com',
        'public_metadata': {'key': 'value'},
        'redirect_url': 'https://other.com/callback',
        'notify': false,
        'ignore_existing': true,
        'expires_in_days': 14,
        'template_slug': 'waitlist_invitation',
      };
      final result = CreateInvitationRequest.fromJson(json);
      expect(result, isNotNull);
      expect(result!.emailAddress, 'another@example.com');
      expect(result.redirectUrl, 'https://other.com/callback');
      expect(result.notify, false);
      expect(result.ignoreExisting, true);
      expect(result.expiresInDays, 14);
      expect(result.templateSlug, CreateInvitationRequestTemplateSlugEnum.waitlistInvitation);
    });

    test('fromJson returns null for non-map input', () {
      expect(CreateInvitationRequest.fromJson('invalid'), isNull);
      expect(CreateInvitationRequest.fromJson(123), isNull);
      expect(CreateInvitationRequest.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'email_address': 'user1@example.com'},
        {'email_address': 'user2@example.com', 'expires_in_days': 30},
      ];
      final result = CreateInvitationRequest.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].emailAddress, 'user1@example.com');
      expect(result[1].expiresInDays, 30);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CreateInvitationRequest.listFromJson([]), isEmpty);
      expect(CreateInvitationRequest.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = CreateInvitationRequest(
        emailAddress: 'test@example.com',
        publicMetadata: metadata,
        redirectUrl: 'https://example.com/callback',
        notify: true,
        ignoreExisting: false,
        expiresInDays: 7,
        templateSlug: CreateInvitationRequestTemplateSlugEnum.invitation,
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CreateInvitationRequest'));
      expect(str, contains('emailAddress=test@example.com'));
    });

    test('requiredKeys contains required fields', () {
      expect(CreateInvitationRequest.requiredKeys, contains('email_address'));
    });
  });

  group('CreateInvitationRequestTemplateSlugEnum', () {
    test('values contains all enum values', () {
      expect(CreateInvitationRequestTemplateSlugEnum.values, contains(CreateInvitationRequestTemplateSlugEnum.invitation));
      expect(CreateInvitationRequestTemplateSlugEnum.values, contains(CreateInvitationRequestTemplateSlugEnum.waitlistInvitation));
    });

    test('toJson returns correct string', () {
      expect(CreateInvitationRequestTemplateSlugEnum.invitation.toJson(), 'invitation');
      expect(CreateInvitationRequestTemplateSlugEnum.waitlistInvitation.toJson(), 'waitlist_invitation');
    });

    test('fromJson parses correct value', () {
      expect(CreateInvitationRequestTemplateSlugEnum.fromJson('invitation'), CreateInvitationRequestTemplateSlugEnum.invitation);
      expect(CreateInvitationRequestTemplateSlugEnum.fromJson('waitlist_invitation'), CreateInvitationRequestTemplateSlugEnum.waitlistInvitation);
    });

    test('fromJson returns null for unknown value', () {
      expect(CreateInvitationRequestTemplateSlugEnum.fromJson('unknown'), isNull);
    });
  });
}
