// ignore_for_file: public_member_api_docs
// See https://clerk.com/docs/reference/frontend-api for
// more details

import 'package:json_annotation/json_annotation.dart';

part 'organization_actions.g.dart';

@JsonSerializable()
class OrganizationActions {
  const OrganizationActions({
    this.adminDelete = false,
  });

  final bool adminDelete;

  static const empty = OrganizationActions();

  static OrganizationActions fromJson(Map<String, dynamic> json) =>
      _$OrganizationActionsFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationActionsToJson(this);
}
