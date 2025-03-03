//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Instance {
  /// Returns a new [Instance] instance.
  Instance({
    required this.object,
    required this.id,
    required this.environmentType,
    this.allowedOrigins = const [],
  });

  /// String representing the object's type. Objects of the same type share the same value.
  InstanceObjectEnum object;

  String id;

  String environmentType;

  List<String>? allowedOrigins;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Instance &&
          other.object == object &&
          other.id == id &&
          other.environmentType == environmentType &&
          _deepEquality.equals(other.allowedOrigins, allowedOrigins);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (environmentType.hashCode) +
      (allowedOrigins == null ? 0 : allowedOrigins!.hashCode);

  @override
  String toString() =>
      'Instance[object=$object, id=$id, environmentType=$environmentType, allowedOrigins=$allowedOrigins]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'environment_type'] = this.environmentType;
    if (this.allowedOrigins != null) {
      json[r'allowed_origins'] = this.allowedOrigins;
    } else {
      json[r'allowed_origins'] = null;
    }
    return json;
  }

  /// Returns a new [Instance] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Instance? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Instance[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Instance[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Instance(
        object: InstanceObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        environmentType: mapValueOfType<String>(json, r'environment_type')!,
        allowedOrigins: json[r'allowed_origins'] is Iterable
            ? (json[r'allowed_origins'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<Instance> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Instance>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Instance.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Instance> mapFromJson(dynamic json) {
    final map = <String, Instance>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Instance.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Instance-objects as value to a dart map
  static Map<String, List<Instance>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Instance>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Instance.listFromJson(
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
    'environment_type',
    'allowed_origins',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class InstanceObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const InstanceObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const instance = InstanceObjectEnum._(r'instance');

  /// List of all possible values in this [enum][InstanceObjectEnum].
  static const values = <InstanceObjectEnum>[
    instance,
  ];

  static InstanceObjectEnum? fromJson(dynamic value) =>
      InstanceObjectEnumTypeTransformer().decode(value);

  static List<InstanceObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [InstanceObjectEnum] to String,
/// and [decode] dynamic data back to [InstanceObjectEnum].
class InstanceObjectEnumTypeTransformer {
  factory InstanceObjectEnumTypeTransformer() =>
      _instance ??= const InstanceObjectEnumTypeTransformer._();

  const InstanceObjectEnumTypeTransformer._();

  String encode(InstanceObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a InstanceObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  InstanceObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'instance':
          return InstanceObjectEnum.instance;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [InstanceObjectEnumTypeTransformer] instance.
  static InstanceObjectEnumTypeTransformer? _instance;
}
