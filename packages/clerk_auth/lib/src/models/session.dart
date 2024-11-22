import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'session.g.dart';

/// [Session] Clerk object
@JsonSerializable()
class Session {
  /// Constructor
  const Session({
    required this.id,
    required this.status,
    required this.lastActiveAt,
    required this.expireAt,
    required this.abandonAt,
    required this.publicUserData,
    required this.user,
    this.lastActiveToken,
  });

  /// id
  final String id;

  /// status
  final Status status;

  /// public user data
  final UserPublic publicUserData;

  /// last active token
  final SessionToken? lastActiveToken;

  /// user
  final User user;

  @JsonKey(fromJson: intToDateTime)

  /// last active at
  final DateTime? lastActiveAt;

  /// expire at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? expireAt;

  /// abandon at
  @JsonKey(fromJson: intToDateTime)
  final DateTime? abandonAt;

  /// is active?
  bool get isActive => status.isActive;

  /// fromJson
  static Session fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
