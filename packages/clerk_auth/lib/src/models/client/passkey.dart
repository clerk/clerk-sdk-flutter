import 'package:clerk_auth/src/models/client/user_identifying_data.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'passkey.g.dart';

/// [Passkey] Clerk object
@immutable
@JsonSerializable()
class Passkey extends UserIdentifyingData {
  /// Constructor
  const Passkey({
    required super.id,
    required super.verification,
    required this.name,
    required this.lastUsedAt,
    required this.updatedAt,
    required this.createdAt,
  }) : super(type: IdentifierType.passkey);

  /// name
  final String name;

  /// updated at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime updatedAt;

  /// created at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime createdAt;

  /// last used at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime lastUsedAt;

  @override
  String get identifier => name;

  /// fromJson
  static Passkey fromJson(Map<String, dynamic> json) => _$PasskeyFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$PasskeyToJson(this);
}
