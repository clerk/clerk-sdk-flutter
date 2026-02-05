//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MachineScope {
  /// Returns a new [MachineScope] instance.
  MachineScope({
    required this.object,
    required this.fromMachineId,
    required this.toMachineId,
    required this.createdAt,
  });

  MachineScopeObjectEnum object;

  /// The ID of the machine that has access to the target machine.
  String fromMachineId;

  /// The ID of the machine that is being accessed.
  String toMachineId;

  /// Unix timestamp of creation.
  int createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachineScope &&
          other.object == object &&
          other.fromMachineId == fromMachineId &&
          other.toMachineId == toMachineId &&
          other.createdAt == createdAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (fromMachineId.hashCode) +
      (toMachineId.hashCode) +
      (createdAt.hashCode);

  @override
  String toString() =>
      'MachineScope[object=$object, fromMachineId=$fromMachineId, toMachineId=$toMachineId, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'from_machine_id'] = this.fromMachineId;
    json[r'to_machine_id'] = this.toMachineId;
    json[r'created_at'] = this.createdAt;
    return json;
  }

  /// Returns a new [MachineScope] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MachineScope? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MachineScope[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MachineScope[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MachineScope(
        object: MachineScopeObjectEnum.fromJson(json[r'object'])!,
        fromMachineId: mapValueOfType<String>(json, r'from_machine_id')!,
        toMachineId: mapValueOfType<String>(json, r'to_machine_id')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
      );
    }
    return null;
  }

  static List<MachineScope> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MachineScope>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MachineScope.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MachineScope> mapFromJson(dynamic json) {
    final map = <String, MachineScope>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MachineScope.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MachineScope-objects as value to a dart map
  static Map<String, List<MachineScope>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MachineScope>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MachineScope.listFromJson(
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
    'from_machine_id',
    'to_machine_id',
    'created_at',
  };
}

class MachineScopeObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const MachineScopeObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const machineScope = MachineScopeObjectEnum._(r'machine_scope');

  /// List of all possible values in this [enum][MachineScopeObjectEnum].
  static const values = <MachineScopeObjectEnum>[
    machineScope,
  ];

  static MachineScopeObjectEnum? fromJson(dynamic value) =>
      MachineScopeObjectEnumTypeTransformer().decode(value);

  static List<MachineScopeObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MachineScopeObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MachineScopeObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MachineScopeObjectEnum] to String,
/// and [decode] dynamic data back to [MachineScopeObjectEnum].
class MachineScopeObjectEnumTypeTransformer {
  factory MachineScopeObjectEnumTypeTransformer() =>
      _instance ??= const MachineScopeObjectEnumTypeTransformer._();

  const MachineScopeObjectEnumTypeTransformer._();

  String encode(MachineScopeObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a MachineScopeObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MachineScopeObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'machine_scope':
          return MachineScopeObjectEnum.machineScope;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MachineScopeObjectEnumTypeTransformer] instance.
  static MachineScopeObjectEnumTypeTransformer? _instance;
}
