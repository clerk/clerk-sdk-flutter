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
  group('CommerceMoneyResponse', () {
    late CommerceMoneyResponse instance;

    setUp(() {
      instance = CommerceMoneyResponse(
        amount: 4999,
        amountFormatted: '\$49.99',
        currency: 'USD',
        currencySymbol: '\$',
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.amount, 4999);
      expect(instance.amountFormatted, '\$49.99');
      expect(instance.currency, 'USD');
      expect(instance.currencySymbol, '\$');
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['amount'], 4999);
      expect(json['amount_formatted'], '\$49.99');
      expect(json['currency'], 'USD');
      expect(json['currency_symbol'], '\$');
    });

    test('fromJson creates instance from map', () {
      final json = {
        'amount': 4999,
        'amount_formatted': '\$49.99',
        'currency': 'USD',
        'currency_symbol': '\$',
      };
      final result = CommerceMoneyResponse.fromJson(json);
      expect(result, isNotNull);
      expect(result!.amount, 4999);
      expect(result.amountFormatted, '\$49.99');
      expect(result.currency, 'USD');
      expect(result.currencySymbol, '\$');
    });

    test('fromJson returns null for non-map input', () {
      expect(CommerceMoneyResponse.fromJson('invalid'), isNull);
      expect(CommerceMoneyResponse.fromJson(123), isNull);
      expect(CommerceMoneyResponse.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(CommerceMoneyResponse.listFromJson([]), isEmpty);
      expect(CommerceMoneyResponse.listFromJson(null), isEmpty);
    });

    test('equality works correctly', () {
      final other = CommerceMoneyResponse(
        amount: 4999,
        amountFormatted: '\$49.99',
        currency: 'USD',
        currencySymbol: '\$',
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('CommerceMoneyResponse'));
      expect(str, contains('amount=4999'));
    });

    test('requiredKeys contains required fields', () {
      expect(CommerceMoneyResponse.requiredKeys, contains('amount'));
      expect(CommerceMoneyResponse.requiredKeys, contains('amount_formatted'));
      expect(CommerceMoneyResponse.requiredKeys, contains('currency'));
      expect(CommerceMoneyResponse.requiredKeys, contains('currency_symbol'));
    });
  });
}
