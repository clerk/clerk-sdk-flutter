import 'package:json_annotation/json_annotation.dart';

part 'passkey_settings.g.dart';

@JsonSerializable()
class PasskeySettings {
  const PasskeySettings({
    this.allowAutofill = false,
    this.showSignInButton = false,
  });

  static const empty = PasskeySettings();

  final bool allowAutofill;
  final bool showSignInButton;

  static PasskeySettings fromJson(Map<String, dynamic> json) =>
      _$PasskeySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PasskeySettingsToJson(this);
}
