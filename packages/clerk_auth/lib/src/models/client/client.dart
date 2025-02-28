import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/models/client.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:clerk_auth/src/utils/json_serialization_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'client.g.dart';

/// [Client] Clerk object
@immutable
@JsonSerializable()
class Client with InformativeToStringMixin {
  /// Constructor
  const Client({
    this.id,
    this.signIn,
    this.signUp,
    this.sessions = const [],
    this.lastActiveSessionId,
    this.updatedAt = DateTimeExt.epoch,
    this.createdAt = DateTimeExt.epoch,
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
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime updatedAt;

  /// when created
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime createdAt;

  /// empty [Client] object
  static const empty = Client();

  /// is empty?
  bool get isEmpty => this == empty;

  /// fromJson
  static Client fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$ClientToJson(this);

  /// iterable of current user ids
  Iterable<String> get userIds => sessions.map((s) => s.user.id);

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

  /// Find a [Session] for a given [User]
  Session sessionFor(User user) {
    for (final session in sessions) {
      if (session.user.id == user.id) {
        return session;
      }
    }
    throw AuthError(
      message: 'No session found for {arg}',
      argument: user.name,
      code: AuthErrorCode.noSessionFoundForUser,
    );
  }

  /// Get the latest version of this [User]
  User refreshUser(User user) => sessionFor(user).user;

  /// the current [User] if available
  User? get user => activeSession?.user;
}
