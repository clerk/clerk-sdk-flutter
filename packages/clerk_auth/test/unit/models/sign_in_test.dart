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
        const signIn = SignIn(
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
        const signIn = SignIn(
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
        const signInFirst = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        const signInSecond = SignIn(
          id: 'sign_in_2',
          status: Status.needsSecondFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        const signInComplete = SignIn(
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
        const verification = Verification(
          status: Status.unverified,
          strategy: Strategy.emailCode,
          attempts: 0,
          expireAt: DateTimeExt.epoch,
        );
        const signIn = SignIn(
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
        const verification = Verification(
          status: Status.unverified,
          strategy: Strategy.totp,
          attempts: 0,
          expireAt: DateTimeExt.epoch,
        );
        const signIn = SignIn(
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
        const signIn = SignIn(
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
        const signIn = SignIn(
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
        const signIn = SignIn(
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

    group('requiresPreparationFor', () {
      test('returns true when strategy requires preparation and no verification',
          () {
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.requiresPreparationFor(Strategy.emailCode));
      });

      test('returns false when strategy does not require preparation', () {
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.requiresPreparationFor(Strategy.password), false);
      });

      test('returns false when verification exists', () {
        const signIn = SignIn(
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
        expect(signIn.requiresPreparationFor(Strategy.emailCode), false);
      });
    });

    group('isTransferable', () {
      test('returns true when verification status is transferable', () {
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
          firstFactorVerification: Verification(
            status: Status.transferable,
            strategy: Strategy.emailCode,
            attempts: 0,
            expireAt: DateTimeExt.epoch,
          ),
        );
        expect(signIn.isTransferable);
      });

      test('returns false when verification status is not transferable', () {
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
          firstFactorVerification: Verification(
            status: Status.verified,
            strategy: Strategy.emailCode,
            attempts: 0,
            expireAt: DateTimeExt.epoch,
          ),
        );
        expect(signIn.isTransferable, false);
      });

      test('returns false when no verification', () {
        expect(SignIn.empty.isTransferable, false);
      });
    });

    group('verificationFor', () {
      test('returns firstFactorVerification for Stage.first', () {
        const firstVerification = Verification(
          status: Status.unverified,
          strategy: Strategy.emailCode,
          attempts: 0,
          expireAt: DateTimeExt.epoch,
        );
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
          firstFactorVerification: firstVerification,
        );
        expect(signIn.verificationFor(Stage.first), firstVerification);
      });

      test('returns secondFactorVerification for Stage.second', () {
        const secondVerification = Verification(
          status: Status.unverified,
          strategy: Strategy.totp,
          attempts: 0,
          expireAt: DateTimeExt.epoch,
        );
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsSecondFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
          secondFactorVerification: secondVerification,
        );
        expect(signIn.verificationFor(Stage.second), secondVerification);
      });
    });

    group('factorsFor', () {
      test('returns supportedFirstFactors for Stage.first', () {
        final factors = [
          const Factor(
            strategy: Strategy.password,
            safeIdentifier: null,
            emailAddressId: null,
            phoneNumberId: null,
            web3WalletId: null,
            passkeyId: null,
            isPrimary: false,
            isDefault: false,
          ),
        ];
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: factors,
          supportedSecondFactors: const [],
          supportedIdentifiers: const [],
        );
        expect(signIn.factorsFor(Stage.first), factors);
      });

      test('returns supportedSecondFactors for Stage.second', () {
        final factors = [
          const Factor(
            strategy: Strategy.totp,
            safeIdentifier: null,
            emailAddressId: null,
            phoneNumberId: null,
            web3WalletId: null,
            passkeyId: null,
            isPrimary: false,
            isDefault: false,
          ),
        ];
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsSecondFactor,
          supportedFirstFactors: const [],
          supportedSecondFactors: factors,
          supportedIdentifiers: const [],
        );
        expect(signIn.factorsFor(Stage.second), factors);
      });
    });

    group('needsFactorsFor', () {
      test('returns true for Stage.first when needsFirstFactor', () {
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.needsFactorsFor(Stage.first));
        expect(signIn.needsFactorsFor(Stage.second), false);
      });

      test('returns true for Stage.second when needsSecondFactor', () {
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsSecondFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.needsFactorsFor(Stage.second));
        expect(signIn.needsFactorsFor(Stage.first), false);
      });
    });

    group('factors', () {
      test('returns supportedFirstFactors when needsFirstFactor', () {
        final firstFactors = [
          const Factor(
            strategy: Strategy.password,
            safeIdentifier: null,
            emailAddressId: null,
            phoneNumberId: null,
            web3WalletId: null,
            passkeyId: null,
            isPrimary: false,
            isDefault: false,
          ),
        ];
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: firstFactors,
          supportedSecondFactors: const [],
          supportedIdentifiers: const [],
        );
        expect(signIn.factors, firstFactors);
      });

      test('returns supportedSecondFactors when needsSecondFactor', () {
        final secondFactors = [
          const Factor(
            strategy: Strategy.totp,
            safeIdentifier: null,
            emailAddressId: null,
            phoneNumberId: null,
            web3WalletId: null,
            passkeyId: null,
            isPrimary: false,
            isDefault: false,
          ),
        ];
        final signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsSecondFactor,
          supportedFirstFactors: const [],
          supportedSecondFactors: secondFactors,
          supportedIdentifiers: const [],
        );
        expect(signIn.factors, secondFactors);
      });

      test('returns empty list for other statuses', () {
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.complete,
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
          ],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.factors, isEmpty);
      });
    });

    group('factorFor', () {
      test('finds factor by strategy in current factors', () {
        const passwordFactor = Factor(
          strategy: Strategy.password,
          safeIdentifier: null,
          emailAddressId: null,
          phoneNumberId: null,
          web3WalletId: null,
          passkeyId: null,
          isPrimary: false,
          isDefault: false,
        );
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [passwordFactor],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.factorFor(Strategy.password), passwordFactor);
      });

      test('finds factor by strategy and stage', () {
        const totpFactor = Factor(
          strategy: Strategy.totp,
          safeIdentifier: null,
          emailAddressId: null,
          phoneNumberId: null,
          web3WalletId: null,
          passkeyId: null,
          isPrimary: false,
          isDefault: false,
        );
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [totpFactor],
          supportedIdentifiers: [],
        );
        expect(signIn.factorFor(Strategy.totp, stage: Stage.second), totpFactor);
      });

      test('returns null when factor not found', () {
        const signIn = SignIn(
          id: 'sign_in_1',
          status: Status.needsFirstFactor,
          supportedFirstFactors: [],
          supportedSecondFactors: [],
          supportedIdentifiers: [],
        );
        expect(signIn.factorFor(Strategy.password), isNull);
      });
    });

    group('fromJson/toJson', () {
      test('round-trips correctly', () {
        final signIn = SignIn(
          id: 'sign_in_123',
          status: Status.needsFirstFactor,
          supportedIdentifiers: const ['email_address', 'phone_number'],
          supportedFirstFactors: const [
            Factor(
              strategy: Strategy.password,
              safeIdentifier: 'test@example.com',
              emailAddressId: 'email_1',
              phoneNumberId: null,
              web3WalletId: null,
              passkeyId: null,
              isPrimary: true,
              isDefault: true,
            ),
          ],
          supportedSecondFactors: const [],
          identifier: 'test@example.com',
          abandonAt: DateTime.fromMillisecondsSinceEpoch(1700000000000),
        );

        final json = signIn.toJson();
        final restored = SignIn.fromJson(json);

        expect(restored.id, signIn.id);
        expect(restored.status, signIn.status);
        expect(restored.identifier, signIn.identifier);
        expect(restored.supportedIdentifiers, signIn.supportedIdentifiers);
        expect(restored.supportedFirstFactors.length,
            signIn.supportedFirstFactors.length);
      });
    });
  });
}

