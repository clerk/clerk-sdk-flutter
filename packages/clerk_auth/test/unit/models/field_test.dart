import 'package:clerk_auth/src/models/client/field.dart';
import 'package:clerk_auth/src/models/enums.dart';

import '../../test_helpers.dart';

void main() {
  group('Field', () {
    test('can be created from a name', () {
      final field = Field(name: 'phone_number');
      expect(field, Field.phoneNumber);
    });

    test('can be created from JSON', () {
      final field = Field.fromJson('email_address');
      expect(field, Field.emailAddress);
    });

    test('returns existing field for known names', () {
      expect(Field(name: 'phone_number'), Field.phoneNumber);
      expect(Field(name: 'email_address'), Field.emailAddress);
      expect(Field(name: 'username'), Field.username);
      expect(Field(name: 'password'), Field.password);
      expect(Field(name: 'legal_accepted'), Field.legalAccepted);
      expect(Field(name: 'saml'), Field.saml);
      expect(Field(name: 'enterprise_sso'), Field.enterpriseSSO);
      expect(Field(name: 'external_account'), Field.externalAccount);
    });

    test('creates new field for unknown names', () {
      final customField = Field(name: 'custom_field');
      expect(customField.name, 'custom_field');
      // Subsequent calls should return the same instance
      expect(Field(name: 'custom_field'), customField);
    });

    test('toJson returns the name', () {
      expect(Field.phoneNumber.toJson(), 'phone_number');
      expect(Field.emailAddress.toJson(), 'email_address');
    });

    test('toString returns the name', () {
      expect(Field.phoneNumber.toString(), 'phone_number');
      expect(Field.username.toString(), 'username');
    });

    test('title replaces underscores with spaces', () {
      expect(Field.phoneNumber.title, 'phone number');
      expect(Field.emailAddress.title, 'email address');
      expect(Field.legalAccepted.title, 'legal accepted');
    });

    test('values returns all known fields', () {
      final values = Field.values;
      expect(values.contains(Field.phoneNumber));
      expect(values.contains(Field.emailAddress));
      expect(values.contains(Field.username));
      expect(values.length >= 8); // At least the predefined ones
    });

    test('index returns correct position in values list', () {
      final values = Field.values;
      for (int i = 0; i < values.length; i++) {
        expect(values[i].index, i);
      }
    });

    group('forUserAttribute', () {
      test('returns phoneNumber for UserAttribute.phoneNumber', () {
        expect(Field.forUserAttribute(UserAttribute.phoneNumber),
            Field.phoneNumber);
      });

      test('returns emailAddress for UserAttribute.emailAddress', () {
        expect(Field.forUserAttribute(UserAttribute.emailAddress),
            Field.emailAddress);
      });

      test('returns password for UserAttribute.password', () {
        expect(Field.forUserAttribute(UserAttribute.password), Field.password);
      });

      test('returns firstName for UserAttribute.firstName', () {
        expect(
            Field.forUserAttribute(UserAttribute.firstName), Field.firstName);
      });

      test('returns lastName for UserAttribute.lastName', () {
        expect(Field.forUserAttribute(UserAttribute.lastName), Field.lastName);
      });

      test('returns username for UserAttribute.username', () {
        expect(Field.forUserAttribute(UserAttribute.username), Field.username);
      });

      test('returns null for unsupported attributes', () {
        expect(Field.forUserAttribute(UserAttribute.web3Wallet), isNull);
        expect(Field.forUserAttribute(UserAttribute.authenticatorApp), isNull);
        expect(Field.forUserAttribute(UserAttribute.backupCode), isNull);
        expect(Field.forUserAttribute(UserAttribute.passkey), isNull);
      });
    });
  });
}

