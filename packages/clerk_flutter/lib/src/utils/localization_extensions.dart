import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/generated/clerk_sdk_localizations.dart';

/// Function that performs localization
typedef LocalizedMessage = String Function(ClerkSdkLocalizations localizations);

/// An extension class to enable localization of [clerk.AuthError]
///
extension ClerkAuthErrorExtension on clerk.AuthError {
  /// Allow localization of an [clerk.AuthError]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (code) {
      clerk.AuthErrorCode.actionNotTimely => localizations.actionNotTimely,
      clerk.AuthErrorCode.cannotDeleteSelf => localizations.cannotDeleteSelf,
      clerk.AuthErrorCode.jwtPoorlyFormatted =>
        localizations.jwtPoorlyFormatted(argument.toString()),
      clerk.AuthErrorCode.noAssociatedStrategy =>
        localizations.noAssociatedStrategy(argument.toString()),
      clerk.AuthErrorCode.noSessionFoundForUser =>
        localizations.noSessionFoundForUser(argument.toString()),
      clerk.AuthErrorCode.noSessionTokenRetrieved =>
        localizations.noSessionTokenRetrieved,
      clerk.AuthErrorCode.noStageForStatus =>
        localizations.noStageForStatus(argument.toString()),
      clerk.AuthErrorCode.noSuchFirstFactorStrategy =>
        localizations.noSuchFirstFactorStrategy(argument.toString()),
      clerk.AuthErrorCode.noSuchSecondFactorStrategy =>
        localizations.noSuchSecondFactorStrategy(argument.toString()),
      clerk.AuthErrorCode.passwordMatchError =>
        localizations.passwordAndPasswordConfirmationMustMatch,
      clerk.AuthErrorCode.passwordResetStrategyError =>
        localizations.unsupportedPasswordResetStrategy(argument.toString()),
      clerk.AuthErrorCode.problemsConnecting =>
        localizations.problemsConnecting,
      clerk.AuthErrorCode.signInError =>
        localizations.signInError(argument.toString()),
      _ => toString(),
    };
  }
}

/// An extension class to enable localization of [clerk.EnrollmentMode]
///
extension ClerkEnrollmentTypeExtension on clerk.EnrollmentMode {
  /// Allow localization of a "via [clerk.EnrollmentMode]" message
  String viaInvitationMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.EnrollmentMode.manualInvitation =>
        localizations.viaManualInvitation,
      clerk.EnrollmentMode.automaticInvitation =>
        localizations.viaAutomaticInvitation,
      clerk.EnrollmentMode.automaticSuggestion =>
        localizations.viaAutomaticSuggestion,
    };
  }

  /// Allow localization of a [clerk.EnrollmentMode]
  String localizedName(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.EnrollmentMode.manualInvitation => localizations.manualInvitation,
      clerk.EnrollmentMode.automaticInvitation =>
        localizations.automaticInvitation,
      clerk.EnrollmentMode.automaticSuggestion =>
        localizations.automaticSuggestion,
    };
  }
}

/// An extension class to enable localization of [clerk.Status]
///
extension ClerkStatusLocalization on clerk.Status {
  /// Allow localization of an [clerk.Status]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.Status.abandoned => localizations.abandoned,
      clerk.Status.active => localizations.active,
      clerk.Status.complete => localizations.complete,
      clerk.Status.expired => localizations.expired,
      clerk.Status.failed => localizations.failed,
      clerk.Status.missingRequirements => localizations.missingRequirements,
      clerk.Status.needsFirstFactor => localizations.needsFirstFactor,
      clerk.Status.needsIdentifier => localizations.needsIdentifier,
      clerk.Status.needsSecondFactor => localizations.needsSecondFactor,
      clerk.Status.pending => localizations.pending,
      clerk.Status.transferable => localizations.transferable,
      clerk.Status.unverified => localizations.unverified,
      clerk.Status.verified => localizations.verified,
      _ => title,
    };
  }
}

/// An extension class to enable localization of [clerk.Strategy]
///
extension ClerkStrategyLocalization on clerk.Strategy {
  /// Allow localization of an [clerk.Strategy]
  String localizedMessage(
    ClerkSdkLocalizations localizations, {
    bool concise = false,
  }) {
    if (concise) {
      return switch (this) {
        clerk.Strategy.resetPasswordEmailCode ||
        clerk.Strategy.emailAddress =>
          localizations.emailAddressConcise,
        clerk.Strategy.resetPasswordPhoneCode ||
        clerk.Strategy.phoneNumber =>
          localizations.phoneNumberConcise,
        clerk.Strategy.username => localizations.username,
        _ => toString(),
      };
    }

    return switch (this) {
      clerk.Strategy.resetPasswordEmailCode ||
      clerk.Strategy.emailAddress =>
        localizations.emailAddress,
      clerk.Strategy.resetPasswordPhoneCode ||
      clerk.Strategy.phoneNumber =>
        localizations.phoneNumber,
      clerk.Strategy.username => localizations.username,
      _ => toString(),
    };
  }
}

/// An extension class to enable localization of [clerk.Field]
///
extension ClerkFieldLocalization on clerk.Field {
  /// Allow localization of an [clerk.Field]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.Field.emailAddress => localizations.emailAddress,
      clerk.Field.phoneNumber => localizations.phoneNumber,
      clerk.Field.username => localizations.username,
      _ => name,
    };
  }
}

/// An extension class to enable localization of [clerk.UserAttribute]
///
extension ClerkUserAttributeLocalization on clerk.UserAttribute {
  /// Allow localization of an [clerk.UserAttribute]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.UserAttribute.emailAddress => localizations.emailAddress,
      clerk.UserAttribute.phoneNumber => localizations.phoneNumber,
      clerk.UserAttribute.username => localizations.username,
      clerk.UserAttribute.firstName => localizations.firstName,
      clerk.UserAttribute.lastName => localizations.lastName,
      clerk.UserAttribute.password => localizations.password,
      clerk.UserAttribute.passwordConfirmation =>
        localizations.passwordConfirmation,
      clerk.UserAttribute.web3Wallet => localizations.web3Wallet,
      clerk.UserAttribute.authenticatorApp => localizations.authenticatorApp,
      clerk.UserAttribute.backupCode => localizations.backupCode,
      clerk.UserAttribute.passkey => localizations.passkey,
    };
  }
}
