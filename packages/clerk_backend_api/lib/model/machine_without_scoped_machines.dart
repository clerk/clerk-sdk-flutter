//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MachineWithoutScopedMachines {
  /// Returns a new [MachineWithoutScopedMachines] instance.
  MachineWithoutScopedMachines({
    required this.object,
    required this.id,
    required this.name,
    required this.instanceId,
    required this.createdAt,
    required this.updatedAt,
    this.defaultTokenTtl = 3600,
  });

  MachineWithoutScopedMachinesObjectEnum object;

  /// Unique identifier for the machine.
  String id;

  /// The name of the machine.
  String name;

  /// The ID of the instance this machine belongs to.
  String instanceId;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  /// The default time-to-live (TTL) in seconds for tokens created by this machine.
  ///
  /// Minimum value: 1
  int defaultTokenTtl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachineWithoutScopedMachines &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.instanceId == instanceId &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.defaultTokenTtl == defaultTokenTtl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (instanceId.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode) +
      (defaultTokenTtl.hashCode);

  @override
  String toString() =>
      'MachineWithoutScopedMachines[object=$object, id=$id, name=$name, instanceId=$instanceId, createdAt=$createdAt, updatedAt=$updatedAt, defaultTokenTtl=$defaultTokenTtl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'instance_id'] = this.instanceId;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    json[r'default_token_ttl'] = this.defaultTokenTtl;
    return json;
  }

  /// Returns a new [MachineWithoutScopedMachines] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MachineWithoutScopedMachines? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MachineWithoutScopedMachines[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MachineWithoutScopedMachines[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MachineWithoutScopedMachines(
        object:
            MachineWithoutScopedMachinesObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        defaultTokenTtl:
            mapValueOfType<int>(json, r'default_token_ttl') ?? 3600,
      );
    }
    return null;
  }

  static List<MachineWithoutScopedMachines> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MachineWithoutScopedMachines>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MachineWithoutScopedMachines.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MachineWithoutScopedMachines> mapFromJson(dynamic json) {
    final map = <String, MachineWithoutScopedMachines>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MachineWithoutScopedMachines.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MachineWithoutScopedMachines-objects as value to a dart map
  static Map<String, List<MachineWithoutScopedMachines>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MachineWithoutScopedMachines>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MachineWithoutScopedMachines.listFromJson(
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
    'instance_id',
    'created_at',
    'updated_at',
  };
}

class MachineWithoutScopedMachinesObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const MachineWithoutScopedMachinesObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const machine = MachineWithoutScopedMachinesObjectEnum._(r'machine');

  /// List of all possible values in this [enum][MachineWithoutScopedMachinesObjectEnum].
  static const values = <MachineWithoutScopedMachinesObjectEnum>[
    machine,
  ];

  static MachineWithoutScopedMachinesObjectEnum? fromJson(dynamic value) =>
      MachineWithoutScopedMachinesObjectEnumTypeTransformer().decode(value);

  static List<MachineWithoutScopedMachinesObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MachineWithoutScopedMachinesObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MachineWithoutScopedMachinesObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MachineWithoutScopedMachinesObjectEnum] to String,
/// and [decode] dynamic data back to [MachineWithoutScopedMachinesObjectEnum].
class MachineWithoutScopedMachinesObjectEnumTypeTransformer {
  factory MachineWithoutScopedMachinesObjectEnumTypeTransformer() =>
      _instance ??=
          const MachineWithoutScopedMachinesObjectEnumTypeTransformer._();

  const MachineWithoutScopedMachinesObjectEnumTypeTransformer._();

  String encode(MachineWithoutScopedMachinesObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a MachineWithoutScopedMachinesObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MachineWithoutScopedMachinesObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'machine':
          return MachineWithoutScopedMachinesObjectEnum.machine;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MachineWithoutScopedMachinesObjectEnumTypeTransformer] instance.
  static MachineWithoutScopedMachinesObjectEnumTypeTransformer? _instance;
}
