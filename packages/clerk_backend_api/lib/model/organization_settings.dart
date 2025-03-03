//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationSettings {
  /// Returns a new [OrganizationSettings] instance.
  OrganizationSettings({
    required this.object,
    required this.enabled,
    required this.maxAllowedMemberships,
    required this.maxAllowedRoles,
    required this.maxAllowedPermissions,
    required this.creatorRole,
    required this.adminDeleteEnabled,
    required this.domainsEnabled,
    this.domainsEnrollmentModes = const [],
    required this.domainsDefaultRole,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  OrganizationSettingsObjectEnum object;

  bool enabled;

  int maxAllowedMemberships;

  int maxAllowedRoles;

  int maxAllowedPermissions;

  /// The role key that a user will be assigned after creating an organization.
  String creatorRole;

  /// The default for whether an admin can delete an organization with the Frontend API.
  bool adminDeleteEnabled;

  bool domainsEnabled;

  List<OrganizationSettingsDomainsEnrollmentModesEnum> domainsEnrollmentModes;

  /// The role key that it will be used in order to create an organization invitation or suggestion.
  String domainsDefaultRole;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationSettings &&
          other.object == object &&
          other.enabled == enabled &&
          other.maxAllowedMemberships == maxAllowedMemberships &&
          other.maxAllowedRoles == maxAllowedRoles &&
          other.maxAllowedPermissions == maxAllowedPermissions &&
          other.creatorRole == creatorRole &&
          other.adminDeleteEnabled == adminDeleteEnabled &&
          other.domainsEnabled == domainsEnabled &&
          _deepEquality.equals(
              other.domainsEnrollmentModes, domainsEnrollmentModes) &&
          other.domainsDefaultRole == domainsDefaultRole;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (enabled.hashCode) +
      (maxAllowedMemberships.hashCode) +
      (maxAllowedRoles.hashCode) +
      (maxAllowedPermissions.hashCode) +
      (creatorRole.hashCode) +
      (adminDeleteEnabled.hashCode) +
      (domainsEnabled.hashCode) +
      (domainsEnrollmentModes.hashCode) +
      (domainsDefaultRole.hashCode);

  @override
  String toString() =>
      'OrganizationSettings[object=$object, enabled=$enabled, maxAllowedMemberships=$maxAllowedMemberships, maxAllowedRoles=$maxAllowedRoles, maxAllowedPermissions=$maxAllowedPermissions, creatorRole=$creatorRole, adminDeleteEnabled=$adminDeleteEnabled, domainsEnabled=$domainsEnabled, domainsEnrollmentModes=$domainsEnrollmentModes, domainsDefaultRole=$domainsDefaultRole]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'enabled'] = this.enabled;
    json[r'max_allowed_memberships'] = this.maxAllowedMemberships;
    json[r'max_allowed_roles'] = this.maxAllowedRoles;
    json[r'max_allowed_permissions'] = this.maxAllowedPermissions;
    json[r'creator_role'] = this.creatorRole;
    json[r'admin_delete_enabled'] = this.adminDeleteEnabled;
    json[r'domains_enabled'] = this.domainsEnabled;
    json[r'domains_enrollment_modes'] = this.domainsEnrollmentModes;
    json[r'domains_default_role'] = this.domainsDefaultRole;
    return json;
  }

  /// Returns a new [OrganizationSettings] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrganizationSettings? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OrganizationSettings[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OrganizationSettings[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrganizationSettings(
        object: OrganizationSettingsObjectEnum.fromJson(json[r'object'])!,
        enabled: mapValueOfType<bool>(json, r'enabled')!,
        maxAllowedMemberships:
            mapValueOfType<int>(json, r'max_allowed_memberships')!,
        maxAllowedRoles: mapValueOfType<int>(json, r'max_allowed_roles')!,
        maxAllowedPermissions:
            mapValueOfType<int>(json, r'max_allowed_permissions')!,
        creatorRole: mapValueOfType<String>(json, r'creator_role')!,
        adminDeleteEnabled:
            mapValueOfType<bool>(json, r'admin_delete_enabled')!,
        domainsEnabled: mapValueOfType<bool>(json, r'domains_enabled')!,
        domainsEnrollmentModes:
            OrganizationSettingsDomainsEnrollmentModesEnum.listFromJson(
                json[r'domains_enrollment_modes']),
        domainsDefaultRole:
            mapValueOfType<String>(json, r'domains_default_role')!,
      );
    }
    return null;
  }

  static List<OrganizationSettings> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationSettings>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationSettings.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrganizationSettings> mapFromJson(dynamic json) {
    final map = <String, OrganizationSettings>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrganizationSettings.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrganizationSettings-objects as value to a dart map
  static Map<String, List<OrganizationSettings>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OrganizationSettings>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrganizationSettings.listFromJson(
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
    'enabled',
    'max_allowed_memberships',
    'max_allowed_roles',
    'max_allowed_permissions',
    'creator_role',
    'admin_delete_enabled',
    'domains_enabled',
    'domains_enrollment_modes',
    'domains_default_role',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class OrganizationSettingsObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const OrganizationSettingsObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const organizationSettings =
      OrganizationSettingsObjectEnum._(r'organization_settings');

  /// List of all possible values in this [enum][OrganizationSettingsObjectEnum].
  static const values = <OrganizationSettingsObjectEnum>[
    organizationSettings,
  ];

  static OrganizationSettingsObjectEnum? fromJson(dynamic value) =>
      OrganizationSettingsObjectEnumTypeTransformer().decode(value);

  static List<OrganizationSettingsObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationSettingsObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationSettingsObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrganizationSettingsObjectEnum] to String,
/// and [decode] dynamic data back to [OrganizationSettingsObjectEnum].
class OrganizationSettingsObjectEnumTypeTransformer {
  factory OrganizationSettingsObjectEnumTypeTransformer() =>
      _instance ??= const OrganizationSettingsObjectEnumTypeTransformer._();

  const OrganizationSettingsObjectEnumTypeTransformer._();

  String encode(OrganizationSettingsObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OrganizationSettingsObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrganizationSettingsObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'organization_settings':
          return OrganizationSettingsObjectEnum.organizationSettings;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OrganizationSettingsObjectEnumTypeTransformer] instance.
  static OrganizationSettingsObjectEnumTypeTransformer? _instance;
}

class OrganizationSettingsDomainsEnrollmentModesEnum {
  /// Instantiate a new enum with the provided [value].
  const OrganizationSettingsDomainsEnrollmentModesEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const manualInvitation =
      OrganizationSettingsDomainsEnrollmentModesEnum._(r'manual_invitation');
  static const automaticInvitation =
      OrganizationSettingsDomainsEnrollmentModesEnum._(r'automatic_invitation');
  static const automaticSuggestion =
      OrganizationSettingsDomainsEnrollmentModesEnum._(r'automatic_suggestion');

  /// List of all possible values in this [enum][OrganizationSettingsDomainsEnrollmentModesEnum].
  static const values = <OrganizationSettingsDomainsEnrollmentModesEnum>[
    manualInvitation,
    automaticInvitation,
    automaticSuggestion,
  ];

  static OrganizationSettingsDomainsEnrollmentModesEnum? fromJson(
          dynamic value) =>
      OrganizationSettingsDomainsEnrollmentModesEnumTypeTransformer()
          .decode(value);

  static List<OrganizationSettingsDomainsEnrollmentModesEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationSettingsDomainsEnrollmentModesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            OrganizationSettingsDomainsEnrollmentModesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrganizationSettingsDomainsEnrollmentModesEnum] to String,
/// and [decode] dynamic data back to [OrganizationSettingsDomainsEnrollmentModesEnum].
class OrganizationSettingsDomainsEnrollmentModesEnumTypeTransformer {
  factory OrganizationSettingsDomainsEnrollmentModesEnumTypeTransformer() =>
      _instance ??=
          const OrganizationSettingsDomainsEnrollmentModesEnumTypeTransformer
              ._();

  const OrganizationSettingsDomainsEnrollmentModesEnumTypeTransformer._();

  String encode(OrganizationSettingsDomainsEnrollmentModesEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a OrganizationSettingsDomainsEnrollmentModesEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrganizationSettingsDomainsEnrollmentModesEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'manual_invitation':
          return OrganizationSettingsDomainsEnrollmentModesEnum
              .manualInvitation;
        case r'automatic_invitation':
          return OrganizationSettingsDomainsEnrollmentModesEnum
              .automaticInvitation;
        case r'automatic_suggestion':
          return OrganizationSettingsDomainsEnrollmentModesEnum
              .automaticSuggestion;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OrganizationSettingsDomainsEnrollmentModesEnumTypeTransformer] instance.
  static OrganizationSettingsDomainsEnrollmentModesEnumTypeTransformer?
      _instance;
}
