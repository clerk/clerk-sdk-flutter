import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../utils/json_serialization_helpers.dart';

part 'password_settings.g.dart';

/// [PasswordSettings] Clerk object
@immutable
@JsonSerializable()
class PasswordSettings with InformativeToStringMixin {
  /// Constructor
  const PasswordSettings({
    this.allowedSpecialCharacters = '',
    this.minZxcvbnStrength = 0,
    this.minLength = 0,
    this.maxLength = 0,
    this.disableHibp = false,
    this.requireSpecialChar = false,
    this.requireNumbers = false,
    this.requireUppercase = false,
    this.requireLowercase = false,
    this.showZxcvbn = false,
    this.enforceHibpOnSignIn = false,
  });

  /// allowed special characters
  final String allowedSpecialCharacters;

  /// min zxcvbn strength
  final int minZxcvbnStrength;

  /// min length
  final int minLength;

  /// max length
  final int maxLength;

  /// disable hibp?
  @JsonKey(fromJson: isTrue)
  final bool disableHibp;

  /// require special characters?
  @JsonKey(fromJson: isTrue)
  final bool requireSpecialChar;

  /// require numbers?
  @JsonKey(fromJson: isTrue)
  final bool requireNumbers;

  /// require upper case?
  @JsonKey(fromJson: isTrue)
  final bool requireUppercase;

  /// require lower case?
  @JsonKey(fromJson: isTrue)
  final bool requireLowercase;

  /// show zxcvbn?
  @JsonKey(fromJson: isTrue)
  final bool showZxcvbn;

  /// enforce hibp on sign in?
  @JsonKey(fromJson: isTrue)
  final bool enforceHibpOnSignIn;

  static final _lowerCaseRE = RegExp(r'[a-z]');
  static final _upperCaseRE = RegExp(r'[A-Z]');
  static final _numberRE = RegExp(r'[0-9]');

  /// empty [PasswordSettings]
  static const empty = PasswordSettings();

  /// fromJson
  static PasswordSettings fromJson(Map<String, dynamic> json) =>
      _$PasswordSettingsFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$PasswordSettingsToJson(this);

  /// is it long enough?
  bool meetsLengthCriteria(String password) =>
      password.length >= minLength &&
      (maxLength == 0 || password.length <= maxLength);

  /// does a password meet the lower case criteria?
  bool meetsLowerCaseCriteria(String password) =>
      requireLowercase == false || _lowerCaseRE.hasMatch(password);

  /// does a password meet the upper case criteria?
  bool meetsUpperCaseCriteria(String password) =>
      requireUppercase == false || _upperCaseRE.hasMatch(password);

  /// does a password meet the number criteria?
  bool meetsNumberCriteria(String password) =>
      requireNumbers == false || _numberRE.hasMatch(password);

  /// does a password meet the special character criteria?
  bool meetsSpecialCharCriteria(String password) =>
      requireSpecialChar == false ||
      allowedSpecialCharacters.runes
          .toSet()
          .intersection(password.runes.toSet())
          .isNotEmpty;

  /// does a password meet all criteria?
  bool meetsRequiredCriteria(String password) =>
      meetsLengthCriteria(password) &&
      meetsLowerCaseCriteria(password) &&
      meetsUpperCaseCriteria(password) &&
      meetsNumberCriteria(password) &&
      meetsSpecialCharCriteria(password);
}
