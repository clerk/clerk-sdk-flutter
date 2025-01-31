import 'package:clerk_auth/src/models/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'display_config.g.dart';

/// Display Configuration
///
@JsonSerializable()
class DisplayConfig {
  /// Constructs an instance of [DisplayConfig]
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
    this.faviconUrl = '',
    this.googleOneTapClientId = '',
    this.helpUrl = '',
    this.homeUrl = '',
    this.instanceEnvironmentType = InstanceType.unknown,
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

  /// id
  final String id;

  /// application name
  final String applicationName;

  /// branded?
  final bool branded;

  /// experimental force oAuth first?
  final bool experimentalForceOauthFirst;

  /// show dev-mode warning?
  final bool showDevmodeWarning;

  /// after create organization url
  final String? afterCreateOrganizationUrl;

  /// after leave organization url
  final String? afterLeaveOrganizationUrl;

  /// after sign in url
  final String? afterSignInUrl;

  /// after sign out all url
  final String? afterSignOutAllUrl;

  /// after sign out one url
  final String? afterSignOutOneUrl;

  /// after sign up url
  final String? afterSignUpUrl;

  /// after switch session url
  final String? afterSwitchSessionUrl;

  /// captcha provider
  final String? captchaProvider;

  /// captcha public key invisible
  final String? captchaPublicKeyInvisible;

  /// captcha public key
  final String? captchaPublicKey;

  /// captcha widget type
  final String? captchaWidgetType;

  /// clerk js version
  final String? clerkJsVersion;

  /// create organization url
  final String? createOrganizationUrl;

  /// favicon image url
  final String? faviconImageUrl;

  /// favicon url
  final String? faviconUrl;

  /// google one tap client id
  final String? googleOneTapClientId;

  /// help url
  final String? helpUrl;

  /// home url
  final String? homeUrl;

  /// instance environment type
  final InstanceType instanceEnvironmentType;

  /// logo image url
  final String? logoImageUrl;

  /// logo link url
  final String? logoLinkUrl;

  /// logo url
  final String? logoUrl;

  /// organization profile url
  final String? organizationProfileUrl;

  /// preferred sign in strategy
  final String? preferredSignInStrategy;

  /// privacy policy url
  final String? privacyPolicyUrl;

  /// sign in url
  final String? signInUrl;

  /// sign up url
  final String? signUpUrl;

  /// support email
  final String? supportEmail;

  /// terms url
  final String? termsUrl;

  /// user profile url
  final String? userProfileUrl;

  /// empty [DisplayConfig]
  static const empty = DisplayConfig();

  /// fromJson
  static DisplayConfig fromJson(Map<String, dynamic> json) =>
      _$DisplayConfigFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$DisplayConfigToJson(this);
}
