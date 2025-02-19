import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../enums.dart';

part 'organization_domains.g.dart';

/// [OrganizationDomains] Clerk object
@immutable
@JsonSerializable()
class OrganizationDomains {
  /// Constructor
  const OrganizationDomains({
    this.defaultRole = '',
    this.enrollmentModes = const [],
    this.isEnabled = false,
  });

  /// default role
  final String defaultRole;

  /// enrollment modes
  final List<EnrollmentMode> enrollmentModes;

  /// empty [OrganizationDomains]
  static const empty = OrganizationDomains();

  /// is enabled?
  @JsonKey(name: 'enabled')
  final bool isEnabled;

  /// fromJson
  static OrganizationDomains fromJson(Map<String, dynamic> json) =>
      _$OrganizationDomainsFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$OrganizationDomainsToJson(this);
}
