//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Client {
  /// Returns a new [Client] instance.
  Client({
    required this.object,
    required this.id,
    this.sessionIds = const [],
    this.sessions = const [],
    required this.signInId,
    required this.signUpId,
    required this.lastActiveSessionId,
    required this.updatedAt,
    required this.createdAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  ClientObjectEnum object;

  /// String representing the identifier of the session.
  String id;

  List<String> sessionIds;

  List<Session> sessions;

  String? signInId;

  String? signUpId;

  /// Last active session_id.
  String? lastActiveSessionId;

  /// Unix timestamp of last update.
  int updatedAt;

  /// Unix timestamp of creation.
  int createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Client &&
          other.object == object &&
          other.id == id &&
          _deepEquality.equals(other.sessionIds, sessionIds) &&
          _deepEquality.equals(other.sessions, sessions) &&
          other.signInId == signInId &&
          other.signUpId == signUpId &&
          other.lastActiveSessionId == lastActiveSessionId &&
          other.updatedAt == updatedAt &&
          other.createdAt == createdAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (sessionIds.hashCode) +
      (sessions.hashCode) +
      (signInId == null ? 0 : signInId!.hashCode) +
      (signUpId == null ? 0 : signUpId!.hashCode) +
      (lastActiveSessionId == null ? 0 : lastActiveSessionId!.hashCode) +
      (updatedAt.hashCode) +
      (createdAt.hashCode);

  @override
  String toString() =>
      'Client[object=$object, id=$id, sessionIds=$sessionIds, sessions=$sessions, signInId=$signInId, signUpId=$signUpId, lastActiveSessionId=$lastActiveSessionId, updatedAt=$updatedAt, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'session_ids'] = this.sessionIds;
    json[r'sessions'] = this.sessions;
    if (this.signInId != null) {
      json[r'sign_in_id'] = this.signInId;
    } else {
      json[r'sign_in_id'] = null;
    }
    if (this.signUpId != null) {
      json[r'sign_up_id'] = this.signUpId;
    } else {
      json[r'sign_up_id'] = null;
    }
    if (this.lastActiveSessionId != null) {
      json[r'last_active_session_id'] = this.lastActiveSessionId;
    } else {
      json[r'last_active_session_id'] = null;
    }
    json[r'updated_at'] = this.updatedAt;
    json[r'created_at'] = this.createdAt;
    return json;
  }

  /// Returns a new [Client] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Client? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Client[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Client[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Client(
        object: ClientObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        sessionIds: json[r'session_ids'] is Iterable
            ? (json[r'session_ids'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        sessions: Session.listFromJson(json[r'sessions']),
        signInId: mapValueOfType<String>(json, r'sign_in_id'),
        signUpId: mapValueOfType<String>(json, r'sign_up_id'),
        lastActiveSessionId:
            mapValueOfType<String>(json, r'last_active_session_id'),
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
      );
    }
    return null;
  }

  static List<Client> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Client>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Client.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Client> mapFromJson(dynamic json) {
    final map = <String, Client>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Client.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Client-objects as value to a dart map
  static Map<String, List<Client>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Client>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Client.listFromJson(
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
    'session_ids',
    'sessions',
    'sign_in_id',
    'sign_up_id',
    'last_active_session_id',
    'updated_at',
    'created_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class ClientObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const ClientObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const client = ClientObjectEnum._(r'client');

  /// List of all possible values in this [enum][ClientObjectEnum].
  static const values = <ClientObjectEnum>[
    client,
  ];

  static ClientObjectEnum? fromJson(dynamic value) =>
      ClientObjectEnumTypeTransformer().decode(value);

  static List<ClientObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ClientObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ClientObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ClientObjectEnum] to String,
/// and [decode] dynamic data back to [ClientObjectEnum].
class ClientObjectEnumTypeTransformer {
  factory ClientObjectEnumTypeTransformer() =>
      _instance ??= const ClientObjectEnumTypeTransformer._();

  const ClientObjectEnumTypeTransformer._();

  String encode(ClientObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ClientObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ClientObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'client':
          return ClientObjectEnum.client;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ClientObjectEnumTypeTransformer] instance.
  static ClientObjectEnumTypeTransformer? _instance;
}
