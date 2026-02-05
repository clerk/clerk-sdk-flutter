//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceProtect {
  /// Returns a new [InstanceProtect] instance.
  InstanceProtect({
    required this.object,
    required this.rulesEnabled,
    required this.specterEnabled,
  });

  InstanceProtectObjectEnum object;

  bool rulesEnabled;

  bool specterEnabled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceProtect &&
          other.object == object &&
          other.rulesEnabled == rulesEnabled &&
          other.specterEnabled == specterEnabled;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (rulesEnabled.hashCode) + (specterEnabled.hashCode);

  @override
  String toString() =>
      'InstanceProtect[object=$object, rulesEnabled=$rulesEnabled, specterEnabled=$specterEnabled]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'rules_enabled'] = this.rulesEnabled;
    json[r'specter_enabled'] = this.specterEnabled;
    return json;
  }

  /// Returns a new [InstanceProtect] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceProtect? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceProtect[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceProtect[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceProtect(
        object: InstanceProtectObjectEnum.fromJson(json[r'object'])!,
        rulesEnabled: mapValueOfType<bool>(json, r'rules_enabled')!,
        specterEnabled: mapValueOfType<bool>(json, r'specter_enabled')!,
      );
    }
    return null;
  }

  static List<InstanceProtect> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceProtect>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceProtect.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceProtect> mapFromJson(dynamic json) {
    final map = <String, InstanceProtect>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceProtect.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceProtect-objects as value to a dart map
  static Map<String, List<InstanceProtect>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceProtect>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceProtect.listFromJson(
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
    'rules_enabled',
    'specter_enabled',
  };
}

class InstanceProtectObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const InstanceProtectObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const instanceProtect =
      InstanceProtectObjectEnum._(r'instance_protect');

  /// List of all possible values in this [enum][InstanceProtectObjectEnum].
  static const values = <InstanceProtectObjectEnum>[
    instanceProtect,
  ];

  static InstanceProtectObjectEnum? fromJson(dynamic value) =>
      InstanceProtectObjectEnumTypeTransformer().decode(value);

  static List<InstanceProtectObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceProtectObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceProtectObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [InstanceProtectObjectEnum] to String,
/// and [decode] dynamic data back to [InstanceProtectObjectEnum].
class InstanceProtectObjectEnumTypeTransformer {
  factory InstanceProtectObjectEnumTypeTransformer() =>
      _instance ??= const InstanceProtectObjectEnumTypeTransformer._();

  const InstanceProtectObjectEnumTypeTransformer._();

  String encode(InstanceProtectObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a InstanceProtectObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  InstanceProtectObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'instance_protect':
          return InstanceProtectObjectEnum.instanceProtect;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [InstanceProtectObjectEnumTypeTransformer] instance.
  static InstanceProtectObjectEnumTypeTransformer? _instance;
}
