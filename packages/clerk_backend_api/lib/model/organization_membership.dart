//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationMembership {
  /// Returns a new [OrganizationMembership] instance.
  OrganizationMembership({
    required this.id,
    required this.object,
    required this.role,
    this.roleName,
    this.permissions = const [],
    this.publicMetadata = const {},
    this.privateMetadata = const {},
    required this.organization,
    this.publicUserData,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;

  /// String representing the object's type. Objects of the same type share the same value.
  OrganizationMembershipObjectEnum object;

  String role;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? roleName;

  List<String> permissions;

  /// Metadata saved on the organization membership, accessible from both Frontend and Backend APIs
  Map<String, Object> publicMetadata;

  /// Metadata saved on the organization membership, accessible only from the Backend API
  Map<String, Object> privateMetadata;

  Organization organization;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  OrganizationMembershipPublicUserData? publicUserData;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationMembership &&
          other.id == id &&
          other.object == object &&
          other.role == role &&
          other.roleName == roleName &&
          _deepEquality.equals(other.permissions, permissions) &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          _deepEquality.equals(other.privateMetadata, privateMetadata) &&
          other.organization == organization &&
          other.publicUserData == publicUserData &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (object.hashCode) +
      (role.hashCode) +
      (roleName == null ? 0 : roleName!.hashCode) +
      (permissions.hashCode) +
      (publicMetadata.hashCode) +
      (privateMetadata.hashCode) +
      (organization.hashCode) +
      (publicUserData == null ? 0 : publicUserData!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'OrganizationMembership[id=$id, object=$object, role=$role, roleName=$roleName, permissions=$permissions, publicMetadata=$publicMetadata, privateMetadata=$privateMetadata, organization=$organization, publicUserData=$publicUserData, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'object'] = this.object;
    json[r'role'] = this.role;
    if (this.roleName != null) {
      json[r'role_name'] = this.roleName;
    } else {
      json[r'role_name'] = null;
    }
    json[r'permissions'] = this.permissions;
    json[r'public_metadata'] = this.publicMetadata;
    json[r'private_metadata'] = this.privateMetadata;
    json[r'organization'] = this.organization;
    if (this.publicUserData != null) {
      json[r'public_user_data'] = this.publicUserData;
    } else {
      json[r'public_user_data'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [OrganizationMembership] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrganizationMembership? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OrganizationMembership[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OrganizationMembership[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrganizationMembership(
        id: mapValueOfType<String>(json, r'id')!,
        object: OrganizationMembershipObjectEnum.fromJson(json[r'object'])!,
        role: mapValueOfType<String>(json, r'role')!,
        roleName: mapValueOfType<String>(json, r'role_name'),
        permissions: json[r'permissions'] is Iterable
            ? (json[r'permissions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata')!,
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
        organization: Organization.fromJson(json[r'organization'])!,
        publicUserData: OrganizationMembershipPublicUserData.fromJson(
            json[r'public_user_data']),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<OrganizationMembership> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationMembership>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationMembership.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrganizationMembership> mapFromJson(dynamic json) {
    final map = <String, OrganizationMembership>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrganizationMembership.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrganizationMembership-objects as value to a dart map
  static Map<String, List<OrganizationMembership>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OrganizationMembership>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrganizationMembership.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'object',
    'role',
    'permissions',
    'public_metadata',
    'organization',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class OrganizationMembershipObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const OrganizationMembershipObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const organizationMembership =
      OrganizationMembershipObjectEnum._(r'organization_membership');

  /// List of all possible values in this [enum][OrganizationMembershipObjectEnum].
  static const values = <OrganizationMembershipObjectEnum>[
    organizationMembership,
  ];

  static OrganizationMembershipObjectEnum? fromJson(dynamic value) =>
      OrganizationMembershipObjectEnumTypeTransformer().decode(value);

  static List<OrganizationMembershipObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationMembershipObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationMembershipObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrganizationMembershipObjectEnum] to String,
/// and [decode] dynamic data back to [OrganizationMembershipObjectEnum].
class OrganizationMembershipObjectEnumTypeTransformer {
  factory OrganizationMembershipObjectEnumTypeTransformer() =>
      _instance ??= const OrganizationMembershipObjectEnumTypeTransformer._();

  const OrganizationMembershipObjectEnumTypeTransformer._();

  String encode(OrganizationMembershipObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OrganizationMembershipObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrganizationMembershipObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'organization_membership':
          return OrganizationMembershipObjectEnum.organizationMembership;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OrganizationMembershipObjectEnumTypeTransformer] instance.
  static OrganizationMembershipObjectEnumTypeTransformer? _instance;
}
