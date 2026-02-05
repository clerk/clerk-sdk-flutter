//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SchemasFeatureResponse {
  /// Returns a new [SchemasFeatureResponse] instance.
  SchemasFeatureResponse({
    required this.object,
    required this.id,
    required this.name,
    required this.description,
    required this.slug,
    required this.avatarUrl,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  SchemasFeatureResponseObjectEnum object;

  /// Unique identifier for the feature.
  String id;

  /// The name of the feature.
  String name;

  /// The description of the feature.
  String description;

  /// The URL-friendly slug for the feature.
  String slug;

  /// The URL of the feature's avatar image.
  String avatarUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemasFeatureResponse &&
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
      (description.hashCode) +
      (slug.hashCode) +
      (avatarUrl.hashCode);

  @override
  String toString() =>
      'SchemasFeatureResponse[object=$object, id=$id, name=$name, description=$description, slug=$slug, avatarUrl=$avatarUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'description'] = this.description;
    json[r'slug'] = this.slug;
    json[r'avatar_url'] = this.avatarUrl;
    return json;
  }

  /// Returns a new [SchemasFeatureResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SchemasFeatureResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SchemasFeatureResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SchemasFeatureResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SchemasFeatureResponse(
        object: SchemasFeatureResponseObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description')!,
        slug: mapValueOfType<String>(json, r'slug')!,
        avatarUrl: mapValueOfType<String>(json, r'avatar_url')!,
      );
    }
    return null;
  }

  static List<SchemasFeatureResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasFeatureResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasFeatureResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SchemasFeatureResponse> mapFromJson(dynamic json) {
    final map = <String, SchemasFeatureResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SchemasFeatureResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SchemasFeatureResponse-objects as value to a dart map
  static Map<String, List<SchemasFeatureResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SchemasFeatureResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SchemasFeatureResponse.listFromJson(
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
class SchemasFeatureResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasFeatureResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const feature = SchemasFeatureResponseObjectEnum._(r'feature');

  /// List of all possible values in this [enum][SchemasFeatureResponseObjectEnum].
  static const values = <SchemasFeatureResponseObjectEnum>[
    feature,
  ];

  static SchemasFeatureResponseObjectEnum? fromJson(dynamic value) =>
      SchemasFeatureResponseObjectEnumTypeTransformer().decode(value);

  static List<SchemasFeatureResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasFeatureResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasFeatureResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasFeatureResponseObjectEnum] to String,
/// and [decode] dynamic data back to [SchemasFeatureResponseObjectEnum].
class SchemasFeatureResponseObjectEnumTypeTransformer {
  factory SchemasFeatureResponseObjectEnumTypeTransformer() =>
      _instance ??= const SchemasFeatureResponseObjectEnumTypeTransformer._();

  const SchemasFeatureResponseObjectEnumTypeTransformer._();

  String encode(SchemasFeatureResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasFeatureResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasFeatureResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'feature':
          return SchemasFeatureResponseObjectEnum.feature;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasFeatureResponseObjectEnumTypeTransformer] instance.
  static SchemasFeatureResponseObjectEnumTypeTransformer? _instance;
}
