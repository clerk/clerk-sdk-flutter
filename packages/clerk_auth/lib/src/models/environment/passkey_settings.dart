import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'passkey_settings.g.dart';

/// [PasskeySettings] Clerk object
@immutable
@JsonSerializable()
class PasskeySettings with InformativeToStringMixin {
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
  @override
  Map<String, dynamic> toJson() => _$PasskeySettingsToJson(this);
}
