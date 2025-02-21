// ignore_for_file: public_member_api_docs, use_super_parameters
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'clerk_sdk_localizations_en.dart';

/// Callers can lookup localized strings with an instance of ClerkSdkLocalizations
/// returned by `ClerkSdkLocalizations.of(context)`.
///
/// Applications need to include `ClerkSdkLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/clerk_sdk_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ClerkSdkLocalizations.localizationsDelegates,
///   supportedLocales: ClerkSdkLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ClerkSdkLocalizations.supportedLocales
/// property.
abstract class ClerkSdkLocalizations {
  ClerkSdkLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ClerkSdkLocalizations? of(BuildContext context) {
    return Localizations.of<ClerkSdkLocalizations>(
        context, ClerkSdkLocalizations);
  }

  static const LocalizationsDelegate<ClerkSdkLocalizations> delegate =
      _ClerkSdkLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @aLengthOfBetweenMINAndMAX.
  ///
  /// In en, this message translates to:
  /// **'a length of between {min} and {max}'**
  String aLengthOfBetweenMINAndMAX(int min, int max);

  /// No description provided for @aLengthOfMINOrGreater.
  ///
  /// In en, this message translates to:
  /// **'a length of {min} or greater'**
  String aLengthOfMINOrGreater(int min);

  /// No description provided for @aLowercaseLetter.
  ///
  /// In en, this message translates to:
  /// **'a LOWERCASE letter'**
  String get aLowercaseLetter;

  /// No description provided for @aNumber.
  ///
  /// In en, this message translates to:
  /// **'a NUMBER'**
  String get aNumber;

  /// No description provided for @aSpecialCharacter.
  ///
  /// In en, this message translates to:
  /// **'a SPECIAL CHARACTER ({chars})'**
  String aSpecialCharacter(String chars);

  /// No description provided for @abandoned.
  ///
  /// In en, this message translates to:
  /// **'ABANDONED'**
  String get abandoned;

  /// No description provided for @actionNotTimely.
  ///
  /// In en, this message translates to:
  /// **'Awaited user action not completed in required timeframe'**
  String get actionNotTimely;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get active;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get addAccount;

  /// No description provided for @addEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Add email address'**
  String get addEmailAddress;

  /// No description provided for @addPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Add phone number'**
  String get addPhoneNumber;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @anUppercaseLetter.
  ///
  /// In en, this message translates to:
  /// **'an UPPERCASE letter'**
  String get anUppercaseLetter;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @clickOnTheLinkThatSBeenSentToAndThenCheckBackHere.
  ///
  /// In en, this message translates to:
  /// **'Click on the link that‘s been sent to {identifier} and then check back here'**
  String clickOnTheLinkThatSBeenSentToAndThenCheckBackHere(String identifier);

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'COMPLETE'**
  String get complete;

  /// No description provided for @connectAccount.
  ///
  /// In en, this message translates to:
  /// **'Connect account'**
  String get connectAccount;

  /// No description provided for @connectedAccounts.
  ///
  /// In en, this message translates to:
  /// **'Connected accounts'**
  String get connectedAccounts;

  /// No description provided for @cont.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get cont;

  /// No description provided for @createOrganization.
  ///
  /// In en, this message translates to:
  /// **'Create organization'**
  String get createOrganization;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'email address'**
  String get emailAddress;

  /// No description provided for @enterCodeSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter code sent to {identifier}'**
  String enterCodeSentTo(String identifier);

  /// No description provided for @enterTheCodeSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to {identifier}'**
  String enterTheCodeSentTo(String identifier);

  /// No description provided for @enterTheCodeSentToYou.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to you'**
  String get enterTheCodeSentToYou;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'EXPIRED'**
  String get expired;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'FAILED'**
  String get failed;

  /// No description provided for @invalidEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address: {address}'**
  String invalidEmailAddress(String address);

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number: {number}'**
  String invalidPhoneNumber(String number);

  /// No description provided for @jwtPoorlyFormatted.
  ///
  /// In en, this message translates to:
  /// **'JWT poorly formatted: {arg}'**
  String jwtPoorlyFormatted(String arg);

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get loading;

  /// No description provided for @logo.
  ///
  /// In en, this message translates to:
  /// **'Logo'**
  String get logo;

  /// No description provided for @missingRequirements.
  ///
  /// In en, this message translates to:
  /// **'MISSING REQUIREMENTS'**
  String get missingRequirements;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @needsFirstFactor.
  ///
  /// In en, this message translates to:
  /// **'NEEDS FIRST FACTOR'**
  String get needsFirstFactor;

  /// No description provided for @needsIdentifier.
  ///
  /// In en, this message translates to:
  /// **'NEEDS IDENTIFIER'**
  String get needsIdentifier;

  /// No description provided for @needsSecondFactor.
  ///
  /// In en, this message translates to:
  /// **'NEEDS SECOND FACTOR'**
  String get needsSecondFactor;

  /// No description provided for @noAssociatedStrategy.
  ///
  /// In en, this message translates to:
  /// **'No strategy associated with {arg}'**
  String noAssociatedStrategy(String arg);

  /// No description provided for @noSessionFoundForUser.
  ///
  /// In en, this message translates to:
  /// **'No session found for {arg}'**
  String noSessionFoundForUser(String arg);

  /// No description provided for @noSessionTokenRetrieved.
  ///
  /// In en, this message translates to:
  /// **'No session token retrieved'**
  String get noSessionTokenRetrieved;

