import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'sign_up.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SignUp {
  final String id;
  final Status status;
  final List<String> requiredFields;
  final List<String> optionalFields;
  final List<String> missingFields;
  final List<String> unverifiedFields;
  final String username;
  final String emailAddress;
  final String phoneNumber;
  final String web3Wallet;
  final String passwordEnabled;
  final String firstName;
  final String lastName;
  final Map<String, dynamic> unsafeMetadata;
  final Map<String, dynamic> publicMetadata;
  final bool customAction;
  final String externalId;
  final String createdSessionId;
  final String createdUserId;
  final int abandonAt;

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

  factory SignUp.fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpToJson(this);
}
