//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RoleSetMigration {
  /// Returns a new [RoleSetMigration] instance.
  RoleSetMigration({
    required this.object,
    required this.id,
    this.organizationId,
    required this.instanceId,
    required this.sourceRoleSetId,
    this.destRoleSetId,
    required this.triggerType,
    required this.status,
    required this.migratedMembers,
    this.mappings = const {},
    this.startedAt,
    this.completedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  RoleSetMigrationObjectEnum object;

  /// The unique identifier of the migration
  String id;

  /// The organization ID if the migration is scoped to a specific organization
  String? organizationId;

  /// The instance ID this migration belongs to
  String instanceId;

  /// The ID of the source role set being migrated from
  String sourceRoleSetId;

  /// The ID of the destination role set being migrated to
  String? destRoleSetId;

  /// What triggered this migration (e.g., \"role_set_deletion\", \"role_removal\")
  String triggerType;

  /// Current status of the migration (e.g., \"enqueued\", \"in_progress\", \"completed\")
  String status;

  /// Number of members that have been migrated so far
  int migratedMembers;

  /// Role key mappings from source to destination roles
  Map<String, String>? mappings;

  /// Unix timestamp when the migration started
  int? startedAt;

  /// Unix timestamp when the migration completed
  int? completedAt;

  /// Unix timestamp of migration creation
  int createdAt;

  /// Unix timestamp of last migration update
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleSetMigration &&
          other.object == object &&
          other.id == id &&
          other.organizationId == organizationId &&
          other.instanceId == instanceId &&
          other.sourceRoleSetId == sourceRoleSetId &&
          other.destRoleSetId == destRoleSetId &&
          other.triggerType == triggerType &&
          other.status == status &&
          other.migratedMembers == migratedMembers &&
          _deepEquality.equals(other.mappings, mappings) &&
          other.startedAt == startedAt &&
          other.completedAt == completedAt &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (organizationId == null ? 0 : organizationId!.hashCode) +
      (instanceId.hashCode) +
      (sourceRoleSetId.hashCode) +
      (destRoleSetId == null ? 0 : destRoleSetId!.hashCode) +
      (triggerType.hashCode) +
      (status.hashCode) +
      (migratedMembers.hashCode) +
      (mappings == null ? 0 : mappings!.hashCode) +
      (startedAt == null ? 0 : startedAt!.hashCode) +
      (completedAt == null ? 0 : completedAt!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'RoleSetMigration[object=$object, id=$id, organizationId=$organizationId, instanceId=$instanceId, sourceRoleSetId=$sourceRoleSetId, destRoleSetId=$destRoleSetId, triggerType=$triggerType, status=$status, migratedMembers=$migratedMembers, mappings=$mappings, startedAt=$startedAt, completedAt=$completedAt, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    if (this.organizationId != null) {
      json[r'organization_id'] = this.organizationId;
    } else {
      json[r'organization_id'] = null;
    }
    json[r'instance_id'] = this.instanceId;
    json[r'source_role_set_id'] = this.sourceRoleSetId;
    if (this.destRoleSetId != null) {
      json[r'dest_role_set_id'] = this.destRoleSetId;
    } else {
      json[r'dest_role_set_id'] = null;
    }
    json[r'trigger_type'] = this.triggerType;
    json[r'status'] = this.status;
    json[r'migrated_members'] = this.migratedMembers;
    if (this.mappings != null) {
      json[r'mappings'] = this.mappings;
    } else {
      json[r'mappings'] = null;
    }
    if (this.startedAt != null) {
      json[r'started_at'] = this.startedAt;
    } else {
      json[r'started_at'] = null;
    }
    if (this.completedAt != null) {
      json[r'completed_at'] = this.completedAt;
    } else {
      json[r'completed_at'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [RoleSetMigration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RoleSetMigration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RoleSetMigration[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RoleSetMigration[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RoleSetMigration(
        object: RoleSetMigrationObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        organizationId: mapValueOfType<String>(json, r'organization_id'),
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        sourceRoleSetId: mapValueOfType<String>(json, r'source_role_set_id')!,
        destRoleSetId: mapValueOfType<String>(json, r'dest_role_set_id'),
        triggerType: mapValueOfType<String>(json, r'trigger_type')!,
        status: mapValueOfType<String>(json, r'status')!,
        migratedMembers: mapValueOfType<int>(json, r'migrated_members')!,
        mappings: mapCastOfType<String, String>(json, r'mappings') ?? const {},
        startedAt: mapValueOfType<int>(json, r'started_at'),
        completedAt: mapValueOfType<int>(json, r'completed_at'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<RoleSetMigration> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RoleSetMigration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleSetMigration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RoleSetMigration> mapFromJson(dynamic json) {
    final map = <String, RoleSetMigration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RoleSetMigration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RoleSetMigration-objects as value to a dart map
  static Map<String, List<RoleSetMigration>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RoleSetMigration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RoleSetMigration.listFromJson(
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
    'instance_id',
    'source_role_set_id',
    'trigger_type',
    'status',
    'migrated_members',
    'created_at',
    'updated_at',
  };
}

class RoleSetMigrationObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const RoleSetMigrationObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const roleSetMigration =
      RoleSetMigrationObjectEnum._(r'role_set_migration');

  /// List of all possible values in this [enum][RoleSetMigrationObjectEnum].
  static const values = <RoleSetMigrationObjectEnum>[
    roleSetMigration,
  ];

  static RoleSetMigrationObjectEnum? fromJson(dynamic value) =>
      RoleSetMigrationObjectEnumTypeTransformer().decode(value);

  static List<RoleSetMigrationObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RoleSetMigrationObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleSetMigrationObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RoleSetMigrationObjectEnum] to String,
/// and [decode] dynamic data back to [RoleSetMigrationObjectEnum].
class RoleSetMigrationObjectEnumTypeTransformer {
  factory RoleSetMigrationObjectEnumTypeTransformer() =>
      _instance ??= const RoleSetMigrationObjectEnumTypeTransformer._();

  const RoleSetMigrationObjectEnumTypeTransformer._();

  String encode(RoleSetMigrationObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RoleSetMigrationObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RoleSetMigrationObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'role_set_migration':
          return RoleSetMigrationObjectEnum.roleSetMigration;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RoleSetMigrationObjectEnumTypeTransformer] instance.
  static RoleSetMigrationObjectEnumTypeTransformer? _instance;
}
