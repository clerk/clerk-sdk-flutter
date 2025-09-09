import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/models/client/auth_object.dart';
import 'package:clerk_auth/src/models/client/factor.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/client/user_public.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_in.g.dart';

/// [SignIn] Clerk object
@immutable
@JsonSerializable()
class SignIn extends AuthObject with InformativeToStringMixin {
  /// Constructor
  const SignIn({
    required super.id,
    required this.status,
    this.identifier,
    this.userData,
    required this.supportedIdentifiers,
    required this.supportedFirstFactors,
    this.firstFactorVerification,
    required this.supportedSecondFactors,
    this.secondFactorVerification,
    this.createdSessionId,
    this.abandonAt = DateTimeExt.epoch,
  });

  @override
  String get urlType => 'sign_ins';

  /// status
  final Status status;

  /// supported identifiers
  @JsonKey(defaultValue: [])
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

  /// Empty [SignIn]
  static const empty = SignIn(
    id: '~empty~',
    status: Status.unknown,
    supportedFirstFactors: [],
    supportedIdentifiers: [],
    supportedSecondFactors: [],
  );

  /// The currently most important verification
  Verification? get verification =>
      firstFactorVerification ?? secondFactorVerification;

  /// Do we have a verification in operation>?
  bool get hasVerification => verification is Verification;

  /// fromJson
  static SignIn fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  /// toJson
  @override
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

  /// Find the [Factor]s for this [SignIn] that match
  /// the [stage]
  ///
  List<Factor> factorsFor(Stage stage) {
    return switch (stage) {
      Stage.first => supportedFirstFactors,
      Stage.second => supportedSecondFactors,
    };
  }

  /// The factors for the current stage
  List<Factor> get factors => switch (status) {
        Status.needsFirstFactor => supportedFirstFactors,
        Status.needsSecondFactor => supportedSecondFactors,
        _ => const [],
      };

  /// can we handle the password strategy?
  bool get canUsePassword => factors.any((f) => f.strategy.isPassword);

  /// Find the [Factor] for this [SignIn] that matches
  /// the [strategy] and [stage]
  ///
  /// Throw an error on failure
  ///
  Factor factorFor(Strategy strategy, Stage stage) {
    for (final factor in factorsFor(stage)) {
      if (factor.strategy == strategy) return factor;
    }
    switch (stage) {
      case Stage.first:
        throw AuthError(
          message: 'Strategy {arg} unsupported for first factor',
          argument: strategy.toString(),
          code: AuthErrorCode.noSuchFirstFactorStrategy,
        );
      case Stage.second:
        throw AuthError(
          message: 'Strategy {arg} unsupported for second factor',
          argument: strategy.toString(),
          code: AuthErrorCode.noSuchSecondFactorStrategy,
        );
    }
  }
}
