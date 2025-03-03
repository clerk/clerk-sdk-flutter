//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationInvitation {
  /// Returns a new [OrganizationInvitation] instance.
  OrganizationInvitation({
    required this.object,
    required this.id,
    required this.emailAddress,
    required this.role,
    required this.roleName,
    this.organizationId,
    this.status,
    this.publicMetadata = const {},
    this.privateMetadata = const {},
    required this.url,
    required this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  OrganizationInvitationObjectEnum object;

  String id;

  String emailAddress;

  String role;

  String roleName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? organizationId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  Map<String, Object> publicMetadata;

  Map<String, Object> privateMetadata;

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
      other is OrganizationInvitation &&
          other.object == object &&
          other.id == id &&
          other.emailAddress == emailAddress &&
          other.role == role &&
          other.roleName == roleName &&
          other.organizationId == organizationId &&
          other.status == status &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          _deepEquality.equals(other.privateMetadata, privateMetadata) &&
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
      (role.hashCode) +
      (roleName.hashCode) +
      (organizationId == null ? 0 : organizationId!.hashCode) +
      (status == null ? 0 : status!.hashCode) +
      (publicMetadata.hashCode) +
      (privateMetadata.hashCode) +
      (url == null ? 0 : url!.hashCode) +
      (expiresAt == null ? 0 : expiresAt!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'OrganizationInvitation[object=$object, id=$id, emailAddress=$emailAddress, role=$role, roleName=$roleName, organizationId=$organizationId, status=$status, publicMetadata=$publicMetadata, privateMetadata=$privateMetadata, url=$url, expiresAt=$expiresAt, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'email_address'] = this.emailAddress;
    json[r'role'] = this.role;
    json[r'role_name'] = this.roleName;
    if (this.organizationId != null) {
      json[r'organization_id'] = this.organizationId;
    } else {
      json[r'organization_id'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    json[r'public_metadata'] = this.publicMetadata;
    json[r'private_metadata'] = this.privateMetadata;
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

  /// Returns a new [OrganizationInvitation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrganizationInvitation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OrganizationInvitation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OrganizationInvitation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrganizationInvitation(
        object: OrganizationInvitationObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        role: mapValueOfType<String>(json, r'role')!,
        roleName: mapValueOfType<String>(json, r'role_name')!,
        organizationId: mapValueOfType<String>(json, r'organization_id'),
        status: mapValueOfType<String>(json, r'status'),
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata')!,
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
        url: mapValueOfType<String>(json, r'url'),
        expiresAt: mapValueOfType<int>(json, r'expires_at'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<OrganizationInvitation> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationInvitation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationInvitation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrganizationInvitation> mapFromJson(dynamic json) {
    final map = <String, OrganizationInvitation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrganizationInvitation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrganizationInvitation-objects as value to a dart map
  static Map<String, List<OrganizationInvitation>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OrganizationInvitation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrganizationInvitation.listFromJson(
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
    'role',
    'role_name',
    'public_metadata',
    'url',
    'expires_at',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class OrganizationInvitationObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const OrganizationInvitationObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const organizationInvitation =
      OrganizationInvitationObjectEnum._(r'organization_invitation');

  /// List of all possible values in this [enum][OrganizationInvitationObjectEnum].
  static const values = <OrganizationInvitationObjectEnum>[
    organizationInvitation,
  ];

  static OrganizationInvitationObjectEnum? fromJson(dynamic value) =>
      OrganizationInvitationObjectEnumTypeTransformer().decode(value);

  static List<OrganizationInvitationObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationInvitationObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationInvitationObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrganizationInvitationObjectEnum] to String,
/// and [decode] dynamic data back to [OrganizationInvitationObjectEnum].
class OrganizationInvitationObjectEnumTypeTransformer {
  factory OrganizationInvitationObjectEnumTypeTransformer() =>
      _instance ??= const OrganizationInvitationObjectEnumTypeTransformer._();

  const OrganizationInvitationObjectEnumTypeTransformer._();

  String encode(OrganizationInvitationObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OrganizationInvitationObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrganizationInvitationObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'organization_invitation':
          return OrganizationInvitationObjectEnum.organizationInvitation;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OrganizationInvitationObjectEnumTypeTransformer] instance.
  static OrganizationInvitationObjectEnumTypeTransformer? _instance;
}
