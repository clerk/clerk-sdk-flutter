import 'package:json_annotation/json_annotation.dart';

import '../helpers.dart';
import '../strategy.dart';

part 'social_connection.g.dart';

/// [SocialConnection] Clerk object
@JsonSerializable()
class SocialConnection {
  /// Constructor
  const SocialConnection({
    this.isEnabled = false,
    this.isRequired = false,
    this.authenticatable = false,
    this.blockEmailSubaddresses = false,
    this.strategy = Strategy.admin,
    this.notSelectable = false,
    this.deprecated = false,
    this.name = '',
    this.logoUrl = '',
  });

  /// name
  final String name;

  /// url of logo
  final String logoUrl;

  /// strategy for this connection
  final Strategy strategy;

  /// is enabled?
  @JsonKey(name: 'enabled', fromJson: isTrue)
  final bool isEnabled;

  /// is required?
  @JsonKey(name: 'required', fromJson: isTrue)
  final bool isRequired;

  /// authenticatable?
  @JsonKey(name: 'authenticatable', fromJson: isTrue)
  final bool authenticatable;

  /// block email subaddresses?
  @JsonKey(name: 'block_email_subaddresses', fromJson: isTrue)
  final bool blockEmailSubaddresses;

  /// non-selectable?
  @JsonKey(name: 'non_selectable', fromJson: isTrue)
  final bool notSelectable;

  /// deprecated?
  @JsonKey(name: 'deprecated', fromJson: isTrue)
  final bool deprecated;

  /// empty [SocialConnection] object
  static const empty = SocialConnection();

  /// fromJson
  static SocialConnection fromJson(Map<String, dynamic> json) =>
      _$SocialConnectionFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SocialConnectionToJson(this);
}
