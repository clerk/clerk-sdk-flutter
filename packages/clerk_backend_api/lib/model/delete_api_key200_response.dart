//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeleteApiKey200Response {
  /// Returns a new [DeleteApiKey200Response] instance.
  DeleteApiKey200Response({
    required this.id,
    required this.object,
    required this.deleted,
  });

  String id;

  DeleteApiKey200ResponseObjectEnum object;

  bool deleted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteApiKey200Response &&
          other.id == id &&
          other.object == object &&
          other.deleted == deleted;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) + (object.hashCode) + (deleted.hashCode);

  @override
  String toString() =>
      'DeleteApiKey200Response[id=$id, object=$object, deleted=$deleted]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'object'] = this.object;
    json[r'deleted'] = this.deleted;
    return json;
  }

  /// Returns a new [DeleteApiKey200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeleteApiKey200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "DeleteApiKey200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "DeleteApiKey200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DeleteApiKey200Response(
        id: mapValueOfType<String>(json, r'id')!,
        object: DeleteApiKey200ResponseObjectEnum.fromJson(json[r'object'])!,
        deleted: mapValueOfType<bool>(json, r'deleted')!,
      );
    }
    return null;
  }

  static List<DeleteApiKey200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DeleteApiKey200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeleteApiKey200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeleteApiKey200Response> mapFromJson(dynamic json) {
    final map = <String, DeleteApiKey200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeleteApiKey200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeleteApiKey200Response-objects as value to a dart map
  static Map<String, List<DeleteApiKey200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<DeleteApiKey200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeleteApiKey200Response.listFromJson(
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
    'deleted',
  };
}

class DeleteApiKey200ResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const DeleteApiKey200ResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const apiKey = DeleteApiKey200ResponseObjectEnum._(r'api_key');

  /// List of all possible values in this [enum][DeleteApiKey200ResponseObjectEnum].
  static const values = <DeleteApiKey200ResponseObjectEnum>[
    apiKey,
  ];

  static DeleteApiKey200ResponseObjectEnum? fromJson(dynamic value) =>
      DeleteApiKey200ResponseObjectEnumTypeTransformer().decode(value);

  static List<DeleteApiKey200ResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DeleteApiKey200ResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeleteApiKey200ResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DeleteApiKey200ResponseObjectEnum] to String,
/// and [decode] dynamic data back to [DeleteApiKey200ResponseObjectEnum].
class DeleteApiKey200ResponseObjectEnumTypeTransformer {
  factory DeleteApiKey200ResponseObjectEnumTypeTransformer() =>
      _instance ??= const DeleteApiKey200ResponseObjectEnumTypeTransformer._();

  const DeleteApiKey200ResponseObjectEnumTypeTransformer._();

  String encode(DeleteApiKey200ResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a DeleteApiKey200ResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DeleteApiKey200ResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'api_key':
          return DeleteApiKey200ResponseObjectEnum.apiKey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [DeleteApiKey200ResponseObjectEnumTypeTransformer] instance.
  static DeleteApiKey200ResponseObjectEnumTypeTransformer? _instance;
}
