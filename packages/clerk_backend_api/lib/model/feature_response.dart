//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeatureResponse {
  /// Returns a new [FeatureResponse] instance.
  FeatureResponse({
    required this.object,
    required this.id,
    required this.name,
    required this.description,
    required this.slug,
    required this.avatarUrl,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  FeatureResponseObjectEnum object;

  /// Unique identifier for the feature.
  String id;

  /// The name of the feature.
  String name;

  /// The description of the feature.
  String? description;

  /// The URL-friendly slug for the feature.
  String slug;

  /// The URL of the feature's avatar image.
  String? avatarUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeatureResponse &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.description == description &&
          other.slug == slug &&
          other.avatarUrl == avatarUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (slug.hashCode) +
      (avatarUrl == null ? 0 : avatarUrl!.hashCode);

  @override
  String toString() =>
      'FeatureResponse[object=$object, id=$id, name=$name, description=$description, slug=$slug, avatarUrl=$avatarUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    json[r'slug'] = this.slug;
    if (this.avatarUrl != null) {
      json[r'avatar_url'] = this.avatarUrl;
    } else {
      json[r'avatar_url'] = null;
    }
    return json;
  }

  /// Returns a new [FeatureResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeatureResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FeatureResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FeatureResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FeatureResponse(
        object: FeatureResponseObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description'),
        slug: mapValueOfType<String>(json, r'slug')!,
        avatarUrl: mapValueOfType<String>(json, r'avatar_url'),
      );
    }
    return null;
  }

  static List<FeatureResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FeatureResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeatureResponse> mapFromJson(dynamic json) {
    final map = <String, FeatureResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeatureResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeatureResponse-objects as value to a dart map
  static Map<String, List<FeatureResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FeatureResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeatureResponse.listFromJson(
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
    'description',
    'slug',
    'avatar_url',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class FeatureResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const FeatureResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const feature = FeatureResponseObjectEnum._(r'feature');

  /// List of all possible values in this [enum][FeatureResponseObjectEnum].
  static const values = <FeatureResponseObjectEnum>[
    feature,
  ];

  static FeatureResponseObjectEnum? fromJson(dynamic value) =>
      FeatureResponseObjectEnumTypeTransformer().decode(value);

  static List<FeatureResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FeatureResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FeatureResponseObjectEnum] to String,
/// and [decode] dynamic data back to [FeatureResponseObjectEnum].
class FeatureResponseObjectEnumTypeTransformer {
  factory FeatureResponseObjectEnumTypeTransformer() =>
      _instance ??= const FeatureResponseObjectEnumTypeTransformer._();

  const FeatureResponseObjectEnumTypeTransformer._();

  String encode(FeatureResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a FeatureResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FeatureResponseObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'feature':
          return FeatureResponseObjectEnum.feature;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [FeatureResponseObjectEnumTypeTransformer] instance.
  static FeatureResponseObjectEnumTypeTransformer? _instance;
}
