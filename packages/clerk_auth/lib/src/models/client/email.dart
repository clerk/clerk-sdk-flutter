import 'package:clerk_auth/src/models/client/user_identifying_data.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'email.g.dart';

/// [Email] Clerk object
@immutable
@JsonSerializable()
class Email extends UserIdentifyingData {
  /// Constructor
  const Email({
    required super.id,
    required super.verification,
    required this.emailAddress,
    required this.reserved,
    required this.updatedAt,
    required this.createdAt,
  }) : super(type: IdentifierType.emailAddress);

  /// email address
  final String emailAddress;

  /// reserved?
  final bool reserved;

  /// updated at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime createdAt;

  @override
  String get identifier => emailAddress;

  /// fromJson
  static Email fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$EmailToJson(this);
}
