import 'package:json_annotation/json_annotation.dart';

part 'session_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SessionToken {
  final String jwt;

  const SessionToken({
    required this.jwt,
  });

  factory SessionToken.fromJson(Map<String, dynamic> json) => _$SessionTokenFromJson(json);

  Map<String, dynamic> toJson() => _$SessionTokenToJson(this);
}
