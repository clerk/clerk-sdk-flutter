import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'sign_up.g.dart';

@JsonSerializable()
class SignUp {
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

  final String id;
  final Status status;
  final List<Field> requiredFields;
  final List<Field> optionalFields;
  final List<Field> missingFields;
  final List<Field> unverifiedFields;
  final String? username;
  final String? emailAddress;
  final String? phoneNumber;
  final String? web3Wallet;
  final bool passwordEnabled;
  final String? firstName;
  final String? lastName;
  final Map<String, dynamic> unsafeMetadata;
  final Map<String, dynamic> publicMetadata;
  final bool customAction;
  final String? externalId;
  final String? createdSessionId;
  final String? createdUserId;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? abandonAt;

  static SignUp fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpToJson(this);

  bool requires(Field field) => requiredFields.contains(field);

  bool optional(Field field) => optionalFields.contains(field);

  bool missing(Field field) => missingFields.contains(field);

  bool unverified(Field field) => unverifiedFields.contains(field);
}
