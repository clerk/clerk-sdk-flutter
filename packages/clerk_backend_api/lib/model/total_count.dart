//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TotalCount {
  /// Returns a new [TotalCount] instance.
  TotalCount({
    required this.object,
    required this.totalCount,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  TotalCountObjectEnum object;

  int totalCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalCount &&
          other.object == object &&
          other.totalCount == totalCount;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (totalCount.hashCode);

  @override
  String toString() => 'TotalCount[object=$object, totalCount=$totalCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'total_count'] = this.totalCount;
    return json;
  }

  /// Returns a new [TotalCount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TotalCount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "TotalCount[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "TotalCount[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TotalCount(
        object: TotalCountObjectEnum.fromJson(json[r'object'])!,
        totalCount: mapValueOfType<int>(json, r'total_count')!,
      );
    }
    return null;
  }

  static List<TotalCount> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TotalCount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TotalCount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TotalCount> mapFromJson(dynamic json) {
    final map = <String, TotalCount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TotalCount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TotalCount-objects as value to a dart map
  static Map<String, List<TotalCount>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<TotalCount>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TotalCount.listFromJson(
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
    'total_count',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class TotalCountObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const TotalCountObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const totalCount = TotalCountObjectEnum._(r'total_count');

  /// List of all possible values in this [enum][TotalCountObjectEnum].
  static const values = <TotalCountObjectEnum>[
    totalCount,
  ];

  static TotalCountObjectEnum? fromJson(dynamic value) =>
      TotalCountObjectEnumTypeTransformer().decode(value);

  static List<TotalCountObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TotalCountObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TotalCountObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TotalCountObjectEnum] to String,
/// and [decode] dynamic data back to [TotalCountObjectEnum].
class TotalCountObjectEnumTypeTransformer {
  factory TotalCountObjectEnumTypeTransformer() =>
      _instance ??= const TotalCountObjectEnumTypeTransformer._();

  const TotalCountObjectEnumTypeTransformer._();

  String encode(TotalCountObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a TotalCountObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TotalCountObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'total_count':
          return TotalCountObjectEnum.totalCount;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TotalCountObjectEnumTypeTransformer] instance.
  static TotalCountObjectEnumTypeTransformer? _instance;
}
