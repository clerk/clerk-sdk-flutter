import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../enums.dart';

part 'domain_settings.g.dart';

/// [DomainSettings] Clerk object
@immutable
@JsonSerializable()
class DomainSettings with InformativeToStringMixin {
  /// Constructor
  const DomainSettings({
    this.defaultRole = '',
    this.enrollmentModes = const [],
    this.isEnabled = false,
  });

  /// default role
  final String defaultRole;

  /// enrollment modes
  final List<EnrollmentMode> enrollmentModes;

  /// empty [DomainSettings]
  static const empty = DomainSettings();

  /// is enabled?
  @JsonKey(name: 'enabled')
  final bool isEnabled;

  /// fromJson
  static DomainSettings fromJson(Map<String, dynamic> json) =>
      _$DomainSettingsFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$DomainSettingsToJson(this);
}
