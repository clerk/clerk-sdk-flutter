// ignore_for_file: public_member_api_docs
// See https://clerk.com/docs/reference/frontend-api for
// more details

import 'package:json_annotation/json_annotation.dart';

part 'username_settings.g.dart';

@JsonSerializable()
class UsernameSettings {
  const UsernameSettings({
    this.minLength = 0,
    this.maxLength = 0,
  });

  final int minLength;
  final int maxLength;

  static const empty = UsernameSettings();

  static UsernameSettings fromJson(Map<String, dynamic> json) => _$UsernameSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameSettingsToJson(this);
}
