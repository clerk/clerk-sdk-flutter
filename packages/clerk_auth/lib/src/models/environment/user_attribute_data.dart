import 'package:json_annotation/json_annotation.dart';

import '../strategy.dart';
import '../helpers.dart';

part 'user_attribute_data.g.dart';

@JsonSerializable()
class UserAttributeData {
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

  static const empty = UserAttributeData();

  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> firstFactors;

  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> secondFactors;

  @JsonKey(fromJson: toStrategyList)
  final List<Strategy> verifications;

  @JsonKey(fromJson: isTrue)
  final bool usedForFirstFactor;

  @JsonKey(fromJson: isTrue)
  final bool userForSecondFactor;

  @JsonKey(fromJson: isTrue)
  final bool verifyAtSignUp;

  @JsonKey(name: 'enabled', fromJson: isTrue)
  final bool isEnabled;

  @JsonKey(name: 'required', fromJson: isTrue)
  final bool isRequired;

  static UserAttributeData fromJson(Map<String, dynamic> json) =>
      _$UserAttributeDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserAttributeDataToJson(this);
}
