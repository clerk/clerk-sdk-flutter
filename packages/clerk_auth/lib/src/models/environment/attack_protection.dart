import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'attack_protection.g.dart';

/// [AttackProtection] Clerk object
@immutable
@JsonSerializable()
class AttackProtection with InformativeToStringMixin {
  /// Constructor
  const AttackProtection({
    this.userLockout = UserLockout.empty,
    this.piiEnabled = false,
    this.emailLinkRequireSameClient = false,
  });

  /// empty [AttackProtection]
  static const empty = AttackProtection();

  /// [userLockout]
  final UserLockout userLockout;

  /// is this PII enabled?
  @JsonKey(name: 'pii', readValue: readEnabled)
  final bool piiEnabled;

  /// does email link require same client?
  @JsonKey(readValue: _readEmailLinkRequireSameClient)
  final bool emailLinkRequireSameClient;

  /// fromJson
  static AttackProtection fromJson(Map<String, dynamic> json) =>
      _$AttackProtectionFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$AttackProtectionToJson(this);
}

/// [UserLockout] Clerk object
@immutable
@JsonSerializable()
class UserLockout {
  /// Constructor
  const UserLockout({
    this.isEnabled = false,
    this.maxAttempts = 0,
    this.duration = Duration.zero,
  });

  /// empty [UserLockout
  static const empty = UserLockout();

  /// how many attempts?
  final int maxAttempts;

  /// is lockout enabled?
  @JsonKey(name: 'enabled')
  final bool isEnabled;

  /// duration of lockout
  @JsonKey(
    name: 'duration_in_minutes',
    toJson: _fromDuration,
    fromJson: _toDuration,
  )
  final Duration duration;

  /// fromJson
  static UserLockout fromJson(Map<String, dynamic> json) =>
      _$UserLockoutFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$UserLockoutToJson(this);
}

Duration _toDuration(dynamic value) =>
    value is num ? Duration(minutes: value.toInt()) : Duration.zero;

int _fromDuration(Duration duration) => duration.inMinutes;

bool _readEmailLinkRequireSameClient(map, name) =>
    readBool(map, name, 'require_same_client');
