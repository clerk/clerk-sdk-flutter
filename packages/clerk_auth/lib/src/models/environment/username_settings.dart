import 'package:json_annotation/json_annotation.dart';

part 'username_settings.g.dart';

/// [UsernameSettings] Clerk object
@JsonSerializable()
class UsernameSettings {
  /// Constructor
  const UsernameSettings({
    this.minLength = 0,
    this.maxLength = 0,
  });

  /// minimum length of username
  final int minLength;

  /// maximum length of username
  final int maxLength;

  /// empty [UsernameSettings] object
  static const empty = UsernameSettings();

  /// fromJson
  static UsernameSettings fromJson(Map<String, dynamic> json) =>
      _$UsernameSettingsFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$UsernameSettingsToJson(this);
}
