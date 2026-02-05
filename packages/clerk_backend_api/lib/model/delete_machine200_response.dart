//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeleteMachine200Response {
  /// Returns a new [DeleteMachine200Response] instance.
  DeleteMachine200Response({
    required this.object,
    required this.id,
    required this.deleted,
  });

  /// String representing the object's type.
  DeleteMachine200ResponseObjectEnum object;

  /// The ID of the deleted machine
  String id;

  /// Whether the machine was successfully deleted
  bool deleted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteMachine200Response &&
          other.object == object &&
          other.id == id &&
          other.deleted == deleted;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (id.hashCode) + (deleted.hashCode);

  @override
  String toString() =>
      'DeleteMachine200Response[object=$object, id=$id, deleted=$deleted]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'deleted'] = this.deleted;
    return json;
  }

  /// Returns a new [DeleteMachine200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeleteMachine200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "DeleteMachine200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "DeleteMachine200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DeleteMachine200Response(
        object: DeleteMachine200ResponseObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        deleted: mapValueOfType<bool>(json, r'deleted')!,
      );
    }
    return null;
  }

  static List<DeleteMachine200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DeleteMachine200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeleteMachine200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeleteMachine200Response> mapFromJson(dynamic json) {
    final map = <String, DeleteMachine200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeleteMachine200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeleteMachine200Response-objects as value to a dart map
  static Map<String, List<DeleteMachine200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<DeleteMachine200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeleteMachine200Response.listFromJson(
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
    'deleted',
  };
}

/// String representing the object's type.
class DeleteMachine200ResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const DeleteMachine200ResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const machine = DeleteMachine200ResponseObjectEnum._(r'machine');

  /// List of all possible values in this [enum][DeleteMachine200ResponseObjectEnum].
  static const values = <DeleteMachine200ResponseObjectEnum>[
    machine,
  ];

  static DeleteMachine200ResponseObjectEnum? fromJson(dynamic value) =>
      DeleteMachine200ResponseObjectEnumTypeTransformer().decode(value);

  static List<DeleteMachine200ResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DeleteMachine200ResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeleteMachine200ResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DeleteMachine200ResponseObjectEnum] to String,
/// and [decode] dynamic data back to [DeleteMachine200ResponseObjectEnum].
class DeleteMachine200ResponseObjectEnumTypeTransformer {
  factory DeleteMachine200ResponseObjectEnumTypeTransformer() =>
      _instance ??= const DeleteMachine200ResponseObjectEnumTypeTransformer._();

  const DeleteMachine200ResponseObjectEnumTypeTransformer._();

  String encode(DeleteMachine200ResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a DeleteMachine200ResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DeleteMachine200ResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'machine':
          return DeleteMachine200ResponseObjectEnum.machine;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [DeleteMachine200ResponseObjectEnumTypeTransformer] instance.
  static DeleteMachine200ResponseObjectEnumTypeTransformer? _instance;
}
