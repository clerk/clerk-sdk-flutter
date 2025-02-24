import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/generated/clerk_sdk_localizations.dart';

/// Function that performs localization
typedef LocalizedMessage = String Function(ClerkSdkLocalizations localizations);

/// An extension class to enable localization of [clerk.AuthError]
///
extension ClerkAuthErrorExtension on clerk.AuthError {
  /// Allow localization of an [clerk.AuthError]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    switch (code) {
      case clerk.AuthErrorCode.noStageForStatus:
        return localizations.noStageForStatus(argument.toString());
      case clerk.AuthErrorCode.noSessionTokenRetrieved:
        return localizations.noSessionTokenRetrieved;
      case clerk.AuthErrorCode.noAssociatedStrategy:
        return localizations.noAssociatedStrategy(argument.toString());
      case clerk.AuthErrorCode.passwordMatchError:
        return localizations.passwordAndPasswordConfirmationMustMatch;
      case clerk.AuthErrorCode.jwtPoorlyFormatted:
        return localizations.jwtPoorlyFormatted(argument.toString());
      case clerk.AuthErrorCode.actionNotTimely:
        return localizations.actionNotTimely;
      case clerk.AuthErrorCode.noSessionFoundForUser:
        return localizations.noSessionFoundForUser(argument.toString());
      case clerk.AuthErrorCode.noSuchFirstFactorStrategy:
        return localizations.noSuchFirstFactorStrategy(argument.toString());
      case clerk.AuthErrorCode.noSuchSecondFactorStrategy:
        return localizations.noSuchSecondFactorStrategy(argument.toString());
      default:
        return toString();
    }
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
      clerk.Status.missingRequirements => localizations.missingRequirements,
      clerk.Status.needsIdentifier => localizations.needsIdentifier,
      clerk.Status.needsFirstFactor => localizations.needsFirstFactor,
      clerk.Status.needsSecondFactor => localizations.needsSecondFactor,
      clerk.Status.transferable => localizations.transferable,
      clerk.Status.unverified => localizations.unverified,
      clerk.Status.verified => localizations.verified,
      clerk.Status.complete => localizations.complete,
      clerk.Status.expired => localizations.expired,
      clerk.Status.failed => localizations.failed,
      _ => title,
    };
  }
}

/// An extension class to enable localization of [clerk.Strategy]
///
extension ClerkStrategyLocalization on clerk.Strategy {
  /// Allow localization of an [clerk.Strategy]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.Strategy.emailAddress => localizations.emailAddress,
      clerk.Strategy.phoneNumber => localizations.phoneNumber,
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
      _ => name,
    };
  }
}

/// An extension class for [String]
///
extension StringExt on String {
  /// A method that takes a list of pre-translated [items] e.g.
  /// \['first', 'second', 'third'\] and returns a textual representation
  /// of its contents as alternatives e.g. "first, second or third"
  ///
  /// [connector] can be overridden, and a [prefix] can be prepended. Both
  /// should already be translated as required.
  ///
  /// This method should be overridden for languages where this format does not
  /// provide the correct representation for alternates
  ///
  static String alternatives(
    List<String> items, {
    required String connector,
    String? prefix,
  }) {
    if (items.isEmpty) {
      return '';
    }

    final buf = StringBuffer();

    if (prefix case String prefix) {
      buf.write(prefix);
      buf.writeCharCode(0x20);
    }

    buf.write(items.first);

    for (int i = 1; i < items.length - 1; i++) {
      buf.write(', ');
      buf.write(items[i]);
    }

    if (items.length > 1) {
      buf.write(' $connector ');
      buf.write(items.last);
    }

    return buf.toString();
  }
}
