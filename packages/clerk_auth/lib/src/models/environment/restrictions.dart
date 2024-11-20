import 'package:json_annotation/json_annotation.dart';

part 'restrictions.g.dart';

@JsonSerializable()
class Restrictions {
  const Restrictions({
    this.allowlistEnabled = false,
    this.blocklistEnabled = false,
    this.blockEmailSubaddresses = false,
    this.blockDisposableEmailDomains = false,
    this.ignoreDotsForEmailAddresses = false,
  });

  static const empty = Restrictions();

  @JsonKey(name: 'allowlist', readValue: _readStatus)
  final bool allowlistEnabled;

  @JsonKey(name: 'blocklist', readValue: _readStatus)
  final bool blocklistEnabled;

  @JsonKey(name: 'block_email_subaddresses', readValue: _readStatus)
  final bool blockEmailSubaddresses;

  @JsonKey(name: 'block_disposable_email_domains', readValue: _readStatus)
  final bool blockDisposableEmailDomains;

  @JsonKey(name: 'ignore_dots_for_email_addresses', readValue: _readStatus)
  final bool ignoreDotsForEmailAddresses;

  static Restrictions fromJson(Map<String, dynamic> json) =>
      _$RestrictionsFromJson(json);

  Map<String, dynamic> toJson() => _$RestrictionsToJson(this);
}

bool _readStatus(map, name) => map[name]?['enabled'] == true;
