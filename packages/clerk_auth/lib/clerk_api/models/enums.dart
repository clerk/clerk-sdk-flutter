import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum Status {
  abandoned,
  active,
  missingRequirements,
  needsFirstFactor,
  unverified,
  ;

  bool get isActive => this == active;

  @override
  String toString() => name;
}

@JsonEnum(fieldRename: FieldRename.snake)
enum Strategy {
  emailCode,
  emailLink,
  passkey,
  password,
  phoneCode,
  resetPasswordEmailCode,
  resetPasswordPhoneCode,
  saml,
  web3MetamaskSignature,
  web3CoinbaseSignature,
  ;

  @override
  String toString() => name.toSnakeCase();
}

@JsonEnum(fieldRename: FieldRename.snake)
enum FactorStage {
  first,
  second;

  @override
  String toString() => name;
}

@JsonEnum(fieldRename: FieldRename.snake)
enum Field {
  emailAddress,
  externalAccount,
  firstName,
  lastName,
  password,
  phoneNumber,
  oauthApple,
  oauthGithub,
  oauthGoogle,
  username,
  web3Wallet,
}

extension CaseExtension on String {
  bool _isUpper(int c) => c >= 0x41 && c <= 0x5a;

  String toSnakeCase({String separator = "_"}) {
    if (isEmpty) return this;

    final buffer = StringBuffer();
    for (final rune in runes) {
      if (_isUpper(rune)) {
        buffer.write(separator);
        buffer.writeCharCode(rune | 0x20);
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }
}
