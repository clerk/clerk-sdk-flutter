import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up.g.dart';

/// [SignUp] Clerk object
@JsonSerializable()
class SignUp {
  /// Constructor
  const SignUp({
    required this.id,
    required this.status,
    required this.requiredFields,
    required this.optionalFields,
    required this.missingFields,
    required this.unverifiedFields,
    required this.username,
    required this.emailAddress,
    required this.phoneNumber,
    required this.web3Wallet,
    required this.passwordEnabled,
    required this.firstName,
    required this.lastName,
    required this.unsafeMetadata,
    required this.publicMetadata,
    required this.customAction,
    required this.externalId,
    required this.createdSessionId,
    required this.createdUserId,
    required this.abandonAt,
  });

  /// id
  final String id;

  /// status
  final Status status;

  /// required fields
  final List<Field> requiredFields;

  /// optional fields
  final List<Field> optionalFields;

  /// missing fields
  final List<Field> missingFields;

  /// unverified fields
  final List<Field> unverifiedFields;

  /// username
  final String? username;

  /// email address
  final String? emailAddress;

  /// phone number
  final String? phoneNumber;

  /// web3 wallet
  final String? web3Wallet;

  /// password enabled
  final bool passwordEnabled;

  /// first name
  final String? firstName;

  /// last name
  final String? lastName;

  /// unsafe metadata
  final Map<String, dynamic> unsafeMetadata;

  /// public metadata
  final Map<String, dynamic> publicMetadata;

  /// custom action
  final bool customAction;

  /// external id
  final String? externalId;

  /// created session id
  final String? createdSessionId;

  /// created user id
  final String? createdUserId;

  /// abandon at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? abandonAt;

  /// fromJson
  static SignUp fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SignUpToJson(this);

  /// is [field] required?
  bool requires(Field field) => requiredFields.contains(field);

  /// is [field] optional?
  bool optional(Field field) => optionalFields.contains(field);

  /// is [field] missing?
  bool missing(Field field) => missingFields.contains(field);

  /// is [field] unverified?
  bool unverified(Field field) => unverifiedFields.contains(field);
}
