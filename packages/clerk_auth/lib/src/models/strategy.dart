import 'package:clerk_auth/clerk_auth.dart';

class Strategy {
  const Strategy({required this.name, this.provider});

  factory Strategy.fromJson(String name) => named(name) ?? Strategy.unknown;

  final String name;
  final String? provider;

  static const _oauthToken = 'oauth_token';
  static const _oauthCustom = 'oauth_custom';
  static const _oauth = 'oauth';

  static const unknown = Strategy(name: 'unknown');

  // oauth strategies
  static const oauthApple = Strategy(name: _oauth, provider: 'apple');
  static const oauthGithub = Strategy(name: _oauth, provider: 'github');
  static const oauthGoogle = Strategy(name: _oauth, provider: 'google');
  static const oauthTokenApple = Strategy(name: _oauthToken, provider: 'apple');
  static final oauthStrategies = {
    oauthApple.toString(): oauthApple,
    oauthGithub.toString(): oauthGithub,
    oauthGoogle.toString(): oauthGoogle,
    // 'google_one_tap': oauthGoogle, // guessing this is a synonym?
    oauthTokenApple.toString(): oauthTokenApple,
  };

  // verification strategies
  static const admin = Strategy(name: 'admin');
  static const emailCode = Strategy(name: 'email_code');
  static const emailLink = Strategy(name: 'email_link');
  static const passkey = Strategy(name: 'passkey');
  static const password = Strategy(name: 'password');
  static const phoneCode = Strategy(name: 'phone_code');
  static const resetPasswordEmailCode =
      Strategy(name: 'reset_password_email_code');
  static const resetPasswordPhoneCode =
      Strategy(name: 'reset_password_phone_code');
  static const saml = Strategy(name: 'saml');
  static const ticket = Strategy(name: 'ticket');
  static const web3MetamaskSignature =
      Strategy(name: 'web3_metamask_signature');
  static const web3CoinbaseSignature =
      Strategy(name: 'web3_coinbase_signature');
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
  static const emailAddress = Strategy(name: 'email_address');
  static const phoneNumber = Strategy(name: 'phone_number');
  static const username = Strategy(name: 'username');
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

  bool get isOauth => const [_oauthToken, _oauthCustom, _oauth].contains(name);

  bool get isPassword => this == Strategy.password;

  bool get isOtherStrategy => isOauth == false && isPassword == false;

  bool get requiresCode => const [emailCode, phoneCode].contains(this);

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

  static Strategy forField(Field field) {
    return switch (field) {
      Field.phoneNumber => Strategy.phoneCode,
      Field.emailAddress => Strategy.emailCode,
      _ => throw AuthError(message: 'No way to verify ${field.name}'),
    };
  }

  String toJson() => toString();

  String get title => name.replaceAll('_', ' ');

  @override
  String toString() => [name, provider].nonNulls.join('_');
}
