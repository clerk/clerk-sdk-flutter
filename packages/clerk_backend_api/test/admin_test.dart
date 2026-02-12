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
  group('Admin', () {
    test('constructor creates instance with required parameters', () {
      final instance = Admin(
        status: AdminStatusEnum.verified,
        strategy: AdminStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
      );
      expect(instance.status, AdminStatusEnum.verified);
      expect(instance.strategy, AdminStrategyEnum.admin);
      expect(instance.attempts, 3);
      expect(instance.expireAt, 1700000000);
      expect(instance.verifiedAtClient, isNull);
    });

    test('constructor creates instance with optional parameters', () {
      final instance = Admin(
        status: AdminStatusEnum.verified,
        strategy: AdminStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
      expect(instance.verifiedAtClient, 'client_123');
    });

    test('toJson produces correct map', () {
      final instance = Admin(
        status: AdminStatusEnum.verified,
        strategy: AdminStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
      final json = instance.toJson();
      expect(json['status'], AdminStatusEnum.verified);
      expect(json['strategy'], AdminStrategyEnum.admin);
      expect(json['attempts'], 3);
      expect(json['expire_at'], 1700000000);
      expect(json['verified_at_client'], 'client_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'status': 'verified',
        'strategy': 'admin',
        'attempts': 3,
        'expire_at': 1700000000,
        'verified_at_client': 'client_123',
      };
      final instance = Admin.fromJson(json);
      expect(instance, isNotNull);
      expect(instance!.status, AdminStatusEnum.verified);
      expect(instance.strategy, AdminStrategyEnum.admin);
      expect(instance.attempts, 3);
      expect(instance.expireAt, 1700000000);
      expect(instance.verifiedAtClient, 'client_123');
    });

    test('fromJson returns null for non-map input', () {
      expect(Admin.fromJson(null), isNull);
      expect(Admin.fromJson('string'), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {'status': 'verified', 'strategy': 'admin', 'attempts': 1, 'expire_at': 1700000000},
        {'status': 'verified', 'strategy': 'admin', 'attempts': 2, 'expire_at': 1700000001},
      ];
      final list = Admin.listFromJson(jsonList);
      expect(list.length, 2);
      expect(list[0].attempts, 1);
      expect(list[1].attempts, 2);
    });

    test('equality operator works correctly', () {
      final instance1 = Admin(
        status: AdminStatusEnum.verified,
        strategy: AdminStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
      );
      final instance2 = Admin(
        status: AdminStatusEnum.verified,
        strategy: AdminStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
      );
      final instance3 = Admin(
        status: AdminStatusEnum.verified,
        strategy: AdminStrategyEnum.admin,
        attempts: 5,
        expireAt: 1700000000,
      );
      expect(instance1, equals(instance2));
      expect(instance1, isNot(equals(instance3)));
    });

    test('hashCode is consistent', () {
      final instance1 = Admin(
        status: AdminStatusEnum.verified,
        strategy: AdminStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
      );
      final instance2 = Admin(
        status: AdminStatusEnum.verified,
        strategy: AdminStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
      );
      expect(instance1.hashCode, equals(instance2.hashCode));
    });

    test('toString returns expected format', () {
      final instance = Admin(
        status: AdminStatusEnum.verified,
        strategy: AdminStrategyEnum.admin,
        attempts: 3,
        expireAt: 1700000000,
      );
      final str = instance.toString();
      expect(str, contains('Admin['));
      expect(str, contains('status='));
    });
  });

  group('AdminStatusEnum', () {
    test('values contains all enum values', () {
      expect(AdminStatusEnum.values, contains(AdminStatusEnum.verified));
    });

    test('fromJson parses valid value', () {
      expect(AdminStatusEnum.fromJson('verified'), AdminStatusEnum.verified);
    });

    test('fromJson returns null for invalid value', () {
      expect(AdminStatusEnum.fromJson('invalid'), isNull);
    });

    test('toJson returns correct string', () {
      expect(AdminStatusEnum.verified.toJson(), 'verified');
    });
  });

  group('AdminStrategyEnum', () {
    test('values contains all enum values', () {
      expect(AdminStrategyEnum.values, contains(AdminStrategyEnum.admin));
    });

    test('fromJson parses valid value', () {
      expect(AdminStrategyEnum.fromJson('admin'), AdminStrategyEnum.admin);
    });

    test('fromJson returns null for invalid value', () {
      expect(AdminStrategyEnum.fromJson('invalid'), isNull);
    });

    test('toJson returns correct string', () {
      expect(AdminStrategyEnum.admin.toJson(), 'admin');
    });
  });
}
