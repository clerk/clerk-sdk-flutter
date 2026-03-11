import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'relying_party.g.dart';

/// [RelyingParty] Clerk object
@immutable
@JsonSerializable()
class RelyingParty with InformativeToStringMixin {
  /// Constructor
  const RelyingParty({
    required this.id,
    this.name,
  });

  /// id
  final String id;

  /// name
  final String? name;

  /// fromJson
  static RelyingParty fromJson(Map<String, dynamic> json) =>
      _$RelyingPartyFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$RelyingPartyToJson(this);
}
