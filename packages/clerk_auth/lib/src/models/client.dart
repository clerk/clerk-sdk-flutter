import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'client.g.dart';

/// [Client] Clerk object
@JsonSerializable()
class Client {
  /// Constructor
  const Client({
    this.id,
    this.signIn,
    this.signUp,
    this.sessions = const [],
    this.lastActiveSessionId,
    this.updatedAt,
    this.createdAt,
  });

  /// client id
  final String? id;

  /// [SignIn] object
  final SignIn? signIn;

  /// [SignUp] object
  final SignUp? signUp;

  /// id of last active [Session]
  final String? lastActiveSessionId;

  /// List of current [Session]s
  final List<Session> sessions;

  /// when updated
  @JsonKey(fromJson: intToDateTime)
  final DateTime? updatedAt;

  /// when created
  @JsonKey(fromJson: intToDateTime)
  final DateTime? createdAt;

  /// empty [Client] object
  static const empty = Client();

  /// is empty?
  bool get isEmpty => this == empty;

  /// fromJson
  static Client fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$ClientToJson(this);

  /// set of current sessions
  Set<String> get sessionIds => sessions.map((s) => s.id).toSet();

  /// find the current active session
  Session? get activeSession {
    for (final session in sessions) {
      if (session.id == lastActiveSessionId) return session;
    }

    for (final session in sessions) {
      if (session.isActive) return session;
    }

    return null;
  }

  /// the current [User] if available
  User? get user => activeSession?.user;
}
