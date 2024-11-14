import 'package:json_annotation/json_annotation.dart';

import '../environment.dart';

part 'organization_settings.g.dart';

@JsonSerializable()
class OrganizationSettings {
  const OrganizationSettings({
    this.maxAllowedMemberships = 0,
    this.creatorRole = '',
    this.actions = OrganizationActions.empty,
    this.domains = OrganizationDomains.empty,
    this.isEnabled = false,
  });

  static const empty = OrganizationSettings();

  final int maxAllowedMemberships;
  final String creatorRole;
  final OrganizationDomains domains;
  final OrganizationActions actions;

  @JsonKey(name: 'enabled')
  final bool isEnabled;

  static OrganizationSettings fromJson(Map<String, dynamic> json) =>
      _$OrganizationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationSettingsToJson(this);
}
