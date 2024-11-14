import 'package:json_annotation/json_annotation.dart';

part 'session_token.g.dart';

@JsonSerializable()
class SessionToken {
  const SessionToken({
    required this.jwt,
  });

  final String jwt;

  static SessionToken fromJson(Map<String, dynamic> json) => _$SessionTokenFromJson(json);

  Map<String, dynamic> toJson() => _$SessionTokenToJson(this);
}
