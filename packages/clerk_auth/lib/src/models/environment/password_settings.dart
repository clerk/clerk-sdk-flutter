// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import '../helpers.dart';

part 'password_settings.g.dart';

@JsonSerializable()
class PasswordSettings {
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

  final String allowedSpecialCharacters;
  final int minZxcvbnStrength;
  final int minLength;
  final int maxLength;

  @JsonKey(fromJson: isTrue)
  final bool disableHibp;

  @JsonKey(fromJson: isTrue)
  final bool requireSpecialChar;

  @JsonKey(fromJson: isTrue)
  final bool requireNumbers;

  @JsonKey(fromJson: isTrue)
  final bool requireUppercase;

  @JsonKey(fromJson: isTrue)
  final bool requireLowercase;

  @JsonKey(fromJson: isTrue)
  final bool showZxcvbn;

  @JsonKey(fromJson: isTrue)
  final bool enforceHibpOnSignIn;

  static final _lowerCaseRE = RegExp(r'[a-z]');
  static final _upperCaseRE = RegExp(r'[A-Z]');
  static final _numberRE = RegExp(r'[0-9]');

  static const empty = PasswordSettings();

  static PasswordSettings fromJson(Map<String, dynamic> json) =>
      _$PasswordSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordSettingsToJson(this);

  bool meetsLowerCaseCriteria(String password) =>
      requireLowercase == false || _lowerCaseRE.hasMatch(password);

  bool meetsUpperCaseCriteria(String password) =>
      requireUppercase == false || _upperCaseRE.hasMatch(password);

  bool meetsNumberCriteria(String password) =>
      requireNumbers == false || _numberRE.hasMatch(password);

  bool meetsSpecialCharCriteria(String password) =>
      requireSpecialChar == false ||
      allowedSpecialCharacters.runes
          .toSet()
          .intersection(password.runes.toSet())
          .isNotEmpty;

  bool meetsRequiredCriteria(String password) =>
      meetsLowerCaseCriteria(password) &&
      meetsUpperCaseCriteria(password) &&
      meetsNumberCriteria(password) &&
      meetsSpecialCharCriteria(password);
}
