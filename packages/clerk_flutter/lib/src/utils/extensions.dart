import 'package:clerk_flutter/src/generated/clerk_sdk_localizations.dart';

/// An enum to enable contextual dynamic lookup of string keys
/// in the localized appiolect. This is required so that we're not relying on
/// translated terms being inserted into other translations, which may not work
/// cross language.
///
enum ClerkSdkLocalizationType {
  /// verify
  verify,

  /// verification
  verification,

  /// sign in
  signIn,
}

/// An extension class for [ClerkSdkLocalizations]
///
extension ClerkSdkLocalizationsExt on ClerkSdkLocalizations {
  /// Return a translated version of a [key]
  String lookup(String key, {ClerkSdkLocalizationType? type}) {
    return switch (type) {
      ClerkSdkLocalizationType.verify => switch (key) {
          'email_address' => verifyYourEmailAddress,
          'phone_number' => verifyYourPhoneNumber,
          _ => key,
        },
      ClerkSdkLocalizationType.verification => switch (key) {
          'email_address' => verificationEmailAddress,
          'phone_number' => verificationPhoneNumber,
          _ => key,
        },
      ClerkSdkLocalizationType.signIn => switch (key) {
          'email_link' => signInByClickingALinkSentToYouByEmail,
          'email_code' => signInByEnteringACodeSentToYouByEmail,
          'phone_code' => signInByEnteringACodeSentToYouByTextMessage,
          _ => key,
        },
      _ => switch (key) {
          'email_address' => emailAddress,
          'phone_number' => phoneNumber,
          'username' => username,
          'abandoned' => abandoned,
          'active' => active,
          'missing_requirements' => missingRequirements,
          'needs_identifier' => needsIdentifier,
          'needs_first_factor' => needsFirstFactor,
          'needs_second_factor' => needsSecondFactor,
          'transferable' => transferable,
          'unverified' => unverified,
          'verified' => verified,
          'complete' => complete,
          'expired' => expired,
          'failed' => failed,
          _ => key,
        },
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

    for (int i = 1; i < items.length - 1; ++i) {
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
