import 'package:json_annotation/json_annotation.dart';

import '../helpers.dart';

part 'sign_in_settings.g.dart';

@JsonSerializable()
class SignInSettings {
  const SignInSettings({
    this.secondFactorRequired = false,
  });

  @JsonKey(readValue: _readSecondFactorRequired)
  final bool secondFactorRequired;

  static const empty = SignInSettings();

  static SignInSettings fromJson(Map<String, dynamic> json) =>
      _$SignInSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SignInSettingsToJson(this);
}

bool _readSecondFactorRequired(map, _) =>
    isTrue(map['second_factor']?['required']);
