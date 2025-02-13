import 'package:clerk_auth/src/models/client/field.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
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
    required this.verifications,
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
  @JsonKey(fromJson: toFieldList)
  final List<Field> requiredFields;

  /// optional fields
  @JsonKey(fromJson: toFieldList)
  final List<Field> optionalFields;

  /// missing fields
  @JsonKey(fromJson: toFieldList)
  final List<Field> missingFields;

  /// unverified fields
  @JsonKey(fromJson: toFieldList)
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

  /// verifications
  @JsonKey(fromJson: _toFieldVerificationMap, toJson: _fromFieldVerificationMap)
  final Map<Field, Verification> verifications;

  /// custom action
  final bool customAction;

  /// external id
  final String? externalId;

  /// created session id
  final String? createdSessionId;

  /// created user id
  final String? createdUserId;

  /// abandon at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime abandonAt;

  /// fromJson
  static SignUp fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SignUpToJson(this);

  /// is [field] required?
  bool requires(Field? field) => requiredFields.contains(field);

  /// is [field] optional?
  bool optional(Field? field) => optionalFields.contains(field);

  /// is [field] missing?
  bool missing(Field? field) => missingFields.contains(field);

  /// is [field] unverified?
  bool unverified(Field? field) => unverifiedFields.contains(field);
}

Map<Field, Verification> _toFieldVerificationMap(dynamic data) {
  final map = <Field, Verification>{};
  if (data case Map<String, dynamic> json) {
    for (final entry in json.entries) {
      if (entry.value case Map<String, dynamic> verificationJson) {
        map[Field(name: entry.key)] = Verification.fromJson(verificationJson);
      }
    }
  }
  return map;
}

Map<String, dynamic> _fromFieldVerificationMap(dynamic data) {
  final map = <String, dynamic>{};
  if (data case Map<Field, Verification> verifications) {
    for (final entry in verifications.entries) {
      map[entry.key.name] = entry.value.toJson();
    }
  }
  return map;
}
