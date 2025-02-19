import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_public.g.dart';

/// [UserPublic] Clerk object
@immutable
@JsonSerializable()
class UserPublic {
  /// Constructor
  const UserPublic({
    required this.identifier,
    required this.firstName,
    required this.lastName,
    required this.profileImageUrl,
    required this.imageUrl,
    required this.hasImage,
  });

  /// identifier
  final String identifier;

  /// first name
  final String? firstName;

  /// last name
  final String? lastName;

  /// profile image url
  final String? profileImageUrl;

  /// image url
  final String? imageUrl;

  /// has image?
  @JsonKey(defaultValue: false)
  final bool hasImage;

  /// fromJson
  static UserPublic fromJson(Map<String, dynamic> json) =>
      _$UserPublicFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$UserPublicToJson(this);
}
