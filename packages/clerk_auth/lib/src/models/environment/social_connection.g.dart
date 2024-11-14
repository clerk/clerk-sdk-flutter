// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialConnection _$SocialConnectionFromJson(Map<String, dynamic> json) =>
    SocialConnection(
      isEnabled: json['enabled'] == null ? false : isTrue(json['enabled']),
      isRequired: json['required'] == null ? false : isTrue(json['required']),
      authenticatable: json['authenticatable'] == null
          ? false
          : isTrue(json['authenticatable']),
      blockEmailSubaddresses: json['block_email_subaddresses'] == null
          ? false
          : isTrue(json['block_email_subaddresses']),
      strategy: json['strategy'] == null
          ? Strategy.admin
          : Strategy.fromJson(json['strategy'] as String),
      notSelectable: json['non_selectable'] == null
          ? false
          : isTrue(json['non_selectable']),
      deprecated:
          json['deprecated'] == null ? false : isTrue(json['deprecated']),
      name: json['name'] as String? ?? '',
      logoUrl: json['logo_url'] as String? ?? '',
    );

Map<String, dynamic> _$SocialConnectionToJson(SocialConnection instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'strategy': instance.strategy.toJson(),
      'enabled': instance.isEnabled,
      'required': instance.isRequired,
      'authenticatable': instance.authenticatable,
      'block_email_subaddresses': instance.blockEmailSubaddresses,
      'non_selectable': instance.notSelectable,
      'deprecated': instance.deprecated,
    };
