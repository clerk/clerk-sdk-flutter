import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enums.g.dart';

/// [SessionTokenPollMode] manages how to refresh the [sessionToken]
///
enum SessionTokenPollMode {
  /// Hungry refresh: whenever token expires (more http access and power use)
  hungry,

  /// Lazy refresh: only as required (with possible increased latency on access)
  lazy;
}

/// [EnrollmentMode] Clerk object
@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum EnrollmentMode {
  /// manual invitation
  manualInvitation;

  @override
  String toString() => _$EnrollmentModeEnumMap[this]!;
}

/// [Status] Clerk object
@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum Status {
  /// abandoned
  abandoned,

  /// active
  active,

  /// missing requirements
  missingRequirements,

  /// needs identifier
  needsIdentifier,

  /// needs first factor
  needsFirstFactor,

  /// needs second factor
  needsSecondFactor,

  /// transferable
  transferable,

  /// unverified
  unverified,

  /// verified
  verified,

  /// complete
  complete,

  /// expired
  expired;

  /// is active?
  bool get isActive => this == active;

  /// is verified?
  bool get isVerified => this == verified;

  /// is expired?
  bool get isExpired => this == expired;

  /// needs factor?
  bool get needsFactor => this == needsFirstFactor || this == needsSecondFactor;

  @override
  String toString() => _$StatusEnumMap[this]!;
}

/// [IdentificationStrategy] Clerk object
@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum IdentificationStrategy {
  /// email address
  emailAddress,

  /// oauth apple
  oauthApple,

  /// oauth github
  oauthGithub,

  /// oauth google
  oauthGoogle,

  /// phone number
  phoneNumber,

  /// username
  username;

  @override
  String toString() => _$IdentificationStrategyEnumMap[this]!;
}

/// [UserAttribute] Clerk object
@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum UserAttribute {
  /// username
  username,

  /// email address
  emailAddress,

  /// phone number
  phoneNumber,

  /// first name
  firstName,

  /// last name
  lastName,

  /// password
  password,

  /// password confirmation
  passwordConfirmation,

  /// web3 wallet
  web3Wallet,

  /// authenticator app
  authenticatorApp,

  /// backup code
  backupCode,

  /// passkey
  passkey;

  /// is password?
  bool get isPassword => this == password || this == passwordConfirmation;

  @override
  String toString() => _$UserAttributeEnumMap[this]!;
}

/// [Stage] Clerk object
@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum Stage {
  /// first
  first,

  /// second
  second;

  /// return the appropriate stage for a status
  static Stage forStatus(Status status) {
    return switch (status) {
      Status.needsFirstFactor => first,
      Status.needsSecondFactor => second,
      _ => throw AuthError(
          message: 'No Stage for ###',
          substitution: status.toString(),
        ),
    };
  }

  @override
  String toString() => _$StageEnumMap[this]!;
}

/// [InstanceType] Clerk object
@JsonEnum(alwaysCreate: true)
enum InstanceType {
  /// unknown
  unknown,

  /// development
  development,

  /// production
  production;

  /// Is this a development instance?
  bool get isDevelopment => this == development;

  @override
  String toString() => _$InstanceTypeEnumMap[this]!;
}

/// [IdentifierType] object
enum IdentifierType {
  /// phone number
  phoneNumber('phone_number', Strategy.phoneCode),

  /// email address
  emailAddress('email_address', Strategy.emailCode),

  /// web3 wallet
  web3wallet('web3_wallet', Strategy.phoneCode),
  ;

  const IdentifierType(this.name, this.verificationStrategy);

  /// the [name] of the identifier type
  final String name;

  /// The [Strategy] used to verify the identifier
  final Strategy verificationStrategy;

  /// String to use building urls
  String get urlSegment {
    if (name.endsWith('s')) {
      return '${name}es';
    }
    return '${name}s';
  }

  static final _phoneRE = RegExp(r'[^0-9+]');

  /// Sanitize an [identifier] according to this type's rules
  ///
  String sanitize(String identifier) {
    return switch (this) {
      phoneNumber => identifier.replaceAll(_phoneRE, ''),
      _ => identifier,
    };
  }
}
