import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'session.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Session {
  final String id;
  final Status status;
  final int lastActiveAt;
  final int expireAt;
  final int abandonAt;
  final User publicUserData;
  final SessionToken? lastActiveToken;

  Session({
    required this.id,
    required this.status,
    required this.lastActiveAt,
    required this.expireAt,
    required this.abandonAt,
    required this.publicUserData,
    this.lastActiveToken,
  });

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
