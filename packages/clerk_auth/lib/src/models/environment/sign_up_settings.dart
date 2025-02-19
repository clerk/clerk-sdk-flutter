import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_up_settings.g.dart';

/// [SignUpSettings] Clerk object
@immutable
@JsonSerializable()
class SignUpSettings {
  /// Constructor
  const SignUpSettings({
    this.captchaEnabled = false,
    this.captchaWidgetType = '',
    this.customActionRequired = false,
    this.progressive = false,
    this.mode = '',
    this.legalConsentEnabled = false,
  });

  /// captcha enabled?
  final bool captchaEnabled;

  /// captcha widget type
  final String captchaWidgetType;

  /// custom action required?
  final bool customActionRequired;

  /// progressive?
  final bool progressive;

  /// mode
  final String mode;

  /// legal consent enabled
  final bool legalConsentEnabled;

  /// empty [SignUpSettings] object
  static const empty = SignUpSettings();

  /// fromJson
  static SignUpSettings fromJson(Map<String, dynamic> json) =>
      _$SignUpSettingsFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SignUpSettingsToJson(this);
}
