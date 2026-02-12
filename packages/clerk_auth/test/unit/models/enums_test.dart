import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_auth/src/models/status.dart';

import '../../test_helpers.dart';

void main() {
  group('EnrollmentMode', () {
    test('automaticSuggestion toString returns correct value', () {
      expect(EnrollmentMode.automaticSuggestion.toString(), 'automatic_suggestion');
    });

    test('automaticInvitation toString returns correct value', () {
      expect(EnrollmentMode.automaticInvitation.toString(), 'automatic_invitation');
    });

    test('manualInvitation toString returns correct value', () {
      expect(EnrollmentMode.manualInvitation.toString(), 'manual_invitation');
    });

    test('values contains all enrollment modes', () {
      expect(EnrollmentMode.values.length, 3);
      expect(EnrollmentMode.values.contains(EnrollmentMode.automaticSuggestion));
      expect(EnrollmentMode.values.contains(EnrollmentMode.automaticInvitation));
      expect(EnrollmentMode.values.contains(EnrollmentMode.manualInvitation));
    });
  });

  group('UserAttribute', () {
    test('username toString returns correct value', () {
      expect(UserAttribute.username.toString(), 'username');
    });

    test('emailAddress toString returns correct value', () {
      expect(UserAttribute.emailAddress.toString(), 'email_address');
    });

    test('phoneNumber toString returns correct value', () {
      expect(UserAttribute.phoneNumber.toString(), 'phone_number');
    });

    test('firstName toString returns correct value', () {
      expect(UserAttribute.firstName.toString(), 'first_name');
    });

    test('lastName toString returns correct value', () {
      expect(UserAttribute.lastName.toString(), 'last_name');
    });

    test('password toString returns correct value', () {
      expect(UserAttribute.password.toString(), 'password');
    });

    test('passwordConfirmation toString returns correct value', () {
      expect(UserAttribute.passwordConfirmation.toString(), 'password_confirmation');
    });

    test('web3Wallet toString returns correct value', () {
      expect(UserAttribute.web3Wallet.toString(), 'web3_wallet');
    });

    test('authenticatorApp toString returns correct value', () {
      expect(UserAttribute.authenticatorApp.toString(), 'authenticator_app');
    });

    test('backupCode toString returns correct value', () {
      expect(UserAttribute.backupCode.toString(), 'backup_code');
    });

    test('passkey toString returns correct value', () {
      expect(UserAttribute.passkey.toString(), 'passkey');
    });

    test('values contains all user attributes', () {
      expect(UserAttribute.values.length, 11);
    });
  });

  group('Stage', () {
    test('first toString returns correct value', () {
      expect(Stage.first.toString(), 'first');
    });

    test('second toString returns correct value', () {
      expect(Stage.second.toString(), 'second');
    });

    test('forStatus returns first for needsFirstFactor', () {
      expect(Stage.forStatus(Status.needsFirstFactor), Stage.first);
    });

    test('forStatus returns second for needsSecondFactor', () {
      expect(Stage.forStatus(Status.needsSecondFactor), Stage.second);
    });

    test('forStatus throws ClerkError for invalid status', () {
      expect(
        () => Stage.forStatus(Status.complete),
        throwsA(isA<ClerkError>()),
      );
    });
  });

  group('InstanceType', () {
    test('unknown toString returns correct value', () {
      expect(InstanceType.unknown.toString(), 'unknown');
    });

    test('development toString returns correct value', () {
      expect(InstanceType.development.toString(), 'development');
    });

    test('production toString returns correct value', () {
      expect(InstanceType.production.toString(), 'production');
    });

    test('isDevelopment returns true for development', () {
      expect(InstanceType.development.isDevelopment);
    });

    test('isDevelopment returns false for production', () {
      expect(InstanceType.production.isDevelopment, false);
    });

    test('isDevelopment returns false for unknown', () {
      expect(InstanceType.unknown.isDevelopment, false);
    });
  });

  group('IdentifierType', () {
    test('phoneNumber has correct name', () {
      expect(IdentifierType.phoneNumber.name, 'phone_number');
    });

    test('emailAddress has correct name', () {
      expect(IdentifierType.emailAddress.name, 'email_address');
    });

    test('web3wallet has correct name', () {
      expect(IdentifierType.web3wallet.name, 'web3_wallet');
    });

    test('phoneNumber urlSegment returns correct value', () {
      expect(IdentifierType.phoneNumber.urlSegment, 'phone_numbers');
    });

    test('emailAddress urlSegment returns correct value', () {
      expect(IdentifierType.emailAddress.urlSegment, 'email_addresses');
    });

    test('web3wallet urlSegment returns correct value', () {
      expect(IdentifierType.web3wallet.urlSegment, 'web3_wallets');
    });

    test('isPhoneNumber returns true for phoneNumber', () {
      expect(IdentifierType.phoneNumber.isPhoneNumber);
    });

    test('isPhoneNumber returns false for emailAddress', () {
      expect(IdentifierType.emailAddress.isPhoneNumber, false);
    });

    test('isEmailAddress returns true for emailAddress', () {
      expect(IdentifierType.emailAddress.isEmailAddress);
    });

    test('isEmailAddress returns false for phoneNumber', () {
      expect(IdentifierType.phoneNumber.isEmailAddress, false);
    });

    test('sanitize phoneNumber removes non-digits and adds plus', () {
      expect(IdentifierType.phoneNumber.sanitize('(123) 456-7890'), '+1234567890');
    });

    test('sanitize phoneNumber handles already formatted number', () {
      expect(IdentifierType.phoneNumber.sanitize('+1234567890'), '+1234567890');
    });

    test('sanitize emailAddress trims whitespace', () {
      expect(IdentifierType.emailAddress.sanitize('  test@example.com  '), 'test@example.com');
    });

    test('sanitize web3wallet trims whitespace', () {
      expect(IdentifierType.web3wallet.sanitize('  0x123abc  '), '0x123abc');
    });

    test('phoneNumber has phoneCode verification strategy', () {
      expect(IdentifierType.phoneNumber.verificationStrategy, Strategy.phoneCode);
    });

    test('emailAddress has emailCode verification strategy', () {
      expect(IdentifierType.emailAddress.verificationStrategy, Strategy.emailCode);
    });
  });

  group('IdTokenProvider', () {
    test('apple has correct strategy', () {
      expect(IdTokenProvider.apple.strategy, Strategy.oauthTokenApple);
    });

    test('google has correct strategy', () {
      expect(IdTokenProvider.google.strategy, Strategy.oauthTokenGoogle);
    });

    test('values contains all providers', () {
      expect(IdTokenProvider.values.length, 2);
      expect(IdTokenProvider.values.contains(IdTokenProvider.apple));
      expect(IdTokenProvider.values.contains(IdTokenProvider.google));
    });
  });
}

