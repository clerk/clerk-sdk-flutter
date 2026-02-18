import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/generated/clerk_sdk_localizations.dart';
import 'package:clerk_flutter/generated/clerk_sdk_localizations_en.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ClerkSdkLocalizations l10ns;

  setUp(() {
    l10ns = ClerkSdkLocalizationsEn();
  });

  group('ClerkAuthErrorExtension', () {
    test('localizedMessage returns cannotDeleteSelf for cannotDeleteSelf code', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.cannotDeleteSelf,
        message: 'test',
      );
      expect(error.localizedMessage(l10ns), l10ns.cannotDeleteSelf);
    });

    test('localizedMessage returns jwtPoorlyFormatted with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.jwtPoorlyFormatted,
        message: 'test',
        argument: 'bad_token',
      );
      expect(error.localizedMessage(l10ns), l10ns.jwtPoorlyFormatted('bad_token'));
    });

    test('localizedMessage returns noSessionTokenRetrieved', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.noSessionTokenRetrieved,
        message: 'test',
      );
      expect(error.localizedMessage(l10ns), l10ns.noSessionTokenRetrieved);
    });

    test('localizedMessage returns passwordMatchError', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.passwordMatchError,
        message: 'test',
      );
      expect(error.localizedMessage(l10ns), l10ns.passwordMatchError);
    });

    test('localizedMessage returns tooManyRetries', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.tooManyRetries,
        message: 'test',
      );
      expect(error.localizedMessage(l10ns), l10ns.tooManyRetries);
    });

    test('localizedMessage returns toString for clientAppError', () {
      final error = clerk.ClerkError.clientAppError(message: 'Custom error');
      final result = error.localizedMessage(l10ns);
      expect(result, contains('Custom error'));
    });

    test('localizedMessage returns noAssociatedCodeRetrievalMethod with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.noAssociatedCodeRetrievalMethod,
        message: 'test',
        argument: 'email',
      );
      expect(error.localizedMessage(l10ns), l10ns.noAssociatedCodeRetrievalMethod('email'));
    });

    test('localizedMessage returns noAssociatedStrategy with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.noAssociatedStrategy,
        message: 'test',
        argument: 'password',
      );
      expect(error.localizedMessage(l10ns), l10ns.noAssociatedStrategy('password'));
    });

    test('localizedMessage returns noSessionFoundForUser with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.noSessionFoundForUser,
        message: 'test',
        argument: 'user_123',
      );
      expect(error.localizedMessage(l10ns), l10ns.noSessionFoundForUser('user_123'));
    });

    test('localizedMessage returns noStageForStatus with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.noStageForStatus,
        message: 'test',
        argument: 'complete',
      );
      expect(error.localizedMessage(l10ns), l10ns.noStageForStatus('complete'));
    });

    test('localizedMessage returns noSuchFirstFactorStrategy with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.noSuchFirstFactorStrategy,
        message: 'test',
        argument: 'email_code',
      );
      expect(error.localizedMessage(l10ns), l10ns.noSuchFirstFactorStrategy('email_code'));
    });

    test('localizedMessage returns noSuchSecondFactorStrategy with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.noSuchSecondFactorStrategy,
        message: 'test',
        argument: 'totp',
      );
      expect(error.localizedMessage(l10ns), l10ns.noSuchSecondFactorStrategy('totp'));
    });

    test('localizedMessage returns noUserAttributeForField with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.noUserAttributeForField,
        message: 'test',
        argument: 'email_address',
      );
      expect(error.localizedMessage(l10ns), l10ns.noUserAttributeForField('email_address'));
    });

    test('localizedMessage returns passwordResetStrategyError with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.passwordResetStrategyError,
        message: 'test',
        argument: 'invalid_strategy',
      );
      expect(error.localizedMessage(l10ns), l10ns.unsupportedPasswordResetStrategy('invalid_strategy'));
    });

    test('localizedMessage returns serverErrorResponse with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.serverErrorResponse,
        message: 'test',
        argument: '500 Internal Server Error',
      );
      expect(error.localizedMessage(l10ns), l10ns.serverErrorResponse('500 Internal Server Error'));
    });

    test('localizedMessage returns unknownError with argument', () {
      const error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.unknownError,
        message: 'test',
        argument: 'Something went wrong',
      );
      expect(error.localizedMessage(l10ns), l10ns.unknownError('Something went wrong'));
    });
  });

  group('ClerkEnrollmentTypeExtension', () {
    test('viaInvitationMessage returns correct message for manualInvitation', () {
      expect(
        clerk.EnrollmentMode.manualInvitation.viaInvitationMessage(l10ns),
        l10ns.viaManualInvitation,
      );
    });

    test('viaInvitationMessage returns correct message for automaticInvitation', () {
      expect(
        clerk.EnrollmentMode.automaticInvitation.viaInvitationMessage(l10ns),
        l10ns.viaAutomaticInvitation,
      );
    });

    test('viaInvitationMessage returns correct message for automaticSuggestion', () {
      expect(
        clerk.EnrollmentMode.automaticSuggestion.viaInvitationMessage(l10ns),
        l10ns.viaAutomaticSuggestion,
      );
    });

    test('localizedName returns correct name for manualInvitation', () {
      expect(
        clerk.EnrollmentMode.manualInvitation.localizedName(l10ns),
        l10ns.manualInvitation,
      );
    });

    test('localizedName returns correct name for automaticInvitation', () {
      expect(
        clerk.EnrollmentMode.automaticInvitation.localizedName(l10ns),
        l10ns.automaticInvitation,
      );
    });

    test('localizedName returns correct name for automaticSuggestion', () {
      expect(
        clerk.EnrollmentMode.automaticSuggestion.localizedName(l10ns),
        l10ns.automaticSuggestion,
      );
    });
  });

  group('ClerkStatusLocalization', () {
    test('localizedMessage returns correct message for abandoned', () {
      expect(clerk.Status.abandoned.localizedMessage(l10ns), l10ns.abandoned);
    });

    test('localizedMessage returns correct message for active', () {
      expect(clerk.Status.active.localizedMessage(l10ns), l10ns.active);
    });

    test('localizedMessage returns correct message for complete', () {
      expect(clerk.Status.complete.localizedMessage(l10ns), l10ns.complete);
    });

    test('localizedMessage returns correct message for expired', () {
      expect(clerk.Status.expired.localizedMessage(l10ns), l10ns.expired);
    });

    test('localizedMessage returns correct message for failed', () {
      expect(clerk.Status.failed.localizedMessage(l10ns), l10ns.failed);
    });

    test('localizedMessage returns correct message for pending', () {
      expect(clerk.Status.pending.localizedMessage(l10ns), l10ns.pending);
    });

    test('localizedMessage returns correct message for verified', () {
      expect(clerk.Status.verified.localizedMessage(l10ns), l10ns.verified);
    });

    test('localizedMessage returns correct message for unverified', () {
      expect(clerk.Status.unverified.localizedMessage(l10ns), l10ns.unverified);
    });

    test('localizedMessage returns correct message for missingRequirements', () {
      expect(clerk.Status.missingRequirements.localizedMessage(l10ns), l10ns.missingRequirements);
    });

    test('localizedMessage returns correct message for needsFirstFactor', () {
      expect(clerk.Status.needsFirstFactor.localizedMessage(l10ns), l10ns.needsFirstFactor);
    });

    test('localizedMessage returns correct message for needsIdentifier', () {
      expect(clerk.Status.needsIdentifier.localizedMessage(l10ns), l10ns.needsIdentifier);
    });

    test('localizedMessage returns correct message for needsSecondFactor', () {
      expect(clerk.Status.needsSecondFactor.localizedMessage(l10ns), l10ns.needsSecondFactor);
    });

    test('localizedMessage returns correct message for transferable', () {
      expect(clerk.Status.transferable.localizedMessage(l10ns), l10ns.transferable);
    });
  });

  group('ClerkStrategyLocalization', () {
    test('localizedMessage returns emailAddress for emailAddress strategy', () {
      expect(
        clerk.Strategy.emailAddress.localizedMessage(l10ns),
        l10ns.emailAddress,
      );
    });

    test('localizedMessage returns concise emailAddress when concise is true', () {
      expect(
        clerk.Strategy.emailAddress.localizedMessage(l10ns, concise: true),
        l10ns.emailAddressConcise,
      );
    });

    test('localizedMessage returns phoneNumber for phoneNumber strategy', () {
      expect(
        clerk.Strategy.phoneNumber.localizedMessage(l10ns),
        l10ns.phoneNumber,
      );
    });

    test('localizedMessage returns concise phoneNumber when concise is true', () {
      expect(
        clerk.Strategy.phoneNumber.localizedMessage(l10ns, concise: true),
        l10ns.phoneNumberConcise,
      );
    });

    test('localizedMessage returns username for username strategy', () {
      expect(
        clerk.Strategy.username.localizedMessage(l10ns),
        l10ns.username,
      );
    });

    test('localizedMessage returns emailAddress for resetPasswordEmailCode', () {
      expect(
        clerk.Strategy.resetPasswordEmailCode.localizedMessage(l10ns),
        l10ns.emailAddress,
      );
    });

    test('localizedMessage returns phoneNumber for resetPasswordPhoneCode', () {
      expect(
        clerk.Strategy.resetPasswordPhoneCode.localizedMessage(l10ns),
        l10ns.phoneNumber,
      );
    });
  });

  group('ClerkFieldLocalization', () {
    test('localizedMessage returns emailAddress for emailAddress field', () {
      expect(
        clerk.Field.emailAddress.localizedMessage(l10ns),
        l10ns.emailAddress,
      );
    });

    test('localizedMessage returns phoneNumber for phoneNumber field', () {
      expect(
        clerk.Field.phoneNumber.localizedMessage(l10ns),
        l10ns.phoneNumber,
      );
    });

    test('localizedMessage returns username for username field', () {
      expect(
        clerk.Field.username.localizedMessage(l10ns),
        l10ns.username,
      );
    });
  });

  group('ClerkUserAttributeLocalization', () {
    test('localizedMessage returns emailAddress for emailAddress attribute', () {
      expect(
        clerk.UserAttribute.emailAddress.localizedMessage(l10ns),
        l10ns.emailAddress,
      );
    });

    test('localizedMessage returns phoneNumber for phoneNumber attribute', () {
      expect(
        clerk.UserAttribute.phoneNumber.localizedMessage(l10ns),
        l10ns.phoneNumber,
      );
    });

    test('localizedMessage returns username for username attribute', () {
      expect(
        clerk.UserAttribute.username.localizedMessage(l10ns),
        l10ns.username,
      );
    });

    test('localizedMessage returns firstName for firstName attribute', () {
      expect(
        clerk.UserAttribute.firstName.localizedMessage(l10ns),
        l10ns.firstName,
      );
    });

    test('localizedMessage returns lastName for lastName attribute', () {
      expect(
        clerk.UserAttribute.lastName.localizedMessage(l10ns),
        l10ns.lastName,
      );
    });

    test('localizedMessage returns password for password attribute', () {
      expect(
        clerk.UserAttribute.password.localizedMessage(l10ns),
        l10ns.password,
      );
    });

    test('localizedMessage returns passwordConfirmation for passwordConfirmation attribute', () {
      expect(
        clerk.UserAttribute.passwordConfirmation.localizedMessage(l10ns),
        l10ns.passwordConfirmation,
      );
    });

    test('localizedMessage returns web3Wallet for web3Wallet attribute', () {
      expect(
        clerk.UserAttribute.web3Wallet.localizedMessage(l10ns),
        l10ns.web3Wallet,
      );
    });

    test('localizedMessage returns authenticatorApp for authenticatorApp attribute', () {
      expect(
        clerk.UserAttribute.authenticatorApp.localizedMessage(l10ns),
        l10ns.authenticatorApp,
      );
    });

    test('localizedMessage returns backupCode for backupCode attribute', () {
      expect(
        clerk.UserAttribute.backupCode.localizedMessage(l10ns),
        l10ns.backupCode,
      );
    });

    test('localizedMessage returns passkey for passkey attribute', () {
      expect(
        clerk.UserAttribute.passkey.localizedMessage(l10ns),
        l10ns.passkey,
      );
    });
  });
}

