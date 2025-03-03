//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RevokeInvitation200Response {
  /// Returns a new [RevokeInvitation200Response] instance.
  RevokeInvitation200Response({
    required this.object,
    required this.id,
    required this.emailAddress,
    this.publicMetadata = const {},
    this.revoked,
    required this.status,
    this.url,
    this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  RevokeInvitation200ResponseObjectEnum object;

  String id;

  String emailAddress;

  Map<String, Object> publicMetadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? revoked;

  RevokeInvitation200ResponseStatusEnum status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  /// Unix timestamp of expiration.
  int? expiresAt;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RevokeInvitation200Response &&
          other.object == object &&
          other.id == id &&
          other.emailAddress == emailAddress &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.revoked == revoked &&
          other.status == status &&
          other.url == url &&
          other.expiresAt == expiresAt &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (emailAddress.hashCode) +
      (publicMetadata.hashCode) +
      (revoked == null ? 0 : revoked!.hashCode) +
      (status.hashCode) +
      (url == null ? 0 : url!.hashCode) +
      (expiresAt == null ? 0 : expiresAt!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'RevokeInvitation200Response[object=$object, id=$id, emailAddress=$emailAddress, publicMetadata=$publicMetadata, revoked=$revoked, status=$status, url=$url, expiresAt=$expiresAt, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'email_address'] = this.emailAddress;
    json[r'public_metadata'] = this.publicMetadata;
    if (this.revoked != null) {
      json[r'revoked'] = this.revoked;
    } else {
      json[r'revoked'] = null;
    }
    json[r'status'] = this.status;
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    if (this.expiresAt != null) {
      json[r'expires_at'] = this.expiresAt;
    } else {
      json[r'expires_at'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [RevokeInvitation200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RevokeInvitation200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RevokeInvitation200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RevokeInvitation200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RevokeInvitation200Response(
        object:
            RevokeInvitation200ResponseObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata')!,
        revoked: mapValueOfType<bool>(json, r'revoked'),
        status:
            RevokeInvitation200ResponseStatusEnum.fromJson(json[r'status'])!,
        url: mapValueOfType<String>(json, r'url'),
        expiresAt: mapValueOfType<int>(json, r'expires_at'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<RevokeInvitation200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RevokeInvitation200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RevokeInvitation200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RevokeInvitation200Response> mapFromJson(dynamic json) {
    final map = <String, RevokeInvitation200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RevokeInvitation200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RevokeInvitation200Response-objects as value to a dart map
  static Map<String, List<RevokeInvitation200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RevokeInvitation200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RevokeInvitation200Response.listFromJson(
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
    'email_address',
    'public_metadata',
    'status',
    'created_at',
    'updated_at',
  };
}

class RevokeInvitation200ResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const RevokeInvitation200ResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const invitation =
      RevokeInvitation200ResponseObjectEnum._(r'invitation');

  /// List of all possible values in this [enum][RevokeInvitation200ResponseObjectEnum].
  static const values = <RevokeInvitation200ResponseObjectEnum>[
    invitation,
  ];

  static RevokeInvitation200ResponseObjectEnum? fromJson(dynamic value) =>
      RevokeInvitation200ResponseObjectEnumTypeTransformer().decode(value);

  static List<RevokeInvitation200ResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RevokeInvitation200ResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RevokeInvitation200ResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RevokeInvitation200ResponseObjectEnum] to String,
/// and [decode] dynamic data back to [RevokeInvitation200ResponseObjectEnum].
class RevokeInvitation200ResponseObjectEnumTypeTransformer {
  factory RevokeInvitation200ResponseObjectEnumTypeTransformer() =>
      _instance ??=
          const RevokeInvitation200ResponseObjectEnumTypeTransformer._();

  const RevokeInvitation200ResponseObjectEnumTypeTransformer._();

  String encode(RevokeInvitation200ResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RevokeInvitation200ResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RevokeInvitation200ResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'invitation':
          return RevokeInvitation200ResponseObjectEnum.invitation;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RevokeInvitation200ResponseObjectEnumTypeTransformer] instance.
  static RevokeInvitation200ResponseObjectEnumTypeTransformer? _instance;
}

class RevokeInvitation200ResponseStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const RevokeInvitation200ResponseStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const revoked = RevokeInvitation200ResponseStatusEnum._(r'revoked');

  /// List of all possible values in this [enum][RevokeInvitation200ResponseStatusEnum].
  static const values = <RevokeInvitation200ResponseStatusEnum>[
    revoked,
  ];

  static RevokeInvitation200ResponseStatusEnum? fromJson(dynamic value) =>
      RevokeInvitation200ResponseStatusEnumTypeTransformer().decode(value);

  static List<RevokeInvitation200ResponseStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RevokeInvitation200ResponseStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RevokeInvitation200ResponseStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RevokeInvitation200ResponseStatusEnum] to String,
/// and [decode] dynamic data back to [RevokeInvitation200ResponseStatusEnum].
class RevokeInvitation200ResponseStatusEnumTypeTransformer {
  factory RevokeInvitation200ResponseStatusEnumTypeTransformer() =>
      _instance ??=
          const RevokeInvitation200ResponseStatusEnumTypeTransformer._();

  const RevokeInvitation200ResponseStatusEnumTypeTransformer._();

  String encode(RevokeInvitation200ResponseStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RevokeInvitation200ResponseStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RevokeInvitation200ResponseStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'revoked':
          return RevokeInvitation200ResponseStatusEnum.revoked;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RevokeInvitation200ResponseStatusEnumTypeTransformer] instance.
  static RevokeInvitation200ResponseStatusEnumTypeTransformer? _instance;
}
