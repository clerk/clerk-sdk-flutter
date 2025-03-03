//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Organization {
  /// Returns a new [Organization] instance.
  Organization({
    required this.object,
    required this.id,
    required this.name,
    required this.slug,
    this.membersCount,
    this.missingMemberWithElevatedPermissions,
    this.pendingInvitationsCount,
    required this.maxAllowedMemberships,
    required this.adminDeleteEnabled,
    this.publicMetadata = const {},
    this.privateMetadata = const {},
    this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  OrganizationObjectEnum object;

  String id;

  String name;

  String slug;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? membersCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? missingMemberWithElevatedPermissions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? pendingInvitationsCount;

  int maxAllowedMemberships;

  bool adminDeleteEnabled;

  Map<String, Object> publicMetadata;

  Map<String, Object> privateMetadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdBy;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Organization &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.slug == slug &&
          other.membersCount == membersCount &&
          other.missingMemberWithElevatedPermissions ==
              missingMemberWithElevatedPermissions &&
          other.pendingInvitationsCount == pendingInvitationsCount &&
          other.maxAllowedMemberships == maxAllowedMemberships &&
          other.adminDeleteEnabled == adminDeleteEnabled &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          _deepEquality.equals(other.privateMetadata, privateMetadata) &&
          other.createdBy == createdBy &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (slug.hashCode) +
      (membersCount == null ? 0 : membersCount!.hashCode) +
      (missingMemberWithElevatedPermissions == null
          ? 0
          : missingMemberWithElevatedPermissions!.hashCode) +
      (pendingInvitationsCount == null
          ? 0
          : pendingInvitationsCount!.hashCode) +
      (maxAllowedMemberships.hashCode) +
      (adminDeleteEnabled.hashCode) +
      (publicMetadata.hashCode) +
      (privateMetadata.hashCode) +
      (createdBy == null ? 0 : createdBy!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'Organization[object=$object, id=$id, name=$name, slug=$slug, membersCount=$membersCount, missingMemberWithElevatedPermissions=$missingMemberWithElevatedPermissions, pendingInvitationsCount=$pendingInvitationsCount, maxAllowedMemberships=$maxAllowedMemberships, adminDeleteEnabled=$adminDeleteEnabled, publicMetadata=$publicMetadata, privateMetadata=$privateMetadata, createdBy=$createdBy, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'slug'] = this.slug;
    if (this.membersCount != null) {
      json[r'members_count'] = this.membersCount;
    } else {
      json[r'members_count'] = null;
    }
    if (this.missingMemberWithElevatedPermissions != null) {
      json[r'missing_member_with_elevated_permissions'] =
          this.missingMemberWithElevatedPermissions;
    } else {
      json[r'missing_member_with_elevated_permissions'] = null;
    }
    if (this.pendingInvitationsCount != null) {
      json[r'pending_invitations_count'] = this.pendingInvitationsCount;
    } else {
      json[r'pending_invitations_count'] = null;
    }
    json[r'max_allowed_memberships'] = this.maxAllowedMemberships;
    json[r'admin_delete_enabled'] = this.adminDeleteEnabled;
    json[r'public_metadata'] = this.publicMetadata;
    json[r'private_metadata'] = this.privateMetadata;
    if (this.createdBy != null) {
      json[r'created_by'] = this.createdBy;
    } else {
      json[r'created_by'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [Organization] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Organization? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Organization[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Organization[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Organization(
        object: OrganizationObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        slug: mapValueOfType<String>(json, r'slug')!,
        membersCount: mapValueOfType<int>(json, r'members_count'),
        missingMemberWithElevatedPermissions: mapValueOfType<bool>(
            json, r'missing_member_with_elevated_permissions'),
        pendingInvitationsCount:
            mapValueOfType<int>(json, r'pending_invitations_count'),
        maxAllowedMemberships:
            mapValueOfType<int>(json, r'max_allowed_memberships')!,
        adminDeleteEnabled:
            mapValueOfType<bool>(json, r'admin_delete_enabled')!,
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata')!,
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata')!,
        createdBy: mapValueOfType<String>(json, r'created_by'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<Organization> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Organization>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Organization.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Organization> mapFromJson(dynamic json) {
    final map = <String, Organization>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Organization.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Organization-objects as value to a dart map
  static Map<String, List<Organization>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Organization>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Organization.listFromJson(
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
    'name',
    'slug',
    'max_allowed_memberships',
    'admin_delete_enabled',
    'public_metadata',
    'private_metadata',
    'created_at',
    'updated_at',
  };
}

class OrganizationObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const OrganizationObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const organization = OrganizationObjectEnum._(r'organization');

  /// List of all possible values in this [enum][OrganizationObjectEnum].
  static const values = <OrganizationObjectEnum>[
    organization,
  ];

  static OrganizationObjectEnum? fromJson(dynamic value) =>
      OrganizationObjectEnumTypeTransformer().decode(value);

  static List<OrganizationObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrganizationObjectEnum] to String,
/// and [decode] dynamic data back to [OrganizationObjectEnum].
class OrganizationObjectEnumTypeTransformer {
  factory OrganizationObjectEnumTypeTransformer() =>
      _instance ??= const OrganizationObjectEnumTypeTransformer._();

  const OrganizationObjectEnumTypeTransformer._();

  String encode(OrganizationObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OrganizationObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrganizationObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'organization':
          return OrganizationObjectEnum.organization;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OrganizationObjectEnumTypeTransformer] instance.
  static OrganizationObjectEnumTypeTransformer? _instance;
}
