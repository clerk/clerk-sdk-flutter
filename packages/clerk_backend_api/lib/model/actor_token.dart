//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ActorToken {
  /// Returns a new [ActorToken] instance.
  ActorToken({
    required this.object,
    required this.id,
    required this.status,
    required this.userId,
    required this.actor,
    this.token,
    this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  ActorTokenObjectEnum object;

  String id;

  ActorTokenStatusEnum status;

  String userId;

  Object actor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? token;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorToken &&
          other.object == object &&
          other.id == id &&
          other.status == status &&
          other.userId == userId &&
          other.actor == actor &&
          other.token == token &&
          other.url == url &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (status.hashCode) +
      (userId.hashCode) +
      (actor.hashCode) +
      (token == null ? 0 : token!.hashCode) +
      (url == null ? 0 : url!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'ActorToken[object=$object, id=$id, status=$status, userId=$userId, actor=$actor, token=$token, url=$url, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'status'] = this.status;
    json[r'user_id'] = this.userId;
    json[r'actor'] = this.actor;
    if (this.token != null) {
      json[r'token'] = this.token;
    } else {
      json[r'token'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [ActorToken] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ActorToken? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ActorToken[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ActorToken[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ActorToken(
        object: ActorTokenObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        status: ActorTokenStatusEnum.fromJson(json[r'status'])!,
        userId: mapValueOfType<String>(json, r'user_id')!,
        actor: mapValueOfType<Object>(json, r'actor')!,
        token: mapValueOfType<String>(json, r'token'),
        url: mapValueOfType<String>(json, r'url'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<ActorToken> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ActorToken>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ActorToken.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ActorToken> mapFromJson(dynamic json) {
    final map = <String, ActorToken>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ActorToken.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ActorToken-objects as value to a dart map
  static Map<String, List<ActorToken>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ActorToken>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ActorToken.listFromJson(
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
    'status',
    'user_id',
    'actor',
    'created_at',
    'updated_at',
  };
}

class ActorTokenObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const ActorTokenObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const actorToken = ActorTokenObjectEnum._(r'actor_token');

  /// List of all possible values in this [enum][ActorTokenObjectEnum].
  static const values = <ActorTokenObjectEnum>[
    actorToken,
  ];

  static ActorTokenObjectEnum? fromJson(dynamic value) =>
      ActorTokenObjectEnumTypeTransformer().decode(value);

  static List<ActorTokenObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ActorTokenObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ActorTokenObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ActorTokenObjectEnum] to String,
/// and [decode] dynamic data back to [ActorTokenObjectEnum].
class ActorTokenObjectEnumTypeTransformer {
  factory ActorTokenObjectEnumTypeTransformer() =>
      _instance ??= const ActorTokenObjectEnumTypeTransformer._();

  const ActorTokenObjectEnumTypeTransformer._();

  String encode(ActorTokenObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ActorTokenObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ActorTokenObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'actor_token':
          return ActorTokenObjectEnum.actorToken;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ActorTokenObjectEnumTypeTransformer] instance.
  static ActorTokenObjectEnumTypeTransformer? _instance;
}

class ActorTokenStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const ActorTokenStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = ActorTokenStatusEnum._(r'pending');
  static const accepted = ActorTokenStatusEnum._(r'accepted');
  static const revoked = ActorTokenStatusEnum._(r'revoked');

  /// List of all possible values in this [enum][ActorTokenStatusEnum].
  static const values = <ActorTokenStatusEnum>[
    pending,
    accepted,
    revoked,
  ];

  static ActorTokenStatusEnum? fromJson(dynamic value) =>
      ActorTokenStatusEnumTypeTransformer().decode(value);

  static List<ActorTokenStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ActorTokenStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ActorTokenStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ActorTokenStatusEnum] to String,
/// and [decode] dynamic data back to [ActorTokenStatusEnum].
class ActorTokenStatusEnumTypeTransformer {
  factory ActorTokenStatusEnumTypeTransformer() =>
      _instance ??= const ActorTokenStatusEnumTypeTransformer._();

  const ActorTokenStatusEnumTypeTransformer._();

  String encode(ActorTokenStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ActorTokenStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ActorTokenStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'pending':
          return ActorTokenStatusEnum.pending;
        case r'accepted':
          return ActorTokenStatusEnum.accepted;
        case r'revoked':
          return ActorTokenStatusEnum.revoked;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ActorTokenStatusEnumTypeTransformer] instance.
  static ActorTokenStatusEnumTypeTransformer? _instance;
}
