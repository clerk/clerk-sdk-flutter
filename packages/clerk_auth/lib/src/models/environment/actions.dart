import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'actions.g.dart';

/// [Actions] Clerk object
@immutable
@JsonSerializable()
class Actions {
  /// Constructor
  const Actions({
    this.deleteSelf = false,
    this.createOrganization = false,
    this.createOrganizationsLimit = 0,
  });

  /// empty [Actions]
  static const empty = Actions();

  /// can user delete self?
  final bool deleteSelf;

  /// can user create organization?
  final bool createOrganization;

  /// how many organizations can use create?
  final int? createOrganizationsLimit;

  /// create [Actions] from Json
  static Actions fromJson(Map<String, dynamic> json) => _$ActionsFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$ActionsToJson(this);
}
