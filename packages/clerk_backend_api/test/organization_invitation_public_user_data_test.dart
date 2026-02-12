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
  group('OrganizationInvitationPublicUserData', () {
    late OrganizationInvitationPublicUserData instance;

    setUp(() {
      instance = OrganizationInvitationPublicUserData(
        userId: 'user_123',
        firstName: 'John',
        lastName: 'Doe',
        imageUrl: 'https://example.com/image.png',
        hasImage: true,
        identifier: 'john@example.com',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.userId, 'user_123');
      expect(instance.firstName, 'John');
      expect(instance.lastName, 'Doe');
      expect(instance.imageUrl, 'https://example.com/image.png');
      expect(instance.hasImage, true);
      expect(instance.identifier, 'john@example.com');
    });

    test('constructor allows null for optional fields', () {
      final instanceWithNulls = OrganizationInvitationPublicUserData(
        userId: 'user_456',
        firstName: null,
        lastName: null,
        imageUrl: 'https://example.com/default.png',
        hasImage: false,
        identifier: 'user456@example.com',
      );
      expect(instanceWithNulls.firstName, isNull);
      expect(instanceWithNulls.lastName, isNull);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['user_id'], 'user_123');
      expect(json['first_name'], 'John');
      expect(json['last_name'], 'Doe');
      expect(json['image_url'], 'https://example.com/image.png');
      expect(json['has_image'], true);
      expect(json['identifier'], 'john@example.com');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'user_id': 'user_789',
        'first_name': 'Jane',
        'last_name': 'Smith',
        'image_url': 'https://example.com/jane.png',
        'has_image': true,
        'identifier': 'jane@example.com',
      };
      final result = OrganizationInvitationPublicUserData.fromJson(json);
      expect(result, isNotNull);
      expect(result!.userId, 'user_789');
      expect(result.firstName, 'Jane');
      expect(result.lastName, 'Smith');
    });

    test('fromJson returns null for non-map input', () {
      expect(OrganizationInvitationPublicUserData.fromJson('invalid'), isNull);
      expect(OrganizationInvitationPublicUserData.fromJson(123), isNull);
      expect(OrganizationInvitationPublicUserData.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(OrganizationInvitationPublicUserData.listFromJson([]), isEmpty);
      expect(OrganizationInvitationPublicUserData.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = OrganizationInvitationPublicUserData(
        userId: 'user_123',
        firstName: 'John',
        lastName: 'Doe',
        imageUrl: 'https://example.com/image.png',
        hasImage: true,
        identifier: 'john@example.com',
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('OrganizationInvitationPublicUserData'));
      expect(str, contains('userId=user_123'));
      expect(str, contains('firstName=John'));
    });

    test('requiredKeys contains required fields', () {
      expect(OrganizationInvitationPublicUserData.requiredKeys, contains('user_id'));
      expect(OrganizationInvitationPublicUserData.requiredKeys, contains('first_name'));
      expect(OrganizationInvitationPublicUserData.requiredKeys, contains('last_name'));
      expect(OrganizationInvitationPublicUserData.requiredKeys, contains('image_url'));
      expect(OrganizationInvitationPublicUserData.requiredKeys, contains('has_image'));
      expect(OrganizationInvitationPublicUserData.requiredKeys, contains('identifier'));
    });
  });
}
