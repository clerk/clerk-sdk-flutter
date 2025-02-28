import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'organization_actions.g.dart';

@immutable
@JsonSerializable()

/// [OrganizationActions] Clerk object
class OrganizationActions with InformativeToStringMixin {
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
  @override
  Map<String, dynamic> toJson() => _$OrganizationActionsToJson(this);
}
