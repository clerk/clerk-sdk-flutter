// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relying_party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelyingParty _$RelyingPartyFromJson(Map<String, dynamic> json) => RelyingParty(
      id: json['id'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RelyingPartyToJson(RelyingParty instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}
