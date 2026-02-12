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
  group('WaitlistEntry', () {
    late WaitlistEntry instance;

    setUp(() {
      instance = WaitlistEntry(
        object: WaitlistEntryObjectEnum.waitlistEntry,
        id: 'wle_123',
        emailAddress: 'test@example.com',
        status: WaitlistEntryStatusEnum.pending,
        isLocked: false,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, WaitlistEntryObjectEnum.waitlistEntry);
      expect(instance.id, 'wle_123');
      expect(instance.emailAddress, 'test@example.com');
      expect(instance.status, WaitlistEntryStatusEnum.pending);
      expect(instance.createdAt, 1700000000);
      expect(instance.updatedAt, 1700000001);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.isLocked, false);
      expect(instance.invitation, isNull);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], WaitlistEntryObjectEnum.waitlistEntry);
      expect(json['id'], 'wle_123');
      expect(json['email_address'], 'test@example.com');
      expect(json['status'], WaitlistEntryStatusEnum.pending);
      expect(json['is_locked'], false);
      expect(json['created_at'], 1700000000);
      expect(json['updated_at'], 1700000001);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'waitlist_entry',
        'id': 'wle_456',
        'email_address': 'other@example.com',
        'status': 'invited',
        'is_locked': true,
        'created_at': 1700000002,
        'updated_at': 1700000003,
      };
      final parsed = WaitlistEntry.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, WaitlistEntryObjectEnum.waitlistEntry);
      expect(parsed.id, 'wle_456');
      expect(parsed.emailAddress, 'other@example.com');
      expect(parsed.status, WaitlistEntryStatusEnum.invited);
      expect(parsed.isLocked, true);
    });

    test('fromJson returns null for non-map input', () {
      expect(WaitlistEntry.fromJson('not a map'), isNull);
      expect(WaitlistEntry.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'waitlist_entry', 'id': 'w1', 'email_address': 'a@a.com', 'status': 'pending', 'created_at': 1, 'updated_at': 2},
        {'object': 'waitlist_entry', 'id': 'w2', 'email_address': 'b@b.com', 'status': 'completed', 'created_at': 3, 'updated_at': 4},
      ];
      final list = WaitlistEntry.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].id, 'w1');
      expect(list[1].id, 'w2');
    });

    test('listFromJson returns empty list for empty input', () {
      expect(WaitlistEntry.listFromJson([]), isEmpty);
      expect(WaitlistEntry.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = WaitlistEntry(
        object: WaitlistEntryObjectEnum.waitlistEntry,
        id: 'wle_123',
        emailAddress: 'test@example.com',
        status: WaitlistEntryStatusEnum.pending,
        isLocked: false,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      final different = WaitlistEntry(
        object: WaitlistEntryObjectEnum.waitlistEntry,
        id: 'wle_different',
        emailAddress: 'different@example.com',
        status: WaitlistEntryStatusEnum.rejected,
        createdAt: 1700000000,
        updatedAt: 1700000001,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('WaitlistEntry'));
      expect(str, contains('wle_123'));
      expect(str, contains('test@example.com'));
    });

    test('requiredKeys contains required fields', () {
      expect(WaitlistEntry.requiredKeys, contains('object'));
      expect(WaitlistEntry.requiredKeys, contains('id'));
      expect(WaitlistEntry.requiredKeys, contains('email_address'));
      expect(WaitlistEntry.requiredKeys, contains('status'));
      expect(WaitlistEntry.requiredKeys, contains('created_at'));
      expect(WaitlistEntry.requiredKeys, contains('updated_at'));
    });
  });

  group('WaitlistEntryObjectEnum', () {
    test('values contains all enum values', () {
      expect(WaitlistEntryObjectEnum.values, contains(WaitlistEntryObjectEnum.waitlistEntry));
    });

    test('toJson returns correct string', () {
      expect(WaitlistEntryObjectEnum.waitlistEntry.toJson(), 'waitlist_entry');
    });

    test('fromJson parses correct value', () {
      expect(WaitlistEntryObjectEnum.fromJson('waitlist_entry'), WaitlistEntryObjectEnum.waitlistEntry);
    });

    test('fromJson returns null for unknown value', () {
      expect(WaitlistEntryObjectEnum.fromJson('unknown'), isNull);
    });
  });

  group('WaitlistEntryStatusEnum', () {
    test('values contains all enum values', () {
      expect(WaitlistEntryStatusEnum.values, hasLength(4));
      expect(WaitlistEntryStatusEnum.values, contains(WaitlistEntryStatusEnum.pending));
      expect(WaitlistEntryStatusEnum.values, contains(WaitlistEntryStatusEnum.invited));
      expect(WaitlistEntryStatusEnum.values, contains(WaitlistEntryStatusEnum.rejected));
      expect(WaitlistEntryStatusEnum.values, contains(WaitlistEntryStatusEnum.completed));
    });

    test('toJson returns correct string', () {
      expect(WaitlistEntryStatusEnum.pending.toJson(), 'pending');
      expect(WaitlistEntryStatusEnum.invited.toJson(), 'invited');
      expect(WaitlistEntryStatusEnum.rejected.toJson(), 'rejected');
      expect(WaitlistEntryStatusEnum.completed.toJson(), 'completed');
    });

    test('fromJson parses correct values', () {
      expect(WaitlistEntryStatusEnum.fromJson('pending'), WaitlistEntryStatusEnum.pending);
      expect(WaitlistEntryStatusEnum.fromJson('invited'), WaitlistEntryStatusEnum.invited);
      expect(WaitlistEntryStatusEnum.fromJson('rejected'), WaitlistEntryStatusEnum.rejected);
      expect(WaitlistEntryStatusEnum.fromJson('completed'), WaitlistEntryStatusEnum.completed);
    });

    test('fromJson returns null for unknown value', () {
      expect(WaitlistEntryStatusEnum.fromJson('unknown'), isNull);
    });
  });
}
