// ignore_for_file: public_member_api_docs, use_super_parameters

import 'clerk_sdk_localizations.dart';

/// The translations for English (`en`).
class ClerkSdkLocalizationsEn extends ClerkSdkLocalizations {
  ClerkSdkLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String aLengthOfBetweenMINAndMAX(int min, int max) {
    return 'a length of between $min and $max';
  }

  @override
  String aLengthOfMINOrGreater(int min) {
    return 'a length of $min or greater';
  }

  @override
  String get aLowercaseLetter => 'a LOWERCASE letter';

  @override
  String get aNumber => 'a NUMBER';

  @override
  String aSpecialCharacter(String chars) {
    return 'a SPECIAL CHARACTER ($chars)';
  }

  @override
  String get abandoned => 'ABANDONED';

  @override
  String get actionNotTimely =>
      'Awaited user action not completed in required timeframe';

  @override
  String get active => 'ACTIVE';

  @override
  String get addAccount => 'Add account';

  @override
  String get addEmailAddress => 'Add email address';

  @override
  String get addPhoneNumber => 'Add phone number';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get anUppercaseLetter => 'an UPPERCASE letter';

  @override
  String get and => 'and';

  @override
  String get cancel => 'Cancel';

  @override
  String clickOnTheLinkThatSBeenSentToAndThenCheckBackHere(String identifier) {
    return 'Click on the link that‘s been sent to $identifier and then check back here';
  }

  @override
  String get complete => 'COMPLETE';

  @override
  String get connectAccount => 'Connect account';

  @override
  String get connectedAccounts => 'Connected accounts';

  @override
  String get cont => 'Continue';

  @override
  String get createOrganization => 'Create organization';

  @override
  String get dontHaveAnAccount => 'Don’t have an account?';

  @override
  String get emailAddress => 'email address';

  @override
  String enterCodeSentTo(String identifier) {
    return 'Enter code sent to $identifier';
  }

  @override
  String enterTheCodeSentTo(String identifier) {
    return 'Enter the code sent to $identifier';
  }

  @override
  String get enterTheCodeSentToYou => 'Enter the code sent to you';

  @override
  String get expired => 'EXPIRED';

  @override
  String get failed => 'FAILED';

  @override
  String invalidEmailAddress(String address) {
    return 'Invalid email address: $address';
  }

  @override
  String invalidPhoneNumber(String number) {
    return 'Invalid phone number: $number';
  }

  @override
  String jwtPoorlyFormatted(String arg) {
    return 'JWT poorly formatted: $arg';
  }

  @override
  String get loading => 'Loading…';

  @override
  String get logo => 'Logo';

  @override
  String get missingRequirements => 'MISSING REQUIREMENTS';

  @override
  String get name => 'Name';

  @override
  String get needsFirstFactor => 'NEEDS FIRST FACTOR';

  @override
  String get needsIdentifier => 'NEEDS IDENTIFIER';

  @override
  String get needsSecondFactor => 'NEEDS SECOND FACTOR';

  @override
  String noAssociatedCodeRetrievalMethod(String arg) {
    return 'No code retrieval method associated with $arg';
  }

  @override
  String noAssociatedStrategy(String arg) {
    return 'No strategy associated with $arg';
  }

  @override
  String noSessionFoundForUser(String arg) {
    return 'No session found for $arg';
  }

  @override
  String get noSessionTokenRetrieved => 'No session token retrieved';

  @override
  String noStageForStatus(String arg) {
    return 'No stage for $arg';
  }

  @override
  String noSuchFirstFactorStrategy(String arg) {
    return 'Strategy $arg not supported for first factor';
  }

  @override
  String noSuchSecondFactorStrategy(String arg) {
    return 'Strategy $arg not supported for second factor';
  }

  @override
  String noTranslationFor(String name) {
    return 'No translation for $name';
  }

  @override
  String get ok => 'OK';

  @override
  String get optional => '(optional)';

  @override
  String get or => 'or';

  @override
  String get password => 'Password';

  @override
  String get passwordAndPasswordConfirmationMustMatch =>
      'Password and password confirmation must match';

  @override
  String get passwordMatchError =>
      'Password and password confirmation must match';

  @override
  String get passwordMustBeSupplied => 'A password must be supplied';

  @override
  String get passwordRequires => 'Password requires:';

  @override
  String get phoneNumber => 'phone number';

  @override
  String get pleaseChooseAnAccountToConnect =>
      'Please choose an account to connect';

  @override
  String get primary => 'PRIMARY';

  @override
  String get profile => 'Profile';

  @override
  String get profileDetails => 'Profile details';

  @override
  String get recommendSize => 'Recommend size 1:1, up to 5MB.';

  @override
  String get requiredField => '(required)';

  @override
  String get resend => 'Resend';

  @override
  String get selectAccount =>
      'Select the account with which you wish to continue';

  @override
  String get signIn => 'Sign in';

  @override
  String get signInByClickingALinkSentToYouByEmail =>
      'Sign in by clicking a link sent to you by email';

  @override
  String get signInByEnteringACodeSentToYouByEmail =>
      'Sign in by entering a code sent to you by email';

  @override
  String get signInByEnteringACodeSentToYouByTextMessage =>
      'Sign in by entering a code sent to you by text message';

  @override
  String signInTo(String name) {
    return 'Sign in to $name';
  }

  @override
  String get signOut => 'Sign out';

  @override
  String get signOutOfAllAccounts => 'Sign out of all accounts';

  @override
  String get signUp => 'Sign up';

  @override
  String signUpTo(String name) {
    return 'Sign up to $name';
  }

  @override
  String get slugUrl => 'Slug URL';

  @override
  String get transferable => 'TRANSFERABLE';

  @override
  String typeTypeInvalid(String type) {
    return 'Type \'$type\' is invalid';
  }

  @override
  String get unverified => 'UNVERIFIED';

  @override
  String get username => 'username';

  @override
  String get verificationEmailAddress => 'Email address verification';

  @override
  String get verificationPhoneNumber => 'Phone number verification';

  @override
  String get verified => 'VERIFIED';

  @override
  String get verifyYourEmailAddress => 'Verify your email address';

  @override
  String get verifyYourPhoneNumber => 'Verify your phone number';

  @override
  String get welcomeBackPleaseSignInToContinue =>
      'Welcome back! Please sign in to continue';

  @override
  String get welcomePleaseFillInTheDetailsToGetStarted =>
      'Welcome! Please fill in the details to get started';

  @override
  String get youNeedToAdd => 'You need to add:';
}
