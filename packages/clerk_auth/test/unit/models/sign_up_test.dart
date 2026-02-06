import 'package:clerk_auth/src/models/client/field.dart';
import 'package:clerk_auth/src/models/client/sign_up.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

SignUp _createTestSignUp({
  String id = 'sign_up_1',
  Status status = Status.missingRequirements,
  List<Field> requiredFields = const [],
  List<Field> optionalFields = const [],
  List<Field> missingFields = const [],
  List<Field> unverifiedFields = const [],
  Map<Field, Verification> verifications = const {},
}) {
  return SignUp(
    id: id,
    status: status,
    requiredFields: requiredFields,
    optionalFields: optionalFields,
    missingFields: missingFields,
    unverifiedFields: unverifiedFields,
    username: null,
    emailAddress: null,
    phoneNumber: null,
    web3Wallet: null,
    passwordEnabled: false,
    firstName: null,
    lastName: null,
    unsafeMetadata: const {},
    publicMetadata: const {},
    verifications: verifications,
    customAction: false,
    externalId: null,
    createdSessionId: null,
    createdUserId: null,
    abandonAt: DateTimeExt.epoch,
  );
}

void main() {
  group('SignUp', () {
    group('urlType', () {
      test('returns sign_ups', () {
        final signUp = _createTestSignUp();
        expect(signUp.urlType, 'sign_ups');
      });
    });

    group('requires', () {
      test('returns true when field is in requiredFields', () {
        final signUp = _createTestSignUp(
          requiredFields: [Field.emailAddress, Field.password],
        );
        expect(signUp.requires(Field.emailAddress));
        expect(signUp.requires(Field.password));
      });

      test('returns false when field is not in requiredFields', () {
        final signUp = _createTestSignUp(
          requiredFields: [Field.emailAddress],
        );
        expect(signUp.requires(Field.phoneNumber), false);
      });
    });

    group('optional', () {
      test('returns true when field is in optionalFields', () {
        final signUp = _createTestSignUp(
          optionalFields: [Field.firstName, Field.lastName],
        );
        expect(signUp.optional(Field.firstName));
        expect(signUp.optional(Field.lastName));
      });

      test('returns false when field is not in optionalFields', () {
        final signUp = _createTestSignUp(
          optionalFields: [Field.firstName],
        );
        expect(signUp.optional(Field.emailAddress), false);
      });
    });

    group('missing', () {
      test('returns true when field is in missingFields', () {
        final signUp = _createTestSignUp(
          missingFields: [Field.emailAddress],
        );
        expect(signUp.missing(Field.emailAddress));
      });

      test('returns false when field is not in missingFields', () {
        final signUp = _createTestSignUp(
          missingFields: [],
        );
        expect(signUp.missing(Field.emailAddress), false);
      });
    });

    group('unverified', () {
      test('returns true when field is in unverifiedFields', () {
        final signUp = _createTestSignUp(
          unverifiedFields: [Field.emailAddress],
        );
        expect(signUp.unverified(Field.emailAddress));
      });

      test('returns false when field is not in unverifiedFields', () {
        final signUp = _createTestSignUp(
          unverifiedFields: [],
        );
        expect(signUp.unverified(Field.emailAddress), false);
      });
    });

    group('requiresEnterpriseSSOSignUp', () {
      test('returns true when status is missingRequirements and saml missing',
          () {
        final signUp = _createTestSignUp(
          status: Status.missingRequirements,
          missingFields: [Field.saml],
        );
        expect(signUp.requiresEnterpriseSSOSignUp);
      });

      test(
          'returns true when status is missingRequirements and enterpriseSSO missing',
          () {
        final signUp = _createTestSignUp(
          status: Status.missingRequirements,
          missingFields: [Field.enterpriseSSO],
        );
        expect(signUp.requiresEnterpriseSSOSignUp);
      });

      test('returns false when status is not missingRequirements', () {
        final signUp = _createTestSignUp(
          status: Status.complete,
          missingFields: [Field.saml],
        );
        expect(signUp.requiresEnterpriseSSOSignUp, false);
      });
    });

    group('isVerifying', () {
      test('returns true when verification for strategy is in progress', () {
        final signUp = _createTestSignUp(
          verifications: {
            Field.emailAddress: Verification(
              status: Status.unverified,
              strategy: Strategy.emailCode,
              attempts: 0,
              expireAt: DateTimeExt.epoch,
            ),
          },
        );
        expect(signUp.isVerifying(Strategy.emailCode));
      });

      test('returns false when no verification for strategy', () {
        final signUp = _createTestSignUp();
        expect(signUp.isVerifying(Strategy.emailCode), false);
      });
    });
  });
}

