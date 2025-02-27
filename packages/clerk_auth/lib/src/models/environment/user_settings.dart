import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/environment.dart';
import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_settings.g.dart';

/// [UserSettings] Clerk object
@immutable
@JsonSerializable()
class UserSettings {
  /// Constructor
  const UserSettings({
    this.attributes = const {},
    this.signIn = SignInSettings.empty,
    this.signUp = SignUpSettings.empty,
    this.restrictions = Restrictions.empty,
    this.usernameSettings = UsernameSettings.empty,
    this.actions = Actions.empty,
    this.attackProtection = AttackProtection.empty,
    this.passkeySettings = PasskeySettings.empty,
    this.passwordSettings = PasswordSettings.empty,
    this.socialSettings = const {},
    this.saml = false,
  });

  /// sign in settings
  final SignInSettings signIn;

  /// sign up settings
  final SignUpSettings signUp;

  /// restrictions
  final Restrictions restrictions;

  /// username settings
  final UsernameSettings usernameSettings;

  /// actions
  final Actions actions;

  /// attack protection
  final AttackProtection attackProtection;

  /// passkey settings
  final PasskeySettings passkeySettings;

  /// password settings
  final PasswordSettings passwordSettings;

  /// attributes
  @JsonKey(fromJson: _toAttributeMap)
  final Map<UserAttribute, UserAttributeData> attributes;

  /// saml?
  @JsonKey(readValue: _readSamlEnabled)
  final bool saml;

  /// social settings
  @JsonKey(name: 'social')
  final Map<String, SocialConnection> socialSettings;

  /// empty [UserSettings] object
  static const empty = UserSettings();

  /// fromJson
  static UserSettings fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);

  @override
  String toString() => '${describeIdentity()}{'
      'attributes: $attributes, '
      'signIn: $signIn, '
      'signUp: $signUp, '
      'restrictions: $restrictions, '
      'usernameSettings: $usernameSettings, '
      'actions: $actions, '
      'attackProtection: $attackProtection, '
      'passkeySettings: $passkeySettings, '
      'passwordSettings: $passwordSettings, '
      'socialSettings: $socialSettings, '
      'saml: $saml'
      '}';
}

bool _readSamlEnabled(map, _) => map['saml']?['enabled'] == true;

Map<UserAttribute, UserAttributeData> _toAttributeMap(dynamic data) {
  final result = <UserAttribute, UserAttributeData>{};
  if (data case Map<String, dynamic> data) {
    for (final entry in data.entries) {
      final key = UserAttribute.values.firstWhereOrNull(
        (a) => a.toString() == entry.key,
      );
      if (key case UserAttribute key) {
        result[key] = UserAttributeData.fromJson(entry.value);
      }
    }
  }
  return result;
}
