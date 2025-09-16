import 'dart:convert';

import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/models/client/organization.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'session_token.g.dart';

/// [SessionToken] Clerk object
@immutable
@JsonSerializable()
class SessionToken with InformativeToStringMixin {
  /// Constructor
  SessionToken({required this.jwt, this.templateName});

  /// json web token
  final String jwt;

  /// The template name, if known
  final String? templateName;

  static const _tokenExpiryBuffer = Duration(seconds: 10);
  static const _kJwtExpiryKey = 'exp';
  static const _kJwtNotBeforeKey = 'nbf';
  static const _kJwtOrgIdKey = 'org_id';
  static const _kJwtOrgKey = 'o';
  static const _kJwtIdKey = 'id';

  late final _parts = switch (jwt.split('.')) {
    List<String> parts when parts.length == 3 => parts,
    _ => throw AuthError(
        message: "JWT poorly formatted: {arg}",
        argument: jwt,
        code: AuthErrorCode.jwtPoorlyFormatted,
      ),
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
  late final orgId = body[_kJwtOrgIdKey] ?? // v1
      body[_kJwtOrgKey]?[_kJwtIdKey] ?? // v2
      Organization.personal.id; // default

  /// Has this token expired?
  bool get isExpired {
    final now = DateTime.timestamp();
    return expiry.isBefore(now) || notBefore.isAfter(now);
  }

  /// Is this token still valid?
  bool get isNotExpired => isExpired == false;

  /// The Time to Live as a [Duration], or null if expired
  Duration? get ttl {
    final ttl = expiry.difference(DateTime.timestamp());
    return ttl > Duration.zero ? ttl : null;
  }

  /// fromJson
  static SessionToken fromJson(Map<String, dynamic> json) =>
      _$SessionTokenFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$SessionTokenToJson(this);
}
