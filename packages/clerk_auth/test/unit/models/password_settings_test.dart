import 'package:clerk_auth/src/models/environment/password_settings.dart';

import '../../test_helpers.dart';

void main() {
  group('PasswordSettings', () {
    group('empty', () {
      test('has default values', () {
        expect(PasswordSettings.empty.allowedSpecialCharacters, '');
        expect(PasswordSettings.empty.minZxcvbnStrength, 0);
        expect(PasswordSettings.empty.minLength, 0);
        expect(PasswordSettings.empty.maxLength, 0);
        expect(PasswordSettings.empty.disableHibp, false);
        expect(PasswordSettings.empty.requireSpecialChar, false);
        expect(PasswordSettings.empty.requireNumbers, false);
        expect(PasswordSettings.empty.requireUppercase, false);
        expect(PasswordSettings.empty.requireLowercase, false);
        expect(PasswordSettings.empty.showZxcvbn, false);
        expect(PasswordSettings.empty.enforceHibpOnSignIn, false);
      });
    });

    group('meetsLengthCriteria', () {
      test('returns true when password meets min length', () {
        const settings = PasswordSettings(minLength: 8);
        expect(settings.meetsLengthCriteria('password'));
      });

      test('returns false when password is too short', () {
        const settings = PasswordSettings(minLength: 8);
        expect(settings.meetsLengthCriteria('pass'), false);
      });

      test('returns true when password meets max length', () {
        const settings = PasswordSettings(minLength: 4, maxLength: 10);
        expect(settings.meetsLengthCriteria('password'));
      });

      test('returns false when password exceeds max length', () {
        const settings = PasswordSettings(minLength: 4, maxLength: 10);
        expect(settings.meetsLengthCriteria('verylongpassword'), false);
      });

      test('ignores max length when set to 0', () {
        const settings = PasswordSettings(minLength: 4, maxLength: 0);
        expect(settings.meetsLengthCriteria('verylongpasswordthatexceedsanylimit'));
      });
    });

    group('meetsLowerCaseCriteria', () {
      test('returns true when lowercase not required', () {
        const settings = PasswordSettings(requireLowercase: false);
        expect(settings.meetsLowerCaseCriteria('UPPERCASE'));
      });

      test('returns true when password has lowercase', () {
        const settings = PasswordSettings(requireLowercase: true);
        expect(settings.meetsLowerCaseCriteria('Password'));
      });

      test('returns false when password has no lowercase', () {
        const settings = PasswordSettings(requireLowercase: true);
        expect(settings.meetsLowerCaseCriteria('PASSWORD123'), false);
      });
    });

    group('meetsUpperCaseCriteria', () {
      test('returns true when uppercase not required', () {
        const settings = PasswordSettings(requireUppercase: false);
        expect(settings.meetsUpperCaseCriteria('lowercase'));
      });

      test('returns true when password has uppercase', () {
        const settings = PasswordSettings(requireUppercase: true);
        expect(settings.meetsUpperCaseCriteria('Password'));
      });

      test('returns false when password has no uppercase', () {
        const settings = PasswordSettings(requireUppercase: true);
        expect(settings.meetsUpperCaseCriteria('password123'), false);
      });
    });

    group('meetsNumberCriteria', () {
      test('returns true when numbers not required', () {
        const settings = PasswordSettings(requireNumbers: false);
        expect(settings.meetsNumberCriteria('password'));
      });

      test('returns true when password has numbers', () {
        const settings = PasswordSettings(requireNumbers: true);
        expect(settings.meetsNumberCriteria('password123'));
      });

      test('returns false when password has no numbers', () {
        const settings = PasswordSettings(requireNumbers: true);
        expect(settings.meetsNumberCriteria('password'), false);
      });
    });

    group('meetsSpecialCharCriteria', () {
      test('returns true when special chars not required', () {
        const settings = PasswordSettings(requireSpecialChar: false);
        expect(settings.meetsSpecialCharCriteria('password'));
      });

      test('returns true when password has allowed special char', () {
        const settings = PasswordSettings(
          requireSpecialChar: true,
          allowedSpecialCharacters: '!@#\$%',
        );
        expect(settings.meetsSpecialCharCriteria('password!'));
      });

      test('returns false when password has no special chars', () {
        const settings = PasswordSettings(
          requireSpecialChar: true,
          allowedSpecialCharacters: '!@#\$%',
        );
        expect(settings.meetsSpecialCharCriteria('password'), false);
      });
    });

    group('meetsRequiredCriteria', () {
      test('returns true when all criteria met', () {
        const settings = PasswordSettings(
          minLength: 8,
          requireLowercase: true,
          requireUppercase: true,
          requireNumbers: true,
          requireSpecialChar: true,
          allowedSpecialCharacters: '!@#\$%',
        );
        expect(settings.meetsRequiredCriteria('Password1!'));
      });

      test('returns false when any criteria not met', () {
        const settings = PasswordSettings(
          minLength: 8,
          requireLowercase: true,
          requireUppercase: true,
          requireNumbers: true,
        );
        expect(settings.meetsRequiredCriteria('password'), false);
      });
    });

    group('fromJson and toJson', () {
      test('round-trip serialization works', () {
        const settings = PasswordSettings(
          minLength: 8,
          maxLength: 20,
          requireLowercase: true,
          requireUppercase: true,
        );
        final json = settings.toJson();
        final restored = PasswordSettings.fromJson(json);
        expect(restored.minLength, 8);
        expect(restored.maxLength, 20);
        expect(restored.requireLowercase);
        expect(restored.requireUppercase);
      });
    });
  });
}

