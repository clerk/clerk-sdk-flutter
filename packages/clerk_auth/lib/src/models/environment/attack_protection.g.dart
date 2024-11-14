// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attack_protection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttackProtection _$AttackProtectionFromJson(Map<String, dynamic> json) =>
    AttackProtection(
      userLockout: json['user_lockout'] == null
          ? UserLockout.empty
          : UserLockout.fromJson(json['user_lockout'] as Map<String, dynamic>),
      piiEnabled: _readPiiEnabled(json, 'pii_enabled') as bool? ?? false,
      emailLinkRequireSameClient: _readEmailLinkRequireSameClient(
              json, 'email_link_require_same_client') as bool? ??
          false,
    );

Map<String, dynamic> _$AttackProtectionToJson(AttackProtection instance) =>
    <String, dynamic>{
      'user_lockout': instance.userLockout.toJson(),
      'pii_enabled': instance.piiEnabled,
      'email_link_require_same_client': instance.emailLinkRequireSameClient,
    };

UserLockout _$UserLockoutFromJson(Map<String, dynamic> json) => UserLockout(
      isEnabled: json['enabled'] as bool? ?? false,
      maxAttempts: (json['max_attempts'] as num?)?.toInt() ?? 0,
      duration: json['duration_in_minutes'] == null
          ? Duration.zero
          : _toDuration(json['duration_in_minutes']),
    );

Map<String, dynamic> _$UserLockoutToJson(UserLockout instance) =>
    <String, dynamic>{
      'max_attempts': instance.maxAttempts,
      'enabled': instance.isEnabled,
      'duration_in_minutes': _fromDuration(instance.duration),
    };
