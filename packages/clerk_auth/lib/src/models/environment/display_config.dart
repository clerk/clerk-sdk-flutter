import 'package:json_annotation/json_annotation.dart';

part 'display_config.g.dart';

@JsonSerializable()
class DisplayConfig {
  const DisplayConfig({
    this.id = '',
    this.applicationName = '',
    this.branded = false,
    this.experimentalForceOauthFirst = false,
    this.showDevmodeWarning = false,
    this.afterCreateOrganizationUrl = '',
    this.afterLeaveOrganizationUrl = '',
    this.afterSignInUrl = '',
    this.afterSignOutAllUrl = '',
    this.afterSignOutOneUrl = '',
    this.afterSignUpUrl = '',
    this.afterSwitchSessionUrl = '',
    this.captchaProvider = '',
    this.captchaPublicKeyInvisible = '',
    this.captchaPublicKey = '',
    this.captchaWidgetType = '',
    this.clerkJsVersion = '',
    this.createOrganizationUrl = '',
    this.faviconImageUrl = '',
    this.faviconImage = '',
    this.faviconUrl = '',
    this.googleOneTapClientId = '',
    this.helpUrl = '',
    this.homeUrl = '',
    this.instanceEnvironmentType = '',
    this.logoImageUrl = '',
    this.logoLinkUrl = '',
    this.logoUrl = '',
    this.organizationProfileUrl = '',
    this.preferredSignInStrategy = '',
    this.privacyPolicyUrl = '',
    this.signInUrl = '',
    this.signUpUrl = '',
    this.supportEmail = '',
    this.termsUrl = '',
    this.userProfileUrl = '',
  });

  static const empty = DisplayConfig();

  final String id;
  final String applicationName;
  final bool branded;
  final bool experimentalForceOauthFirst;
  final bool showDevmodeWarning;
  final String? afterCreateOrganizationUrl;
  final String? afterLeaveOrganizationUrl;
  final String? afterSignInUrl;
  final String? afterSignOutAllUrl;
  final String? afterSignOutOneUrl;
  final String? afterSignUpUrl;
  final String? afterSwitchSessionUrl;
  final String? captchaProvider;
  final String? captchaPublicKeyInvisible;
  final String? captchaPublicKey;
  final String? captchaWidgetType;
  final String? clerkJsVersion;
  final String? createOrganizationUrl;
  final String? faviconImageUrl;
  final String? faviconImage;
  final String? faviconUrl;
  final String? googleOneTapClientId;
  final String? helpUrl;
  final String? homeUrl;
  final String? instanceEnvironmentType;
  final String? logoImageUrl;
  final String? logoLinkUrl;
  final String? logoUrl;
  final String? organizationProfileUrl;
  final String? preferredSignInStrategy;
  final String? privacyPolicyUrl;
  final String? signInUrl;
  final String? signUpUrl;
  final String? supportEmail;
  final String? termsUrl;
  final String? userProfileUrl;

  static DisplayConfig fromJson(Map<String, dynamic> json) => _$DisplayConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayConfigToJson(this);
}
