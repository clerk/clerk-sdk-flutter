import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../utils/json_serialization_helpers.dart';

part 'sign_in_settings.g.dart';

/// [SignInSettings] Clerk object
@immutable
@JsonSerializable()
class SignInSettings {
  /// Constructor
  const SignInSettings({
    this.secondFactorRequired = false,
  });

  /// second factor required?
  @JsonKey(readValue: _readSecondFactorRequired)
  final bool secondFactorRequired;

  /// empty [SignInSettings] object
  static const empty = SignInSettings();

  /// fromJson
  static SignInSettings fromJson(Map<String, dynamic> json) =>
      _$SignInSettingsFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SignInSettingsToJson(this);
}

bool _readSecondFactorRequired(map, _) =>
    isTrue(map['second_factor']?['required']);
