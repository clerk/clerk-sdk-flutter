import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
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

  final String id;
  final Status status;
  final UserPublic publicUserData;
  final SessionToken? lastActiveToken;
  final User user;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? lastActiveAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? expireAt;

  @JsonKey(fromJson: intToDateTime)
  final DateTime? abandonAt;

  bool get isActive => status.isActive;

  static Session fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
