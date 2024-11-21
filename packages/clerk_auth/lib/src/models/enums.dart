// ignore_for_file: public_member_api_docs
// See https://clerk.com/docs/reference/frontend-api for
// more details

import 'package:clerk_auth/clerk_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enums.g.dart';

@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum EnrollmentMode {
  manualInvitation;

  @override
  String toString() => _$EnrollmentModeEnumMap[this]!;
}

@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum Status {
  abandoned,
  active,
  missingRequirements,
  needsIdentifier,
  needsFirstFactor,
  needsSecondFactor,
  transferable,
  unverified,
  verified,
  complete;

  bool get isActive => this == active;

  bool get needsFactor => this == needsFirstFactor || this == needsSecondFactor;

  @override
  String toString() => _$StatusEnumMap[this]!;
}

@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum IdentificationStrategy {
  emailAddress,
  oauthApple,
  oauthGithub,
  oauthGoogle,
  phoneNumber,
  username;

  @override
  String toString() => _$IdentificationStrategyEnumMap[this]!;
}

@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum UserAttribute {
  username,
  emailAddress,
  phoneNumber,
  firstName,
  lastName,
  password,
  passwordConfirmation,
  web3Wallet,
  authenticatorApp,
  backupCode,
  passkey;

  bool get obscure => this == password || this == passwordConfirmation;

  String get title => toString().replaceAll('_', ' ').capitalized;

  @override
  String toString() => _$UserAttributeEnumMap[this]!;
}

@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum Stage {
  first,
  second;

  static Stage forStatus(Status status) {
    return switch (status) {
      Status.needsFirstFactor => first,
      Status.needsSecondFactor => second,
      _ => throw AuthError(message: 'No Stage for $status'),
    };
  }

  @override
  String toString() => _$StageEnumMap[this]!;
}

@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
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
  code,
  token,
  signature;

  @override
  String toString() => _$FieldEnumMap[this]!;
}