  /// No description provided for @noStageForStatus.
  ///
  /// In en, this message translates to:
  /// **'No stage for {arg}'**
  String noStageForStatus(String arg);

  /// No description provided for @noSuchFirstFactorStrategy.
  ///
  /// In en, this message translates to:
  /// **'Strategy {arg} not supported for first factor'**
  String noSuchFirstFactorStrategy(String arg);

  /// No description provided for @noSuchSecondFactorStrategy.
  ///
  /// In en, this message translates to:
  /// **'Strategy {arg} not supported for second factor'**
  String noSuchSecondFactorStrategy(String arg);

  /// No description provided for @noTranslationFor.
  ///
  /// In en, this message translates to:
  /// **'No translation for {name}'**
  String noTranslationFor(String name);

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'(optional)'**
  String get optional;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordAndPasswordConfirmationMustMatch.
  ///
  /// In en, this message translates to:
  /// **'Password and password confirmation must match'**
  String get passwordAndPasswordConfirmationMustMatch;

  /// No description provided for @passwordMatchError.
  ///
  /// In en, this message translates to:
  /// **'Password and password confirmation must match'**
  String get passwordMatchError;

  /// No description provided for @passwordMustBeSupplied.
  ///
  /// In en, this message translates to:
  /// **'A password must be supplied'**
  String get passwordMustBeSupplied;

  /// No description provided for @passwordRequires.
  ///
  /// In en, this message translates to:
  /// **'Password requires:'**
  String get passwordRequires;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'phone number'**
  String get phoneNumber;

  /// No description provided for @pleaseChooseAnAccountToConnect.
  ///
  /// In en, this message translates to:
  /// **'Please choose an account to connect'**
  String get pleaseChooseAnAccountToConnect;

  /// No description provided for @primary.
  ///
  /// In en, this message translates to:
  /// **'PRIMARY'**
  String get primary;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @profileDetails.
  ///
  /// In en, this message translates to:
  /// **'Profile details'**
  String get profileDetails;

  /// No description provided for @recommendSize.
  ///
  /// In en, this message translates to:
  /// **'Recommend size 1:1, up to 5MB.'**
  String get recommendSize;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'(required)'**
  String get requiredField;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @selectAccount.
  ///
  /// In en, this message translates to:
  /// **'Select the account with which you wish to continue'**
  String get selectAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @signInByClickingALinkSentToYouByEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign in by clicking a link sent to you by email'**
  String get signInByClickingALinkSentToYouByEmail;

  /// No description provided for @signInByEnteringACodeSentToYouByEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign in by entering a code sent to you by email'**
  String get signInByEnteringACodeSentToYouByEmail;

  /// No description provided for @signInByEnteringACodeSentToYouByTextMessage.
  ///
  /// In en, this message translates to:
  /// **'Sign in by entering a code sent to you by text message'**
  String get signInByEnteringACodeSentToYouByTextMessage;

  /// No description provided for @signInTo.
  ///
  /// In en, this message translates to:
  /// **'Sign in to {name}'**
  String signInTo(String name);

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signOutOfAllAccounts.
  ///
  /// In en, this message translates to:
  /// **'Sign out of all accounts'**
  String get signOutOfAllAccounts;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @signUpTo.
  ///
  /// In en, this message translates to:
  /// **'Sign up to {name}'**
  String signUpTo(String name);

  /// No description provided for @slugUrl.
  ///
  /// In en, this message translates to:
  /// **'Slug URL'**
  String get slugUrl;

  /// No description provided for @transferable.
  ///
  /// In en, this message translates to:
  /// **'TRANSFERABLE'**
  String get transferable;

  /// No description provided for @typeTypeInvalid.
  ///
  /// In en, this message translates to:
  /// **'Type \'{type}\' is invalid'**
  String typeTypeInvalid(String type);

  /// No description provided for @unverified.
  ///
  /// In en, this message translates to:
  /// **'UNVERIFIED'**
  String get unverified;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'username'**
  String get username;

  /// No description provided for @verificationEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address verification'**
  String get verificationEmailAddress;

  /// No description provided for @verificationPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number verification'**
  String get verificationPhoneNumber;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED'**
  String get verified;

  /// No description provided for @verifyYourEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Verify your email address'**
  String get verifyYourEmailAddress;

  /// No description provided for @verifyYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Verify your phone number'**
  String get verifyYourPhoneNumber;

  /// No description provided for @welcomeBackPleaseSignInToContinue.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Please sign in to continue'**
  String get welcomeBackPleaseSignInToContinue;

  /// No description provided for @welcomePleaseFillInTheDetailsToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Please fill in the details to get started'**
  String get welcomePleaseFillInTheDetailsToGetStarted;

  /// No description provided for @youNeedToAdd.
  ///
  /// In en, this message translates to:
  /// **'You need to add:'**
  String get youNeedToAdd;
}

class _ClerkSdkLocalizationsDelegate
    extends LocalizationsDelegate<ClerkSdkLocalizations> {
  const _ClerkSdkLocalizationsDelegate();

  @override
  Future<ClerkSdkLocalizations> load(Locale locale) {
    return SynchronousFuture<ClerkSdkLocalizations>(
        lookupClerkSdkLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ClerkSdkLocalizationsDelegate old) => false;
}

ClerkSdkLocalizations lookupClerkSdkLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return ClerkSdkLocalizationsEn();
  }

  throw FlutterError(
      'ClerkSdkLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
