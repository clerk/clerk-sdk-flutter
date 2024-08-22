import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'client.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Client {
  final String id;
  final SignIn signIn;
  final SignUp signUp;
  final List<Session> sessions;
  final String lastActiveSessionId;
  final DateTime updatedAt;
  final DateTime createdAt;

  const Client({
    required this.id,
    required this.signIn,
    required this.signUp,
    required this.sessions,
    required this.lastActiveSessionId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);

  Session? get activeSession {
    for (final session in sessions) {
      if (session.id == lastActiveSessionId) return session;
    }

    for (final session in sessions) {
      if (session.status.isActive) return session;
    }

    return null;
  }
}
