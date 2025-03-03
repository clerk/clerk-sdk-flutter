//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Session {
  /// Returns a new [Session] instance.
  Session({
    required this.object,
    required this.id,
    required this.userId,
    required this.clientId,
    this.actor,
    required this.status,
    this.lastActiveOrganizationId,
    required this.lastActiveAt,
    this.latestActivity,
    required this.expireAt,
    required this.abandonAt,
    required this.updatedAt,
    required this.createdAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  SessionObjectEnum object;

  String id;

  String userId;

  String clientId;

  Object? actor;

  SessionStatusEnum status;

  String? lastActiveOrganizationId;

  int lastActiveAt;

  SessionActivityResponse? latestActivity;

  /// Unix timestamp of expiration.
  int expireAt;

  /// Unix timestamp of abandonment.
  int abandonAt;

  /// Unix timestamp of last update.
  int updatedAt;

  /// Unix timestamp of creation.
  int createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Session &&
          other.object == object &&
          other.id == id &&
          other.userId == userId &&
          other.clientId == clientId &&
          other.actor == actor &&
          other.status == status &&
          other.lastActiveOrganizationId == lastActiveOrganizationId &&
          other.lastActiveAt == lastActiveAt &&
          other.latestActivity == latestActivity &&
          other.expireAt == expireAt &&
          other.abandonAt == abandonAt &&
          other.updatedAt == updatedAt &&
          other.createdAt == createdAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (userId.hashCode) +
      (clientId.hashCode) +
      (actor == null ? 0 : actor!.hashCode) +
      (status.hashCode) +
      (lastActiveOrganizationId == null
          ? 0
          : lastActiveOrganizationId!.hashCode) +
      (lastActiveAt.hashCode) +
      (latestActivity == null ? 0 : latestActivity!.hashCode) +
      (expireAt.hashCode) +
      (abandonAt.hashCode) +
      (updatedAt.hashCode) +
      (createdAt.hashCode);

  @override
  String toString() =>
      'Session[object=$object, id=$id, userId=$userId, clientId=$clientId, actor=$actor, status=$status, lastActiveOrganizationId=$lastActiveOrganizationId, lastActiveAt=$lastActiveAt, latestActivity=$latestActivity, expireAt=$expireAt, abandonAt=$abandonAt, updatedAt=$updatedAt, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'user_id'] = this.userId;
    json[r'client_id'] = this.clientId;
    if (this.actor != null) {
      json[r'actor'] = this.actor;
    } else {
      json[r'actor'] = null;
    }
    json[r'status'] = this.status;
    if (this.lastActiveOrganizationId != null) {
      json[r'last_active_organization_id'] = this.lastActiveOrganizationId;
    } else {
      json[r'last_active_organization_id'] = null;
    }
    json[r'last_active_at'] = this.lastActiveAt;
    if (this.latestActivity != null) {
      json[r'latest_activity'] = this.latestActivity;
    } else {
      json[r'latest_activity'] = null;
    }
    json[r'expire_at'] = this.expireAt;
    json[r'abandon_at'] = this.abandonAt;
    json[r'updated_at'] = this.updatedAt;
    json[r'created_at'] = this.createdAt;
    return json;
  }

  /// Returns a new [Session] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Session? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Session[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Session[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Session(
        object: SessionObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        userId: mapValueOfType<String>(json, r'user_id')!,
        clientId: mapValueOfType<String>(json, r'client_id')!,
        actor: mapValueOfType<Object>(json, r'actor'),
        status: SessionStatusEnum.fromJson(json[r'status'])!,
        lastActiveOrganizationId:
            mapValueOfType<String>(json, r'last_active_organization_id'),
        lastActiveAt: mapValueOfType<int>(json, r'last_active_at')!,
        latestActivity:
            SessionActivityResponse.fromJson(json[r'latest_activity']),
        expireAt: mapValueOfType<int>(json, r'expire_at')!,
        abandonAt: mapValueOfType<int>(json, r'abandon_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
      );
    }
    return null;
  }

  static List<Session> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Session>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Session.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Session> mapFromJson(dynamic json) {
    final map = <String, Session>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Session.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Session-objects as value to a dart map
  static Map<String, List<Session>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Session>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Session.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'object',
    'id',
    'user_id',
    'client_id',
    'status',
    'last_active_at',
    'expire_at',
    'abandon_at',
    'updated_at',
    'created_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class SessionObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SessionObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const session = SessionObjectEnum._(r'session');

  /// List of all possible values in this [enum][SessionObjectEnum].
  static const values = <SessionObjectEnum>[
    session,
  ];

  static SessionObjectEnum? fromJson(dynamic value) =>
      SessionObjectEnumTypeTransformer().decode(value);

  static List<SessionObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SessionObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SessionObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SessionObjectEnum] to String,
/// and [decode] dynamic data back to [SessionObjectEnum].
class SessionObjectEnumTypeTransformer {
  factory SessionObjectEnumTypeTransformer() =>
      _instance ??= const SessionObjectEnumTypeTransformer._();

  const SessionObjectEnumTypeTransformer._();

  String encode(SessionObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SessionObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SessionObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'session':
          return SessionObjectEnum.session;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SessionObjectEnumTypeTransformer] instance.
  static SessionObjectEnumTypeTransformer? _instance;
}

class SessionStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const SessionStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = SessionStatusEnum._(r'active');
  static const revoked = SessionStatusEnum._(r'revoked');
  static const ended = SessionStatusEnum._(r'ended');
  static const expired = SessionStatusEnum._(r'expired');
  static const removed = SessionStatusEnum._(r'removed');
  static const abandoned = SessionStatusEnum._(r'abandoned');
  static const replaced = SessionStatusEnum._(r'replaced');

  /// List of all possible values in this [enum][SessionStatusEnum].
  static const values = <SessionStatusEnum>[
    active,
    revoked,
    ended,
    expired,
    removed,
    abandoned,
    replaced,
  ];

  static SessionStatusEnum? fromJson(dynamic value) =>
      SessionStatusEnumTypeTransformer().decode(value);

  static List<SessionStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SessionStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SessionStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SessionStatusEnum] to String,
/// and [decode] dynamic data back to [SessionStatusEnum].
class SessionStatusEnumTypeTransformer {
  factory SessionStatusEnumTypeTransformer() =>
      _instance ??= const SessionStatusEnumTypeTransformer._();

  const SessionStatusEnumTypeTransformer._();

  String encode(SessionStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SessionStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SessionStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'active':
          return SessionStatusEnum.active;
        case r'revoked':
          return SessionStatusEnum.revoked;
        case r'ended':
          return SessionStatusEnum.ended;
        case r'expired':
          return SessionStatusEnum.expired;
        case r'removed':
          return SessionStatusEnum.removed;
        case r'abandoned':
          return SessionStatusEnum.abandoned;
        case r'replaced':
          return SessionStatusEnum.replaced;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SessionStatusEnumTypeTransformer] instance.
  static SessionStatusEnumTypeTransformer? _instance;
}
