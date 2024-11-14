// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpSettings _$SignUpSettingsFromJson(Map<String, dynamic> json) =>
    SignUpSettings(
      captchaEnabled: json['captcha_enabled'] as bool? ?? false,
      captchaWidgetType: json['captcha_widget_type'] as String? ?? '',
      customActionRequired: json['custom_action_required'] as bool? ?? false,
      progressive: json['progressive'] as bool? ?? false,
      mode: json['mode'] as String? ?? '',
      legalConsentEnabled: json['legal_consent_enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$SignUpSettingsToJson(SignUpSettings instance) =>
    <String, dynamic>{
      'captcha_enabled': instance.captchaEnabled,
      'captcha_widget_type': instance.captchaWidgetType,
      'custom_action_required': instance.customActionRequired,
      'progressive': instance.progressive,
      'mode': instance.mode,
      'legal_consent_enabled': instance.legalConsentEnabled,
    };
