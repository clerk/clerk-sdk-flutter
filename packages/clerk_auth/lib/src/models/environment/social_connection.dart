import 'package:json_annotation/json_annotation.dart';

import '../helpers.dart';
import '../strategy.dart';

part 'social_connection.g.dart';

@JsonSerializable()
class SocialConnection {
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

  final String name;
  final String logoUrl;
  final Strategy strategy;

  @JsonKey(name: 'enabled', fromJson: isTrue)
  final bool isEnabled;

  @JsonKey(name: 'required', fromJson: isTrue)
  final bool isRequired;

  @JsonKey(name: 'authenticatable', fromJson: isTrue)
  final bool authenticatable;

  @JsonKey(name: 'block_email_subaddresses', fromJson: isTrue)
  final bool blockEmailSubaddresses;

  @JsonKey(name: 'non_selectable', fromJson: isTrue)
  final bool notSelectable;

  @JsonKey(name: 'deprecated', fromJson: isTrue)
  final bool deprecated;

  static const empty = SocialConnection();

  static SocialConnection fromJson(Map<String, dynamic> json) =>
      _$SocialConnectionFromJson(json);

  Map<String, dynamic> toJson() => _$SocialConnectionToJson(this);
}
