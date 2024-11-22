import 'package:json_annotation/json_annotation.dart';

part 'organization_actions.g.dart';

@JsonSerializable()

/// [OrganizationActions] Clerk object
class OrganizationActions {
  /// Constructor
  const OrganizationActions({
    this.adminDelete = false,
  });

  /// can admin delete?
  final bool adminDelete;

  /// empty [OrganizationActions]
  static const empty = OrganizationActions();

  /// fromJson
  static OrganizationActions fromJson(Map<String, dynamic> json) =>
      _$OrganizationActionsFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$OrganizationActionsToJson(this);
}
