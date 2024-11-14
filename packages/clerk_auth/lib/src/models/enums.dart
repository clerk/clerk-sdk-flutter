import 'package:clerk_auth/clerk_auth.dart';

typedef AuthParameters = Map<Field, dynamic>;

enum EnrollmentMode {
  manualInvitation,
  ;

  @override
  String toString() => name.toSnakeCase();
}

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
  complete,
  ;

  bool get isActive => this == active;

  bool get needsFactor => this == needsFirstFactor || this == needsSecondFactor;

  @override
  String toString() => name;
}

enum IdentificationStrategy {
  emailAddress,
  oauthApple,
  oauthGithub,
  oauthGoogle,
  phoneNumber,
  username,
  ;

  @override
  String toString() => name.toSnakeCase();
}

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
  passkey,
  ;

  bool get obscure => this == password || this == passwordConfirmation;

  String get snakeCaseName => name.toSnakeCase();

  @override
  String toString() => snakeCaseName;

  String get title => snakeCaseName.replaceAll('_', ' ').capitalized;
}

enum Stage {
  first,
  second;

  @override
  String toString() => name;

  static Stage forStatus(Status status) {
    return switch (status) {
      Status.needsFirstFactor => first,
      Status.needsSecondFactor => second,
      _ => throw AuthError(message: 'No Stage for $status'),
    };
  }
}

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
  signature,
  ;

  @override
  String toString() => name.toSnakeCase();
}
