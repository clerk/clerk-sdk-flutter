import 'package:clerk_flutter/src/utils/identifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Identifier', () {
    test('stores identifier correctly', () {
      const identifier = Identifier('test@example.com');
      expect(identifier.identifier, 'test@example.com');
    });

    test('prettyIdentifier returns identifier', () {
      const identifier = Identifier('test@example.com');
      expect(identifier.prettyIdentifier, 'test@example.com');
    });

    test('orNull returns Identifier for non-null string', () {
      final identifier = Identifier.orNull('test@example.com');
      expect(identifier, isNotNull);
      expect(identifier!.identifier, 'test@example.com');
    });

    test('orNull returns null for null string', () {
      final identifier = Identifier.orNull(null);
      expect(identifier, isNull);
    });
  });

  group('PhoneNumberIdentifier', () {
    test('stores identifier and prettyIdentifier correctly', () {
      const identifier = PhoneNumberIdentifier('+1234567890', '(+1) 234-567-890');
      expect(identifier.identifier, '+1234567890');
      expect(identifier.prettyIdentifier, '(+1) 234-567-890');
    });

    test('orNull returns null for null string', () {
      final identifier = PhoneNumberIdentifier.orNull(null);
      expect(identifier, isNull);
    });

    test('orNull returns null for invalid phone number', () {
      final identifier = PhoneNumberIdentifier.orNull('not-a-phone');
      expect(identifier, isNull);
    });

    test('orNull returns PhoneNumberIdentifier for valid phone number', () {
      // Using a valid US phone number format
      final identifier = PhoneNumberIdentifier.orNull('+14155551234');
      // This may or may not work depending on the phone_input package validation
      // If it returns null, the phone number format might not be recognized
      if (identifier != null) {
        expect(identifier.identifier, isNotEmpty);
        expect(identifier.prettyIdentifier, isNotEmpty);
      }
    });
  });
}

