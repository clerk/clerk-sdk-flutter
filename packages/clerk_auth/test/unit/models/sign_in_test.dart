import 'package:clerk_auth/src/models/client/factor.dart';
import 'package:clerk_auth/src/models/client/sign_in.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

void main() {
  group('SignIn', () {
    group('empty', () {
      test('has expected default values', () {
        expect(SignIn.empty.id, '~empty~');
        expect(SignIn.empty.status, Status.unknown);
        expect(SignIn.empty.supportedFirstFactors, isEmpty);
        expect(SignIn.empty.supportedSecondFactors, isEmpty);
        expect(SignIn.empty.supportedIdentifiers, isEmpty);
      });
    });

    group('urlType', () {
      test('returns sign_ins', () {
        expect(SignIn.empty.urlType, 'sign_ins');
      });
    });

    group('needsFirstFactor', () {
      test('returns true when status is needsFirstFactor', () {
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.needsFirstFactor);
        expect(signIn.needsSecondFactor, false);
      });
    });

    group('needsSecondFactor', () {
      test('returns true when status is needsSecondFactor', () {
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsSecondFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.needsSecondFactor);
        expect(signIn.needsFirstFactor, false);
      });
    });

    group('needsFactor', () {
      test('returns true when needs first or second factor', () {
        final signInFirst = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        final signInSecond = SignIn(
          id: 'sign_in_2',
          status: Status.needsSecondFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        final signInComplete = SignIn(
          id: 'sign_in_3',
          status: Status.complete,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );

        expect(signInFirst.needsFactor);
        expect(signInSecond.needsFactor);
        expect(signInComplete.needsFactor, false);
      });
    });

    group('verification', () {
      test('returns firstFactorVerification when needsFirstFactor', () {
        final verification = Verification(
          status: Status.unverified,
          strategy: Strategy.emailCode,
          attempts: 0,
          expireAt: DateTimeExt.epoch,
        );
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
          firstFactorVerification: verification,
        );
        expect(signIn.verification, verification);
      });

      test('returns secondFactorVerification when needsSecondFactor', () {
        final verification = Verification(
          status: Status.unverified,
          strategy: Strategy.totp,
          attempts: 0,
          expireAt: DateTimeExt.epoch,
        );
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsSecondFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
          secondFactorVerification: verification,
        );
        expect(signIn.verification, verification);
      });
    });

    group('hasVerification', () {
      test('returns true when verification exists', () {
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
          firstFactorVerification: Verification(
            status: Status.unverified,
            strategy: Strategy.emailCode,
            attempts: 0,
            expireAt: DateTimeExt.epoch,
          ),
        );
        expect(signIn.hasVerification);
      });

      test('returns false when no verification', () {
        expect(SignIn.empty.hasVerification, false);
      });
    });

    group('canUsePassword', () {
      test('returns true when password factor is available', () {
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [
            Factor(
              strategy: Strategy.password,
              safeIdentifier: null,
              emailAddressId: null,
              phoneNumberId: null,
              web3WalletId: null,
              passkeyId: null,
              isPrimary: false,
              isDefault: false,
            ),
            Factor(
              strategy: Strategy.emailCode,
              safeIdentifier: null,
              emailAddressId: null,
              phoneNumberId: null,
              web3WalletId: null,
              passkeyId: null,
              isPrimary: false,
              isDefault: false,
            ),
          ],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.canUsePassword);
      });

      test('returns false when no password factor', () {
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [
            Factor(
              strategy: Strategy.emailCode,
              safeIdentifier: null,
              emailAddressId: null,
              phoneNumberId: null,
              web3WalletId: null,
              passkeyId: null,
              isPrimary: false,
              isDefault: false,
            ),
          ],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.canUsePassword, false);
      });
    });
  });
}

