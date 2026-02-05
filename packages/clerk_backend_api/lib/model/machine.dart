//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Machine {
  /// Returns a new [Machine] instance.
  Machine({
    required this.object,
    required this.id,
    required this.name,
    required this.instanceId,
    required this.createdAt,
    required this.updatedAt,
    this.defaultTokenTtl = 3600,
    this.scopedMachines = const [],
  });

  MachineObjectEnum object;

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

  /// Array of machines this machine has access to.
  List<MachineWithoutScopedMachines> scopedMachines;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Machine &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.instanceId == instanceId &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.defaultTokenTtl == defaultTokenTtl &&
          _deepEquality.equals(other.scopedMachines, scopedMachines);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (instanceId.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode) +
      (defaultTokenTtl.hashCode) +
      (scopedMachines.hashCode);

  @override
  String toString() =>
      'Machine[object=$object, id=$id, name=$name, instanceId=$instanceId, createdAt=$createdAt, updatedAt=$updatedAt, defaultTokenTtl=$defaultTokenTtl, scopedMachines=$scopedMachines]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'instance_id'] = this.instanceId;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    json[r'default_token_ttl'] = this.defaultTokenTtl;
    json[r'scoped_machines'] = this.scopedMachines;
    return json;
  }

  /// Returns a new [Machine] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Machine? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Machine[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Machine[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Machine(
        object: MachineObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        defaultTokenTtl:
            mapValueOfType<int>(json, r'default_token_ttl') ?? 3600,
        scopedMachines:
            MachineWithoutScopedMachines.listFromJson(json[r'scoped_machines']),
      );
    }
    return null;
  }

  static List<Machine> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Machine>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Machine.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Machine> mapFromJson(dynamic json) {
    final map = <String, Machine>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Machine.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Machine-objects as value to a dart map
  static Map<String, List<Machine>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Machine>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Machine.listFromJson(
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
    'scoped_machines',
  };
}

class MachineObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const MachineObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const machine = MachineObjectEnum._(r'machine');

  /// List of all possible values in this [enum][MachineObjectEnum].
  static const values = <MachineObjectEnum>[
    machine,
  ];

  static MachineObjectEnum? fromJson(dynamic value) =>
      MachineObjectEnumTypeTransformer().decode(value);

  static List<MachineObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MachineObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MachineObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MachineObjectEnum] to String,
/// and [decode] dynamic data back to [MachineObjectEnum].
class MachineObjectEnumTypeTransformer {
  factory MachineObjectEnumTypeTransformer() =>
      _instance ??= const MachineObjectEnumTypeTransformer._();

  const MachineObjectEnumTypeTransformer._();

  String encode(MachineObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a MachineObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MachineObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'machine':
          return MachineObjectEnum.machine;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MachineObjectEnumTypeTransformer] instance.
  static MachineObjectEnumTypeTransformer? _instance;
}
