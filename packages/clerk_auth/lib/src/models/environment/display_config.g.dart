// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayConfig _$DisplayConfigFromJson(Map<String, dynamic> json) =>
    DisplayConfig(
      id: json['id'] as String? ?? '',
      applicationName: json['application_name'] as String? ?? '',
      branded: json['branded'] as bool? ?? false,
      experimentalForceOauthFirst:
          json['experimental_force_oauth_first'] as bool? ?? false,
      showDevmodeWarning: json['show_devmode_warning'] as bool? ?? false,
      afterCreateOrganizationUrl:
          json['after_create_organization_url'] as String? ?? '',
      afterLeaveOrganizationUrl:
          json['after_leave_organization_url'] as String? ?? '',
      afterSignInUrl: json['after_sign_in_url'] as String? ?? '',
      afterSignOutAllUrl: json['after_sign_out_all_url'] as String? ?? '',
      afterSignOutOneUrl: json['after_sign_out_one_url'] as String? ?? '',
      afterSignUpUrl: json['after_sign_up_url'] as String? ?? '',
      afterSwitchSessionUrl: json['after_switch_session_url'] as String? ?? '',
      captchaProvider: json['captcha_provider'] as String? ?? '',
      captchaPublicKeyInvisible:
          json['captcha_public_key_invisible'] as String? ?? '',
      captchaPublicKey: json['captcha_public_key'] as String? ?? '',
      captchaWidgetType: json['captcha_widget_type'] as String? ?? '',
      clerkJsVersion: json['clerk_js_version'] as String? ?? '',
      createOrganizationUrl: json['create_organization_url'] as String? ?? '',
      faviconImageUrl: json['favicon_image_url'] as String? ?? '',
      faviconUrl: json['favicon_url'] as String? ?? '',
      googleOneTapClientId: json['google_one_tap_client_id'] as String? ?? '',
      helpUrl: json['help_url'] as String? ?? '',
      homeUrl: json['home_url'] as String? ?? '',
      instanceEnvironmentType: $enumDecodeNullable(
              _$InstanceTypeEnumMap, json['instance_environment_type']) ??
          InstanceType.unknown,
      logoImageUrl: json['logo_image_url'] as String? ?? '',
      logoLinkUrl: json['logo_link_url'] as String? ?? '',
      logoUrl: json['logo_url'] as String? ?? '',
      organizationProfileUrl: json['organization_profile_url'] as String? ?? '',
      preferredSignInStrategy:
          json['preferred_sign_in_strategy'] as String? ?? '',
      privacyPolicyUrl: json['privacy_policy_url'] as String? ?? '',
      signInUrl: json['sign_in_url'] as String? ?? '',
      signUpUrl: json['sign_up_url'] as String? ?? '',
      supportEmail: json['support_email'] as String? ?? '',
      termsUrl: json['terms_url'] as String? ?? '',
      userProfileUrl: json['user_profile_url'] as String? ?? '',
    );

Map<String, dynamic> _$DisplayConfigToJson(DisplayConfig instance) =>
    <String, dynamic>{
      'id': instance.id,
      'application_name': instance.applicationName,
      'branded': instance.branded,
      'experimental_force_oauth_first': instance.experimentalForceOauthFirst,
      'show_devmode_warning': instance.showDevmodeWarning,
      if (instance.afterCreateOrganizationUrl case final value?)
        'after_create_organization_url': value,
      if (instance.afterLeaveOrganizationUrl case final value?)
        'after_leave_organization_url': value,
      if (instance.afterSignInUrl case final value?) 'after_sign_in_url': value,
      if (instance.afterSignOutAllUrl case final value?)
        'after_sign_out_all_url': value,
      if (instance.afterSignOutOneUrl case final value?)
        'after_sign_out_one_url': value,
      if (instance.afterSignUpUrl case final value?) 'after_sign_up_url': value,
      if (instance.afterSwitchSessionUrl case final value?)
        'after_switch_session_url': value,
      if (instance.captchaProvider case final value?) 'captcha_provider': value,
      if (instance.captchaPublicKeyInvisible case final value?)
        'captcha_public_key_invisible': value,
      if (instance.captchaPublicKey case final value?)
        'captcha_public_key': value,
      if (instance.captchaWidgetType case final value?)
        'captcha_widget_type': value,
      if (instance.clerkJsVersion case final value?) 'clerk_js_version': value,
      if (instance.createOrganizationUrl case final value?)
        'create_organization_url': value,
      if (instance.faviconImageUrl case final value?)
        'favicon_image_url': value,
      if (instance.faviconUrl case final value?) 'favicon_url': value,
      if (instance.googleOneTapClientId case final value?)
        'google_one_tap_client_id': value,
      if (instance.helpUrl case final value?) 'help_url': value,
      if (instance.homeUrl case final value?) 'home_url': value,
      'instance_environment_type':
          _$InstanceTypeEnumMap[instance.instanceEnvironmentType]!,
      if (instance.logoImageUrl case final value?) 'logo_image_url': value,
      if (instance.logoLinkUrl case final value?) 'logo_link_url': value,
      if (instance.logoUrl case final value?) 'logo_url': value,
      if (instance.organizationProfileUrl case final value?)
        'organization_profile_url': value,
      if (instance.preferredSignInStrategy case final value?)
        'preferred_sign_in_strategy': value,
      if (instance.privacyPolicyUrl case final value?)
        'privacy_policy_url': value,
      if (instance.signInUrl case final value?) 'sign_in_url': value,
      if (instance.signUpUrl case final value?) 'sign_up_url': value,
      if (instance.supportEmail case final value?) 'support_email': value,
      if (instance.termsUrl case final value?) 'terms_url': value,
      if (instance.userProfileUrl case final value?) 'user_profile_url': value,
    };

const _$InstanceTypeEnumMap = {
  InstanceType.unknown: 'unknown',
  InstanceType.development: 'development',
  InstanceType.production: 'production',
};
