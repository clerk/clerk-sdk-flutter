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
      faviconImage: json['favicon_image'] as String? ?? '',
      faviconUrl: json['favicon_url'] as String? ?? '',
      googleOneTapClientId: json['google_one_tap_client_id'] as String? ?? '',
      helpUrl: json['help_url'] as String? ?? '',
      homeUrl: json['home_url'] as String? ?? '',
      instanceEnvironmentType:
          json['instance_environment_type'] as String? ?? '',
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

Map<String, dynamic> _$DisplayConfigToJson(DisplayConfig instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'application_name': instance.applicationName,
    'branded': instance.branded,
    'experimental_force_oauth_first': instance.experimentalForceOauthFirst,
    'show_devmode_warning': instance.showDevmodeWarning,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'after_create_organization_url', instance.afterCreateOrganizationUrl);
  writeNotNull(
      'after_leave_organization_url', instance.afterLeaveOrganizationUrl);
  writeNotNull('after_sign_in_url', instance.afterSignInUrl);
  writeNotNull('after_sign_out_all_url', instance.afterSignOutAllUrl);
  writeNotNull('after_sign_out_one_url', instance.afterSignOutOneUrl);
  writeNotNull('after_sign_up_url', instance.afterSignUpUrl);
  writeNotNull('after_switch_session_url', instance.afterSwitchSessionUrl);
  writeNotNull('captcha_provider', instance.captchaProvider);
  writeNotNull(
      'captcha_public_key_invisible', instance.captchaPublicKeyInvisible);
  writeNotNull('captcha_public_key', instance.captchaPublicKey);
  writeNotNull('captcha_widget_type', instance.captchaWidgetType);
  writeNotNull('clerk_js_version', instance.clerkJsVersion);
  writeNotNull('create_organization_url', instance.createOrganizationUrl);
  writeNotNull('favicon_image_url', instance.faviconImageUrl);
  writeNotNull('favicon_image', instance.faviconImage);
  writeNotNull('favicon_url', instance.faviconUrl);
  writeNotNull('google_one_tap_client_id', instance.googleOneTapClientId);
  writeNotNull('help_url', instance.helpUrl);
  writeNotNull('home_url', instance.homeUrl);
  writeNotNull('instance_environment_type', instance.instanceEnvironmentType);
  writeNotNull('logo_image_url', instance.logoImageUrl);
  writeNotNull('logo_link_url', instance.logoLinkUrl);
  writeNotNull('logo_url', instance.logoUrl);
  writeNotNull('organization_profile_url', instance.organizationProfileUrl);
  writeNotNull('preferred_sign_in_strategy', instance.preferredSignInStrategy);
  writeNotNull('privacy_policy_url', instance.privacyPolicyUrl);
  writeNotNull('sign_in_url', instance.signInUrl);
  writeNotNull('sign_up_url', instance.signUpUrl);
  writeNotNull('support_email', instance.supportEmail);
  writeNotNull('terms_url', instance.termsUrl);
  writeNotNull('user_profile_url', instance.userProfileUrl);
  return val;
}
