import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'public_organization_data.g.dart';

/// [PublicOrganizationData] Clerk object
@immutable
@JsonSerializable()
class PublicOrganizationData with InformativeToStringMixin {
  /// Constructor
  const PublicOrganizationData({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageUrl,
    required this.hasImage,
  });

  /// id
  final String id;

  /// name
  final String name;

  /// slug
  final String slug;

  /// image url
  final String imageUrl;

  /// has image
  final bool hasImage;

  /// fromJson
  static PublicOrganizationData fromJson(dynamic json) =>
      _$PublicOrganizationDataFromJson(json as Map<String, dynamic>);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$PublicOrganizationDataToJson(this);
}
