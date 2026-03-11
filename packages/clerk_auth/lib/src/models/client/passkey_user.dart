import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'passkey_user.g.dart';

/// [PasskeyUser] Clerk object
@immutable
@JsonSerializable()
class PasskeyUser with InformativeToStringMixin {
  /// Constructor
  const PasskeyUser({
    required this.id,
    required this.name,
    required this.displayName,
  });

  /// id
  final String id;

  /// name
  final String name;

  /// display name
  final String displayName;

  /// fromJson
  static PasskeyUser fromJson(Map<String, dynamic> json) =>
      _$PasskeyUserFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$PasskeyUserToJson(this);
}
