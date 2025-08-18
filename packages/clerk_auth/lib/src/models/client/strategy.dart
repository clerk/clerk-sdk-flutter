import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'field.dart';

/// [Strategy] Clerk object
///
/// A [Strategy] has a [name]. The various oAuth strategies ('oauth',
/// 'oauth_token' and 'oauth_custom') also have a [provider]
///
@immutable
@JsonSerializable()
class Strategy {
  /// Constructor for [Strategy]
  const Strategy({required this.name, this.provider});

  /// fromJson - a factory
  factory Strategy.fromJson(String name) => named(name) ?? Strategy.unknown;

  /// name
  final String name;

  /// provider
  final String? provider;

  static const _oauthTokenGoogleName = 'google_one_tap';
  static const _oauthToken = 'oauth_token';
  static const _oauthCustom = 'oauth_custom';
  static const _oauth = 'oauth';

  /// unknown strategy
  static const unknown = Strategy(name: 'unknown');

  // oauth strategies

  /// oauth apple strategy
  static const oauthApple = Strategy(name: _oauth, provider: 'apple');

  /// oauth github strategy
  static const oauthGithub = Strategy(name: _oauth, provider: 'github');

  /// oauth google strategy
  static const oauthGoogle = Strategy(name: _oauth, provider: 'google');

  /// oauth facebook strategy
  static const oauthFacebook = Strategy(name: _oauth, provider: 'facebook');

  /// oauth token apple strategy
  static const oauthTokenApple = Strategy(name: _oauthToken, provider: 'apple');

  /// google authentication token strategy (google one tap)
  static const oauthTokenGoogle = Strategy(name: _oauthTokenGoogleName);

  /// the collected oauth strategies
  static final oauthStrategies = {
    oauthApple.toString(): oauthApple,
    oauthGithub.toString(): oauthGithub,
    oauthGoogle.toString(): oauthGoogle,
    oauthFacebook.toString(): oauthFacebook,
    oauthTokenApple.toString(): oauthTokenApple,
    oauthTokenGoogle.toString(): oauthTokenGoogle,
  };

  // verification strategies

  /// admin strategy
  static const admin = Strategy(name: 'admin');

  /// email code strategy
  static const emailCode = Strategy(name: 'email_code');

  /// email link strategy
  static const emailLink = Strategy(name: 'email_link');

  /// passkey strategy
  static const passkey = Strategy(name: 'passkey');

  /// password strategy
  static const password = Strategy(name: 'password');

  /// phone code strategy
  static const phoneCode = Strategy(name: 'phone_code');

  /// reset password email code strategy
  static const resetPasswordEmailCode =
      Strategy(name: 'reset_password_email_code');

  /// reset password phone code strategy
  static const resetPasswordPhoneCode =
      Strategy(name: 'reset_password_phone_code');

  /// saml strategy
  static const saml = Strategy(name: 'saml');

  /// ticket strategy
  static const ticket = Strategy(name: 'ticket');

  /// web3 metamask signature strategy
  static const web3MetamaskSignature =
      Strategy(name: 'web3_metamask_signature');

  /// web3 coinbase signature strategy
  static const web3CoinbaseSignature =
      Strategy(name: 'web3_coinbase_signature');

  /// the collected verification strategies
  static final verificationStrategies = {
    admin.name: admin,
    emailCode.name: emailCode,
    emailLink.name: emailLink,
    passkey.name: passkey,
    password.name: password,
    phoneCode.name: phoneCode,
    resetPasswordEmailCode.name: resetPasswordEmailCode,
    resetPasswordPhoneCode.name: resetPasswordPhoneCode,
    saml.name: saml,
    ticket.name: ticket,
    web3MetamaskSignature.name: web3MetamaskSignature,
    web3CoinbaseSignature.name: web3CoinbaseSignature,
  };

  // identification strategies

  /// email address strategy
  static const emailAddress = Strategy(name: 'email_address');

