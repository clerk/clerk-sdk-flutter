import 'package:clerk_auth/clerk_auth.dart';
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_settings.g.dart';

@JsonSerializable()
class UserSettings {
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

  static const empty = UserSettings();

  final SignInSettings signIn;
  final SignUpSettings signUp;
  final Restrictions restrictions;
  final UsernameSettings usernameSettings;
  final Actions actions;
  final AttackProtection attackProtection;
  final PasskeySettings passkeySettings;
  final PasswordSettings passwordSettings;

  @JsonKey(fromJson: _toAttributeMap)
  final Map<UserAttribute, UserAttributeData> attributes;

  @JsonKey(readValue: _readSamlEnabled)
  final bool saml;

  @JsonKey(name: 'social')
  final Map<String, SocialConnection> socialSettings;

  static UserSettings fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}

bool _readSamlEnabled(map, _) => map['saml']?['enabled'] == true;

Map<UserAttribute, UserAttributeData> _toAttributeMap(dynamic data) {
  final result = <UserAttribute, UserAttributeData>{};
  if (data case Map<String, dynamic> data) {
    for (final entry in data.entries) {
      final key = UserAttribute.values.firstWhereOrNull((a) => a.toString() == entry.key);
      if (key case UserAttribute key) result[key] = UserAttributeData.fromJson(entry.value);
    }
  }
  return result;
}
