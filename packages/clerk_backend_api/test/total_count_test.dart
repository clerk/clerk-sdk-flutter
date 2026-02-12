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
  group('TotalCount', () {
    late TotalCount instance;

    setUp(() {
      instance = TotalCount(
        object: TotalCountObjectEnum.totalCount,
        totalCount: 42,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, TotalCountObjectEnum.totalCount);
      expect(instance.totalCount, 42);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], TotalCountObjectEnum.totalCount);
      expect(json['total_count'], 42);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'total_count',
        'total_count': 100,
      };
      final parsed = TotalCount.fromJson(json);
      expect(parsed, isNotNull);
      expect(parsed!.object, TotalCountObjectEnum.totalCount);
      expect(parsed.totalCount, 100);
    });

    test('fromJson returns null for non-map input', () {
      expect(TotalCount.fromJson('not a map'), isNull);
      expect(TotalCount.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonArray = [
        {'object': 'total_count', 'total_count': 10},
        {'object': 'total_count', 'total_count': 20},
      ];
      final list = TotalCount.listFromJson(jsonArray);
      expect(list.length, 2);
      expect(list[0].totalCount, 10);
      expect(list[1].totalCount, 20);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(TotalCount.listFromJson([]), isEmpty);
      expect(TotalCount.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final same = TotalCount(
        object: TotalCountObjectEnum.totalCount,
        totalCount: 42,
      );
      final different = TotalCount(
        object: TotalCountObjectEnum.totalCount,
        totalCount: 99,
      );
      expect(instance, equals(same));
      expect(instance, isNot(equals(different)));
    });

    test('hashCode is consistent', () {
      final same = TotalCount(
        object: TotalCountObjectEnum.totalCount,
        totalCount: 42,
      );
      expect(instance.hashCode, equals(same.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('TotalCount'));
      expect(str, contains('42'));
    });

    test('requiredKeys contains required fields', () {
      expect(TotalCount.requiredKeys, contains('object'));
      expect(TotalCount.requiredKeys, contains('total_count'));
    });
  });

  group('TotalCountObjectEnum', () {
    test('values contains all enum values', () {
      expect(TotalCountObjectEnum.values, contains(TotalCountObjectEnum.totalCount));
    });

    test('toJson returns correct string', () {
      expect(TotalCountObjectEnum.totalCount.toJson(), 'total_count');
    });

    test('fromJson parses correct value', () {
      expect(TotalCountObjectEnum.fromJson('total_count'), TotalCountObjectEnum.totalCount);
    });

    test('fromJson returns null for unknown value', () {
      expect(TotalCountObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
