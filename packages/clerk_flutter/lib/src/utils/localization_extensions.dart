import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/generated/clerk_sdk_localizations.dart';

/// Function that performs localization
typedef LocalizedMessage = String Function(ClerkSdkLocalizations l10ns);

/// An extension class to enable localization of [clerk.AuthError]
///
extension ClerkAuthErrorExtension on clerk.AuthError {
  /// Allow localization of an [clerk.AuthError]
  String localizedMessage(ClerkSdkLocalizations l10ns) {
    return switch (code) {
      clerk.AuthErrorCode.actionNotTimely => l10ns.actionNotTimely,
      clerk.AuthErrorCode.cannotDeleteSelf => l10ns.cannotDeleteSelf,
      clerk.AuthErrorCode.jwtPoorlyFormatted =>
        l10ns.jwtPoorlyFormatted(argument.toString()),
      clerk.AuthErrorCode.noAssociatedStrategy =>
        l10ns.noAssociatedStrategy(argument.toString()),
      clerk.AuthErrorCode.noSessionFoundForUser =>
        l10ns.noSessionFoundForUser(argument.toString()),
      clerk.AuthErrorCode.noSessionTokenRetrieved =>
        l10ns.noSessionTokenRetrieved,
      clerk.AuthErrorCode.noStageForStatus =>
        l10ns.noStageForStatus(argument.toString()),
      clerk.AuthErrorCode.noSuchFirstFactorStrategy =>
        l10ns.noSuchFirstFactorStrategy(argument.toString()),
      clerk.AuthErrorCode.noSuchSecondFactorStrategy =>
        l10ns.noSuchSecondFactorStrategy(argument.toString()),
      clerk.AuthErrorCode.passwordMatchError =>
        l10ns.passwordAndPasswordConfirmationMustMatch,
      clerk.AuthErrorCode.passwordResetStrategyError =>
        l10ns.unsupportedPasswordResetStrategy(argument.toString()),
      clerk.AuthErrorCode.problemsConnecting => l10ns.problemsConnecting,
      clerk.AuthErrorCode.signInError => l10ns.signInError(argument.toString()),
      _ => toString(),
    };
  }
}

/// An extension class to enable localization of [clerk.EnrollmentMode]
///
extension ClerkEnrollmentTypeExtension on clerk.EnrollmentMode {
  /// Allow localization of a "via [clerk.EnrollmentMode]" message
  String viaInvitationMessage(ClerkSdkLocalizations l10ns) {
    return switch (this) {
      clerk.EnrollmentMode.manualInvitation => l10ns.viaManualInvitation,
      clerk.EnrollmentMode.automaticInvitation => l10ns.viaAutomaticInvitation,
      clerk.EnrollmentMode.automaticSuggestion => l10ns.viaAutomaticSuggestion,
    };
  }

  /// Allow localization of a [clerk.EnrollmentMode]
  String localizedName(ClerkSdkLocalizations l10ns) {
    return switch (this) {
      clerk.EnrollmentMode.manualInvitation => l10ns.manualInvitation,
      clerk.EnrollmentMode.automaticInvitation => l10ns.automaticInvitation,
      clerk.EnrollmentMode.automaticSuggestion => l10ns.automaticSuggestion,
    };
  }
}

/// An extension class to enable localization of [clerk.Status]
///
extension ClerkStatusLocalization on clerk.Status {
  /// Allow localization of an [clerk.Status]
  String localizedMessage(ClerkSdkLocalizations l10ns) {
    return switch (this) {
      clerk.Status.abandoned => l10ns.abandoned,
      clerk.Status.active => l10ns.active,
      clerk.Status.complete => l10ns.complete,
      clerk.Status.expired => l10ns.expired,
      clerk.Status.failed => l10ns.failed,
      clerk.Status.missingRequirements => l10ns.missingRequirements,
      clerk.Status.needsFirstFactor => l10ns.needsFirstFactor,
      clerk.Status.needsIdentifier => l10ns.needsIdentifier,
      clerk.Status.needsSecondFactor => l10ns.needsSecondFactor,
      clerk.Status.pending => l10ns.pending,
      clerk.Status.transferable => l10ns.transferable,
      clerk.Status.unverified => l10ns.unverified,
      clerk.Status.verified => l10ns.verified,
      _ => title,
    };
  }
}

/// An extension class to enable localization of [clerk.Strategy]
///
extension ClerkStrategyLocalization on clerk.Strategy {
  /// Allow localization of an [clerk.Strategy]
  String localizedMessage(
    ClerkSdkLocalizations l10ns, {
    bool concise = false,
  }) {
    return switch (this) {
      clerk.Strategy.resetPasswordEmailCode ||
      clerk.Strategy.emailAddress =>
        concise ? l10ns.emailAddressConcise : l10ns.emailAddress,
      clerk.Strategy.resetPasswordPhoneCode ||
      clerk.Strategy.phoneNumber =>
        concise ? l10ns.phoneNumberConcise : l10ns.phoneNumber,
      clerk.Strategy.username => l10ns.username,
      _ => toString(),
    };
  }
}

/// An extension class to enable localization of [clerk.Field]
///
extension ClerkFieldLocalization on clerk.Field {
  /// Allow localization of an [clerk.Field]
  String localizedMessage(ClerkSdkLocalizations l10ns) {
    return switch (this) {
      clerk.Field.emailAddress => l10ns.emailAddress,
      clerk.Field.phoneNumber => l10ns.phoneNumber,
      clerk.Field.username => l10ns.username,
      _ => name,
    };
  }
}

/// An extension class to enable localization of [clerk.UserAttribute]
///
extension ClerkUserAttributeLocalization on clerk.UserAttribute {
  /// Allow localization of an [clerk.UserAttribute]
  String localizedMessage(ClerkSdkLocalizations l10ns) {
    return switch (this) {
      clerk.UserAttribute.emailAddress => l10ns.emailAddress,
      clerk.UserAttribute.phoneNumber => l10ns.phoneNumber,
      clerk.UserAttribute.username => l10ns.username,
      clerk.UserAttribute.firstName => l10ns.firstName,
      clerk.UserAttribute.lastName => l10ns.lastName,
      clerk.UserAttribute.password => l10ns.password,
      clerk.UserAttribute.passwordConfirmation => l10ns.passwordConfirmation,
      clerk.UserAttribute.web3Wallet => l10ns.web3Wallet,
      clerk.UserAttribute.authenticatorApp => l10ns.authenticatorApp,
      clerk.UserAttribute.backupCode => l10ns.backupCode,
      clerk.UserAttribute.passkey => l10ns.passkey,
    };
  }
}
