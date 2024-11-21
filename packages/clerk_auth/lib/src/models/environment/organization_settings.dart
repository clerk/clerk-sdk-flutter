// ignore_for_file: public_member_api_docs
// See https://clerk.com/docs/reference/frontend-api for
// more details

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

  final int maxAllowedMemberships;
  final String creatorRole;
  final OrganizationDomains domains;
  final OrganizationActions actions;

  static const empty = OrganizationSettings();

  @JsonKey(name: 'enabled')
  final bool isEnabled;

  static OrganizationSettings fromJson(Map<String, dynamic> json) =>
      _$OrganizationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationSettingsToJson(this);
}
