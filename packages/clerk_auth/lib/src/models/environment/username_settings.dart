import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'username_settings.g.dart';

/// [UsernameSettings] Clerk object
@immutable
@JsonSerializable()
class UsernameSettings with InformativeToStringMixin {
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
  @override
  Map<String, dynamic> toJson() => _$UsernameSettingsToJson(this);
}
