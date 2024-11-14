// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actions _$ActionsFromJson(Map<String, dynamic> json) => Actions(
      deleteSelf: json['delete_self'] as bool? ?? false,
      createOrganization: json['create_organization'] as bool? ?? false,
      createOrganizationsLimit:
          (json['create_organizations_limit'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ActionsToJson(Actions instance) {
  final val = <String, dynamic>{
    'delete_self': instance.deleteSelf,
    'create_organization': instance.createOrganization,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create_organizations_limit', instance.createOrganizationsLimit);
  return val;
}
