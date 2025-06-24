import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
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
  @JsonKey(name: 'allowlist', readValue: readEnabled)
  final bool allowlistEnabled;

  /// block list enabled?
  @JsonKey(name: 'blocklist', readValue: readEnabled)
  final bool blocklistEnabled;

  /// block email subaddresses?
  @JsonKey(name: 'block_email_subaddresses', readValue: readEnabled)
  final bool blockEmailSubaddresses;

  /// block disposable email domains?
  @JsonKey(name: 'block_disposable_email_domains', readValue: readEnabled)
  final bool blockDisposableEmailDomains;

  /// ignore dots for email addresses?
  @JsonKey(name: 'ignore_dots_for_email_addresses', readValue: readEnabled)
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
