import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/models/client/factor.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user_public.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in.g.dart';

/// [SignIn] Clerk object
@JsonSerializable()
class SignIn {
  /// Constructor
  const SignIn({
    required this.id,
    required this.status,
    required this.supportedIdentifiers,
    required this.identifier,
    required this.userData,
    required this.supportedFirstFactors,
    required this.firstFactorVerification,
    required this.supportedSecondFactors,
    required this.secondFactorVerification,
    required this.createdSessionId,
    required this.abandonAt,
  });

  /// id
  final String id;

  /// status
  final Status status;

  /// supported identifiers
  final List<String> supportedIdentifiers;

  /// identifier
  final String? identifier;

  /// user data
  final UserPublic? userData;

  /// first factor verification
  final Verification? firstFactorVerification;

  /// second factor verification
  final Verification? secondFactorVerification;

  /// created session id
  final String? createdSessionId;

  /// abandon at
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime abandonAt;

  /// supported first factors
  @JsonKey(defaultValue: [])
  final List<Factor> supportedFirstFactors;

  /// supported second factors
  @JsonKey(defaultValue: [])
  final List<Factor> supportedSecondFactors;

  /// fromJson
  static SignIn fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SignInToJson(this);

  /// Find a [Verification] if one exists for this [SignIn]
  /// at the giver [Stage]
  ///
  Verification? verificationFor(Stage stage) {
    return switch (stage) {
      Stage.first => firstFactorVerification,
      Stage.second => secondFactorVerification,
    };
  }

  /// Find the [Factor] for this [SignIn] that matches
  /// the [strategy] and [stage]
  ///
  /// Throw an error on failure
  ///
  Factor factorFor(Strategy strategy, Stage stage) {
    final factors = switch (stage) {
      Stage.first => supportedFirstFactors,
      Stage.second => supportedSecondFactors,
    };
    for (final factor in factors) {
      if (factor.strategy == strategy) return factor;
    }
    throw AuthError(
        message: 'Strategy $strategy unsupported for $stage factor');
  }
}
