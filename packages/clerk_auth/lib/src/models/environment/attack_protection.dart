import 'package:json_annotation/json_annotation.dart';

part 'attack_protection.g.dart';

@JsonSerializable()
class AttackProtection {
  const AttackProtection({
    this.userLockout = UserLockout.empty,
    this.piiEnabled = false,
    this.emailLinkRequireSameClient = false,
  });

  static const empty = AttackProtection();

  final UserLockout userLockout;

  @JsonKey(readValue: _readPiiEnabled)
  final bool piiEnabled;

  @JsonKey(readValue: _readEmailLinkRequireSameClient)
  final bool emailLinkRequireSameClient;

  static AttackProtection fromJson(Map<String, dynamic> json) =>
      _$AttackProtectionFromJson(json);

  Map<String, dynamic> toJson() => _$AttackProtectionToJson(this);
}

@JsonSerializable()
class UserLockout {
  const UserLockout({
    this.isEnabled = false,
    this.maxAttempts = 0,
    this.duration = Duration.zero,
  });

  static const empty = UserLockout();

  final int maxAttempts;

  @JsonKey(name: 'enabled')
  final bool isEnabled;

  @JsonKey(
      name: 'duration_in_minutes', toJson: _fromDuration, fromJson: _toDuration)
  final Duration duration;

  static UserLockout fromJson(Map<String, dynamic> json) =>
      _$UserLockoutFromJson(json);

  Map<String, dynamic> toJson() => _$UserLockoutToJson(this);
}

Duration _toDuration(dynamic value) =>
    value is num ? Duration(minutes: value.toInt()) : Duration.zero;

int _fromDuration(Duration duration) => duration.inMinutes;

bool _readPiiEnabled(map, _) => map['pii']?['enabled'] == true;

bool _readEmailLinkRequireSameClient(map, _) =>
    map['email_link']?['require_same_client'] == true;
