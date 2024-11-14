// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthConfig _$AuthConfigFromJson(Map<String, dynamic> json) => AuthConfig(
      id: json['id'] as String? ?? '',
      singleSessionMode: json['single_session_mode'] as bool? ?? false,
      enhancedEmailDeliverability:
          json['enhanced_email_deliverability'] as bool? ?? false,
      testMode: json['test_mode'] as bool? ?? false,
      demo: json['demo'] as bool? ?? false,
      cookielessDev: json['cookieless_dev'] as bool? ?? false,
      urlBasedSessionSyncing:
          json['url_based_session_syncing'] as bool? ?? false,
      identificationStrategies:
          (json['identification_strategies'] as List<dynamic>?)
                  ?.map((e) => Strategy.fromJson(e as String))
                  .toList() ??
              const [],
      firstFactors: (json['first_factors'] as List<dynamic>?)
              ?.map((e) => Strategy.fromJson(e as String))
              .toList() ??
          const [],
      secondFactors: (json['second_factors'] as List<dynamic>?)
              ?.map((e) => Strategy.fromJson(e as String))
              .toList() ??
          const [],
      emailAddressVerificationStrategies:
          (json['email_address_verification_strategies'] as List<dynamic>?)
                  ?.map((e) => Strategy.fromJson(e as String))
                  .toList() ??
              const [],
      usesFirstName:
          json['first_name'] == null ? false : isOn(json['first_name']),
      usesLastName: json['last_name'] == null ? false : isOn(json['last_name']),
      usesEmailAddress:
          json['email_address'] == null ? false : isOn(json['email_address']),
      usesPhoneNumber:
          json['phone_number'] == null ? false : isOn(json['phone_number']),
      usesUsername: json['username'] == null ? false : isOn(json['username']),
      usesPassword: json['password'] == null ? false : isOn(json['password']),
    );

Map<String, dynamic> _$AuthConfigToJson(AuthConfig instance) =>
    <String, dynamic>{
      'id': instance.id,
      'single_session_mode': instance.singleSessionMode,
      'enhanced_email_deliverability': instance.enhancedEmailDeliverability,
      'test_mode': instance.testMode,
      'demo': instance.demo,
      'cookieless_dev': instance.cookielessDev,
      'url_based_session_syncing': instance.urlBasedSessionSyncing,
      'identification_strategies':
          instance.identificationStrategies.map((e) => e.toJson()).toList(),
      'first_factors': instance.firstFactors.map((e) => e.toJson()).toList(),
      'second_factors': instance.secondFactors.map((e) => e.toJson()).toList(),
      'email_address_verification_strategies': instance
          .emailAddressVerificationStrategies
          .map((e) => e.toJson())
          .toList(),
      'first_name': instance.usesFirstName,
      'last_name': instance.usesLastName,
      'email_address': instance.usesEmailAddress,
      'phone_number': instance.usesPhoneNumber,
      'username': instance.usesUsername,
      'password': instance.usesPassword,
    };
