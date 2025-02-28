import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_attribute_data.g.dart';

/// [UserAttributeData] Clerk object
@immutable
@JsonSerializable()
class UserAttributeData with InformativeToStringMixin {
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
  final List<Strategy> firstFactors;

  /// second factors
  final List<Strategy> secondFactors;

  /// verifications
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
  @override
  Map<String, dynamic> toJson() => _$UserAttributeDataToJson(this);
}
