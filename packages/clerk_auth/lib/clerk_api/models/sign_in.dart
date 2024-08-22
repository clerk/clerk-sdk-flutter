import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'sign_in.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SignIn {
  final String id;
  final Status status;
  final List<String> supportedIdentifiers;
  final String identifier;
  final User userData;
  final List<Factor> supportedFirstFactors;
  final Verification firstVerification;
  final List<Factor> supportedSecondFactors;
  final Verification secondVerification;
  final String createdSessionId;
  final int abandonAt;

  const SignIn({
    required this.id,
    required this.status,
    required this.supportedIdentifiers,
    required this.identifier,
    required this.userData,
    required this.supportedFirstFactors,
    required this.firstVerification,
    required this.supportedSecondFactors,
    required this.secondVerification,
    required this.createdSessionId,
    required this.abandonAt,
  });

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  Map<String, dynamic> toJson() => _$SignInToJson(this);
}
