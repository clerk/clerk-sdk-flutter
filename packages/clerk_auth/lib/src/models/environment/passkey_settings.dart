// ignore_for_file: public_member_api_docs
// See https://clerk.com/docs/reference/frontend-api for
// more details

import 'package:json_annotation/json_annotation.dart';

part 'passkey_settings.g.dart';

@JsonSerializable()
class PasskeySettings {
  const PasskeySettings({
    this.allowAutofill = false,
    this.showSignInButton = false,
  });

  final bool allowAutofill;
  final bool showSignInButton;

  static const empty = PasskeySettings();

  static PasskeySettings fromJson(Map<String, dynamic> json) => _$PasskeySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PasskeySettingsToJson(this);
}
