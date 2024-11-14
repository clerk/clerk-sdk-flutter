import 'package:json_annotation/json_annotation.dart';

part 'organization_actions.g.dart';

@JsonSerializable()
class OrganizationActions {
  const OrganizationActions({
    this.adminDelete = false,
  });

  static const empty = OrganizationActions();

  final bool adminDelete;

  static OrganizationActions fromJson(Map<String, dynamic> json) =>
      _$OrganizationActionsFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationActionsToJson(this);
}
