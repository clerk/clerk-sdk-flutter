import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../environment.dart';

part 'organization_settings.g.dart';

/// [OrganizationSettings] Clerk object
@immutable
@JsonSerializable()
class OrganizationSettings with InformativeToStringMixin {
  /// Constructor
  const OrganizationSettings({
    this.maxAllowedMemberships = 0,
    this.creatorRole = '',
    this.actions = OrganizationActions.empty,
    this.domains = OrganizationDomains.empty,
    this.isEnabled = false,
  });

  /// max allowed memberships
  final int maxAllowedMemberships;

  /// creator role
  final String creatorRole;

  /// organization domains
  final OrganizationDomains domains;

  /// organization actions
  final OrganizationActions actions;

  /// empty [OrganizationSettings]
  static const empty = OrganizationSettings();

  /// is enabled?
  @JsonKey(name: 'enabled')
  final bool isEnabled;

  /// fromJson
  static OrganizationSettings fromJson(Map<String, dynamic> json) =>
      _$OrganizationSettingsFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$OrganizationSettingsToJson(this);
}
