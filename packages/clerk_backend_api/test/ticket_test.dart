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
  group('Ticket', () {
    late Ticket instance;

    setUp(() {
      instance = Ticket(
        status: TicketStatusEnum.unverified,
        strategy: TicketStrategyEnum.ticket,
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.status, TicketStatusEnum.unverified);
      expect(instance.strategy, TicketStrategyEnum.ticket);
      expect(instance.attempts, 3);
      expect(instance.expireAt, 1700000000);
    });

    test('constructor creates instance with optional parameters', () {
      expect(instance.verifiedAtClient, 'client_123');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['status'], TicketStatusEnum.unverified);
      expect(json['strategy'], TicketStrategyEnum.ticket);
      expect(json['attempts'], 3);
      expect(json['expire_at'], 1700000000);
      expect(json['verified_at_client'], 'client_123');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'status': 'verified',
        'strategy': 'ticket',
        'attempts': 1,
        'expire_at': 1700000001,
        'verified_at_client': 'client_456',
      };
      final parsed = Ticket.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.status, TicketStatusEnum.verified);
      expect(parsed.strategy, TicketStrategyEnum.ticket);
      expect(parsed.attempts, 1);
      expect(parsed.verifiedAtClient, 'client_456');
    });

    test('fromJson returns null for non-map input', () {
      expect(Ticket.fromJson('not a map'), isNull);
      expect(Ticket.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'status': 'unverified', 'strategy': 'ticket', 'attempts': 1, 'expire_at': 1},
        {'status': 'verified', 'strategy': 'ticket', 'attempts': 2, 'expire_at': 2},
      ];
      final list = Ticket.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].status, TicketStatusEnum.unverified);
      expect(list[1].status, TicketStatusEnum.verified);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Ticket.listFromJson([]), isEmpty);
      expect(Ticket.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = Ticket(
        status: TicketStatusEnum.unverified,
        strategy: TicketStrategyEnum.ticket,
        attempts: 3,
        expireAt: 1700000000,
        verifiedAtClient: 'client_123',
      );
      final different = Ticket(
        status: TicketStatusEnum.verified,
        strategy: TicketStrategyEnum.ticket,
        attempts: 1,
        expireAt: 1700000000,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Ticket'));
      expect(str, contains('unverified'));
    });

    test('requiredKeys contains required fields', () {
      expect(Ticket.requiredKeys, contains('status'));
      expect(Ticket.requiredKeys, contains('strategy'));
      expect(Ticket.requiredKeys, contains('attempts'));
      expect(Ticket.requiredKeys, contains('expire_at'));
    });
  });

  group('TicketStatusEnum', () {
    test('values contains all enum values', () {
      expect(TicketStatusEnum.values, hasLength(3));
      expect(TicketStatusEnum.values, contains(TicketStatusEnum.unverified));
      expect(TicketStatusEnum.values, contains(TicketStatusEnum.verified));
      expect(TicketStatusEnum.values, contains(TicketStatusEnum.expired));
    });

    test('toJson returns correct string', () {
      expect(TicketStatusEnum.unverified.toJson(), 'unverified');
      expect(TicketStatusEnum.verified.toJson(), 'verified');
      expect(TicketStatusEnum.expired.toJson(), 'expired');
    });

    test('fromJson parses correct values', () {
      expect(TicketStatusEnum.fromJson('unverified'), TicketStatusEnum.unverified);
      expect(TicketStatusEnum.fromJson('verified'), TicketStatusEnum.verified);
      expect(TicketStatusEnum.fromJson('expired'), TicketStatusEnum.expired);
    });

    test('fromJson returns null for unknown value', () {
      expect(TicketStatusEnum.fromJson('unknown'), isNull);
    });
  });

  group('TicketStrategyEnum', () {
    test('values contains all enum values', () {
      expect(TicketStrategyEnum.values, hasLength(1));
      expect(TicketStrategyEnum.values, contains(TicketStrategyEnum.ticket));
    });

    test('toJson returns correct string', () {
      expect(TicketStrategyEnum.ticket.toJson(), 'ticket');
    });

    test('fromJson parses correct value', () {
      expect(TicketStrategyEnum.fromJson('ticket'), TicketStrategyEnum.ticket);
    });

    test('fromJson returns null for unknown value', () {
      expect(TicketStrategyEnum.fromJson('unknown'), isNull);
    });
  });
}
