import 'package:json_annotation/json_annotation.dart';

part 'session_token.g.dart';

/// [SessionToken] Clerk object
@JsonSerializable()
class SessionToken {
  /// Constructor
  const SessionToken({required this.jwt});

  /// json web token
  final String jwt;

  /// fromJson
  static SessionToken fromJson(Map<String, dynamic> json) =>
      _$SessionTokenFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SessionTokenToJson(this);
}
