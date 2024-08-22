import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum Status {
  active,
  abandoned;

  bool get isActive => this == active;
}

@JsonEnum(fieldRename: FieldRename.snake)
enum Strategy {
  emailCode,
  emailLink,
  phoneCode,
  web3MetamaskSignature,
  web3CoinbaseSignature,
  resetPasswordPhoneCode,
  resetPasswordEmailCode,
  saml,
  passkey;
}