  /// phone number strategy
  static const phoneNumber = Strategy(name: 'phone_number');

  /// username strategy
  static const username = Strategy(name: 'username');

  /// the collected identification strategies
  static final identificationStrategies = {
    emailAddress.name: emailAddress,
    phoneNumber.name: phoneNumber,
    username.name: username,
  };

  static final _strategies = {
    ...oauthStrategies,
    ...verificationStrategies,
    ...identificationStrategies,
  };

  /// is unknown?
  bool get isUnknown => this == unknown;

  /// is known?
  bool get isKnown => isUnknown == false;

  /// is some variety of oauth?
  bool get isOauth => name == _oauth || isOauthCustom || isOauthToken;

  /// is oauth custom?
  bool get isOauthCustom => name == _oauthCustom;

  /// is oauth token?
  bool get isOauthToken =>
      const [_oauthToken, _oauthTokenGoogleName].contains(name);

  /// is other strategy?
  bool get isOtherStrategy => isOauth == false && requiresPassword == false;

  /// is phone strategy?
  bool get isPhone =>
      const [phoneCode, phoneNumber, resetPasswordPhoneCode].contains(this);

  /// is a password reset strategy?
  bool get isPasswordResetter =>
      const [resetPasswordEmailCode, resetPasswordPhoneCode].contains(this);

  /// requires password?
  bool get requiresPassword => const [
        password,
        resetPasswordEmailCode,
        resetPasswordPhoneCode
      ].contains(this);

  /// requires code?
  bool get requiresCode => const [
        emailCode,
        phoneCode,
        resetPasswordEmailCode,
        resetPasswordPhoneCode
      ].contains(this);

  /// requires signature?
  bool get requiresSignature =>
      const [web3MetamaskSignature, web3CoinbaseSignature].contains(this);

  /// requires redirect?
  bool get requiresRedirect =>
      name == _oauth || const [emailLink, saml].contains(this);

  /// For a given [name] return the [Strategy] it identifies.
  /// Create one if necessary and possible
  ///
  static Strategy? named(dynamic name) {
    if (name case String name) {
      switch (_strategies[name]) {
        case Strategy strategy:
          return strategy;

        case null when name.startsWith(_oauthToken):
          return _strategies[name] = Strategy(
            name: _oauthToken,
            provider: name.substring(_oauthToken.length + 1),
          );

        case null when name.startsWith(_oauthCustom):
          return _strategies[name] = Strategy(
            name: _oauthCustom,
            provider: name.substring(_oauthCustom.length + 1),
          );

        case null when name.startsWith(_oauth):
          return _strategies[name] = Strategy(
            name: _oauth,
            provider: name.substring(_oauth.length + 1),
          );

        default:
          return null;
      }
    }

    return null;
  }

  /// For a given [Field], return an appropriate [Strategy], or
  /// throw an error
  ///
  static Strategy forField(Field field) {
    return switch (field) {
      Field.phoneNumber => Strategy.phoneCode,
      Field.emailAddress => Strategy.emailCode,
      _ => throw AuthError(
          message: 'No strategy associated with {arg}',
          argument: field.name,
          code: AuthErrorCode.noAssociatedStrategy,
        ),
    };
  }

  /// For a given [UserAttribute], return an appropriate [Strategy], or
  /// throw an error
  ///
  static Strategy forUserAttribute(UserAttribute attr) {
    return switch (attr) {
      UserAttribute.phoneNumber => Strategy.phoneCode,
      UserAttribute.emailAddress => Strategy.emailCode,
      _ => throw AuthError(
          message: 'No strategy associated with {arg}',
          argument: attr.name,
          code: AuthErrorCode.noAssociatedStrategy,
        ),
    };
  }

  /// toJson
  String toJson() => toString();

  /// toJson
  @override
  String toString() => [name, provider].nonNulls.join('_');
}
