import 'dart:convert';

import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/models/client/organization.dart';
import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_token.g.dart';

/// [SessionToken] Clerk object
@JsonSerializable()
class SessionToken {
  /// Constructor
  SessionToken({required this.jwt});

  /// json web token
  final String jwt;

  static const _tokenExpiryBuffer = Duration(seconds: 10);
  static const _kJwtExpiryKey = 'exp';
  static const _kJwtNotBeforeKey = 'nbf';
  static const _kJwtOrgIdKey = 'org_id';

  late final _parts = switch (jwt.split('.')) {
    List<String> parts when parts.length == 3 => parts,
    _ => throw AuthError(message: "JWT poorly formatted: $jwt"),
  };

  /// The [header] of the token
  late final header = json.decode(_parts[0].b64decoded) as Map<String, dynamic>;

  /// The [body] of the token
  late final body = json.decode(_parts[1].b64decoded) as Map<String, dynamic>;

  /// The [signature] of the token
  late final signature = _parts[2];

  /// When this token expires
  late final expiry = DateTimeExt.utcEpochSeconds(
    (body[_kJwtExpiryKey] as int) - _tokenExpiryBuffer.inSeconds,
  );

  /// When this token starts
  late final notBefore = DateTimeExt.utcEpochSeconds(
    body[_kJwtNotBeforeKey] as int,
  );

  /// The organization id associated with this token
  late final orgId = body[_kJwtOrgIdKey] ?? Organization.personal.id;

  /// Has this token expired?
  bool get isExpired {
    final now = DateTime.timestamp();
    return expiry.isBefore(now) || notBefore.isAfter(now);
  }

  /// Is this token still valid?
  bool get isNotExpired => isExpired == false;

  /// fromJson
  static SessionToken fromJson(Map<String, dynamic> json) =>
      _$SessionTokenFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$SessionTokenToJson(this);
}
