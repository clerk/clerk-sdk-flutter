// ignore_for_file: public_member_api_docs
// See https://clerk.com/docs/reference/frontend-api for
// more details

import 'package:json_annotation/json_annotation.dart';

part 'actions.g.dart';

@JsonSerializable()
class Actions {
  const Actions({
    this.deleteSelf = false,
    this.createOrganization = false,
    this.createOrganizationsLimit = 0,
  });

  static const empty = Actions();

  final bool deleteSelf;
  final bool createOrganization;
  final int? createOrganizationsLimit;

  static Actions fromJson(Map<String, dynamic> json) => _$ActionsFromJson(json);

  Map<String, dynamic> toJson() => _$ActionsToJson(this);
}
