import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'restrictions.g.dart';

/// [Restrictions] Clerk object
@immutable
@JsonSerializable()
class Restrictions with InformativeToStringMixin {
  /// Constructor
  const Restrictions({
    this.allowlistEnabled = false,
    this.blocklistEnabled = false,
    this.blockEmailSubaddresses = false,
    this.blockDisposableEmailDomains = false,
    this.ignoreDotsForEmailAddresses = false,
  });

  /// allow list enabled?
  @JsonKey(name: 'allowlist', readValue: _readStatus)
  final bool allowlistEnabled;

  /// block list enabled?
  @JsonKey(name: 'blocklist', readValue: _readStatus)
  final bool blocklistEnabled;

  /// block email subaddresses?
  @JsonKey(name: 'block_email_subaddresses', readValue: _readStatus)
  final bool blockEmailSubaddresses;

  /// block disposable email domains?
  @JsonKey(name: 'block_disposable_email_domains', readValue: _readStatus)
  final bool blockDisposableEmailDomains;

  /// ignore dots for email addresses?
  @JsonKey(name: 'ignore_dots_for_email_addresses', readValue: _readStatus)
  final bool ignoreDotsForEmailAddresses;

  /// empty [Restrictions]
  static const empty = Restrictions();

  /// fromJson
  static Restrictions fromJson(Map<String, dynamic> json) =>
      _$RestrictionsFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$RestrictionsToJson(this);
}

bool _readStatus(map, name) => map[name]?['enabled'] == true;
