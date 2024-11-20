import 'package:json_annotation/json_annotation.dart';

import '../enums.dart';

part 'organization_domains.g.dart';

@JsonSerializable()
class OrganizationDomains {
  const OrganizationDomains({
    this.defaultRole = '',
    this.enrollmentModes = const [],
    this.isEnabled = false,
  });

  final String defaultRole;
  final List<EnrollmentMode> enrollmentModes;

  static const empty = OrganizationDomains();

  @JsonKey(name: 'enabled')
  final bool isEnabled;

  static OrganizationDomains fromJson(Map<String, dynamic> json) =>
      _$OrganizationDomainsFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationDomainsToJson(this);
}
