import 'package:json_annotation/json_annotation.dart';

import '../helpers.dart';
import '../strategy.dart';

part 'user_attribute_data.g.dart';

/// [UserAttributeData] Clerk object
@JsonSerializable()
class UserAttributeData {
  /// Constructor
  const UserAttributeData({
    this.isEnabled = true,
    this.isRequired = true,
    this.usedForFirstFactor = false,
    this.firstFactors = const [],
    this.userForSecondFactor = false,
    this.secondFactors = const [],
    this.verifyAtSignUp = false,
    this.verifications = const [],
  });

  /// first factors
  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> firstFactors;

  /// second factors
  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> secondFactors;

  /// verifications
  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> verifications;

  /// used for first factor?
  @JsonKey(fromJson: isTrue)
  final bool usedForFirstFactor;

  /// used for second factor?
  @JsonKey(fromJson: isTrue)
  final bool userForSecondFactor;

  /// verify at sign up?
  @JsonKey(fromJson: isTrue)
  final bool verifyAtSignUp;

  /// is enabled?
  @JsonKey(name: 'enabled', fromJson: isTrue)
  final bool isEnabled;

  /// is required?
  @JsonKey(name: 'required', fromJson: isTrue)
  final bool isRequired;

  /// empty [UserAttributeData] object
  static const empty = UserAttributeData();

  /// fromJson
  static UserAttributeData fromJson(Map<String, dynamic> json) =>
      _$UserAttributeDataFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$UserAttributeDataToJson(this);
}
