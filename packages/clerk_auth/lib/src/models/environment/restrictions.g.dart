// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restrictions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restrictions _$RestrictionsFromJson(Map<String, dynamic> json) => Restrictions(
      allowlistEnabled: readEnabled(json, 'allowlist') as bool? ?? false,
      blocklistEnabled: readEnabled(json, 'blocklist') as bool? ?? false,
      blockEmailSubaddresses:
          readEnabled(json, 'block_email_subaddresses') as bool? ?? false,
      blockDisposableEmailDomains:
          readEnabled(json, 'block_disposable_email_domains') as bool? ?? false,
      ignoreDotsForEmailAddresses:
          readEnabled(json, 'ignore_dots_for_email_addresses') as bool? ??
              false,
    );

Map<String, dynamic> _$RestrictionsToJson(Restrictions instance) =>
    <String, dynamic>{
      'allowlist': instance.allowlistEnabled,
      'blocklist': instance.blocklistEnabled,
      'block_email_subaddresses': instance.blockEmailSubaddresses,
      'block_disposable_email_domains': instance.blockDisposableEmailDomains,
      'ignore_dots_for_email_addresses': instance.ignoreDotsForEmailAddresses,
    };
