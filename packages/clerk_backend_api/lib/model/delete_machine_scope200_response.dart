//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeleteMachineScope200Response {
  /// Returns a new [DeleteMachineScope200Response] instance.
  DeleteMachineScope200Response({
    required this.object,
    required this.fromMachineId,
    required this.toMachineId,
    required this.deleted,
  });

  /// String representing the object's type.
  DeleteMachineScope200ResponseObjectEnum object;

  /// The ID of the machine that had access to the target machine
  String fromMachineId;

  /// The ID of the machine that was being accessed
  String toMachineId;

  /// Whether the machine scope was successfully deleted
  bool deleted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteMachineScope200Response &&
          other.object == object &&
          other.fromMachineId == fromMachineId &&
          other.toMachineId == toMachineId &&
          other.deleted == deleted;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (fromMachineId.hashCode) +
      (toMachineId.hashCode) +
      (deleted.hashCode);

  @override
  String toString() =>
      'DeleteMachineScope200Response[object=$object, fromMachineId=$fromMachineId, toMachineId=$toMachineId, deleted=$deleted]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'from_machine_id'] = this.fromMachineId;
    json[r'to_machine_id'] = this.toMachineId;
    json[r'deleted'] = this.deleted;
    return json;
  }

  /// Returns a new [DeleteMachineScope200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeleteMachineScope200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "DeleteMachineScope200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "DeleteMachineScope200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DeleteMachineScope200Response(
        object:
            DeleteMachineScope200ResponseObjectEnum.fromJson(json[r'object'])!,
        fromMachineId: mapValueOfType<String>(json, r'from_machine_id')!,
        toMachineId: mapValueOfType<String>(json, r'to_machine_id')!,
        deleted: mapValueOfType<bool>(json, r'deleted')!,
      );
    }
    return null;
  }

  static List<DeleteMachineScope200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DeleteMachineScope200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeleteMachineScope200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeleteMachineScope200Response> mapFromJson(dynamic json) {
    final map = <String, DeleteMachineScope200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeleteMachineScope200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeleteMachineScope200Response-objects as value to a dart map
  static Map<String, List<DeleteMachineScope200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<DeleteMachineScope200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeleteMachineScope200Response.listFromJson(
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
    'deleted',
  };
}

/// String representing the object's type.
class DeleteMachineScope200ResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const DeleteMachineScope200ResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const machineScope =
      DeleteMachineScope200ResponseObjectEnum._(r'machine_scope');

  /// List of all possible values in this [enum][DeleteMachineScope200ResponseObjectEnum].
  static const values = <DeleteMachineScope200ResponseObjectEnum>[
    machineScope,
  ];

  static DeleteMachineScope200ResponseObjectEnum? fromJson(dynamic value) =>
      DeleteMachineScope200ResponseObjectEnumTypeTransformer().decode(value);

  static List<DeleteMachineScope200ResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DeleteMachineScope200ResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeleteMachineScope200ResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DeleteMachineScope200ResponseObjectEnum] to String,
/// and [decode] dynamic data back to [DeleteMachineScope200ResponseObjectEnum].
class DeleteMachineScope200ResponseObjectEnumTypeTransformer {
  factory DeleteMachineScope200ResponseObjectEnumTypeTransformer() =>
      _instance ??=
          const DeleteMachineScope200ResponseObjectEnumTypeTransformer._();

  const DeleteMachineScope200ResponseObjectEnumTypeTransformer._();

  String encode(DeleteMachineScope200ResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a DeleteMachineScope200ResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DeleteMachineScope200ResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'machine_scope':
          return DeleteMachineScope200ResponseObjectEnum.machineScope;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [DeleteMachineScope200ResponseObjectEnumTypeTransformer] instance.
  static DeleteMachineScope200ResponseObjectEnumTypeTransformer? _instance;
}
