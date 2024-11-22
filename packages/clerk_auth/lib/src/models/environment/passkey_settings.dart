import 'package:json_annotation/json_annotation.dart';

part 'passkey_settings.g.dart';

/// [PasskeySettings] Clerk object
@JsonSerializable()
class PasskeySettings {
  /// Constructor
  const PasskeySettings({
    this.allowAutofill = false,
    this.showSignInButton = false,
  });

  /// allow autofill?
  final bool allowAutofill;

  /// show sign in button?
  final bool showSignInButton;

  /// empty [PasskeySettings]
  static const empty = PasskeySettings();

  /// fromJson
  static PasskeySettings fromJson(Map<String, dynamic> json) =>
      _$PasskeySettingsFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$PasskeySettingsToJson(this);
}
