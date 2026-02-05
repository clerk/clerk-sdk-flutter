//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetMachineSecretKey200Response {
  /// Returns a new [GetMachineSecretKey200Response] instance.
  GetMachineSecretKey200Response({
    required this.object,
    required this.secret,
  });

  /// String representing the object's type.
  GetMachineSecretKey200ResponseObjectEnum object;

  /// The secret key for the machine.
  String secret;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetMachineSecretKey200Response &&
          other.object == object &&
          other.secret == secret;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (secret.hashCode);

  @override
  String toString() =>
      'GetMachineSecretKey200Response[object=$object, secret=$secret]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'secret'] = this.secret;
    return json;
  }

  /// Returns a new [GetMachineSecretKey200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetMachineSecretKey200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GetMachineSecretKey200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GetMachineSecretKey200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetMachineSecretKey200Response(
        object:
            GetMachineSecretKey200ResponseObjectEnum.fromJson(json[r'object'])!,
        secret: mapValueOfType<String>(json, r'secret')!,
      );
    }
    return null;
  }

  static List<GetMachineSecretKey200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GetMachineSecretKey200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetMachineSecretKey200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetMachineSecretKey200Response> mapFromJson(dynamic json) {
    final map = <String, GetMachineSecretKey200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetMachineSecretKey200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetMachineSecretKey200Response-objects as value to a dart map
  static Map<String, List<GetMachineSecretKey200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GetMachineSecretKey200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetMachineSecretKey200Response.listFromJson(
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
    'secret',
  };
}

/// String representing the object's type.
class GetMachineSecretKey200ResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const GetMachineSecretKey200ResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const machineSecretKey =
      GetMachineSecretKey200ResponseObjectEnum._(r'machine_secret_key');

  /// List of all possible values in this [enum][GetMachineSecretKey200ResponseObjectEnum].
  static const values = <GetMachineSecretKey200ResponseObjectEnum>[
    machineSecretKey,
  ];

  static GetMachineSecretKey200ResponseObjectEnum? fromJson(dynamic value) =>
      GetMachineSecretKey200ResponseObjectEnumTypeTransformer().decode(value);

  static List<GetMachineSecretKey200ResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GetMachineSecretKey200ResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetMachineSecretKey200ResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetMachineSecretKey200ResponseObjectEnum] to String,
/// and [decode] dynamic data back to [GetMachineSecretKey200ResponseObjectEnum].
class GetMachineSecretKey200ResponseObjectEnumTypeTransformer {
  factory GetMachineSecretKey200ResponseObjectEnumTypeTransformer() =>
      _instance ??=
          const GetMachineSecretKey200ResponseObjectEnumTypeTransformer._();

  const GetMachineSecretKey200ResponseObjectEnumTypeTransformer._();

  String encode(GetMachineSecretKey200ResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a GetMachineSecretKey200ResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetMachineSecretKey200ResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'machine_secret_key':
          return GetMachineSecretKey200ResponseObjectEnum.machineSecretKey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [GetMachineSecretKey200ResponseObjectEnumTypeTransformer] instance.
  static GetMachineSecretKey200ResponseObjectEnumTypeTransformer? _instance;
}
