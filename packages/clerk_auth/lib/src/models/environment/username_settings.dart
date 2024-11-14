import 'package:json_annotation/json_annotation.dart';

part 'username_settings.g.dart';

@JsonSerializable()
class UsernameSettings {
  const UsernameSettings({
    this.minLength = 0,
    this.maxLength = 0,
  });

  static const empty = UsernameSettings();

  final int minLength;
  final int maxLength;

  static UsernameSettings fromJson(Map<String, dynamic> json) => _$UsernameSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameSettingsToJson(this);
}
