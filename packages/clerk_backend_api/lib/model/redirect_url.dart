//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RedirectURL {
  /// Returns a new [RedirectURL] instance.
  RedirectURL({
    required this.object,
    required this.id,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  RedirectURLObjectEnum object;

  String id;

  String url;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RedirectURL &&
          other.object == object &&
          other.id == id &&
          other.url == url &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (url.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'RedirectURL[object=$object, id=$id, url=$url, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'url'] = this.url;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [RedirectURL] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RedirectURL? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RedirectURL[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RedirectURL[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RedirectURL(
        object: RedirectURLObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        url: mapValueOfType<String>(json, r'url')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<RedirectURL> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RedirectURL>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RedirectURL.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RedirectURL> mapFromJson(dynamic json) {
    final map = <String, RedirectURL>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RedirectURL.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RedirectURL-objects as value to a dart map
  static Map<String, List<RedirectURL>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RedirectURL>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RedirectURL.listFromJson(
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
    'url',
    'created_at',
    'updated_at',
  };
}

class RedirectURLObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const RedirectURLObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const redirectUrl = RedirectURLObjectEnum._(r'redirect_url');

  /// List of all possible values in this [enum][RedirectURLObjectEnum].
  static const values = <RedirectURLObjectEnum>[
    redirectUrl,
  ];

  static RedirectURLObjectEnum? fromJson(dynamic value) =>
      RedirectURLObjectEnumTypeTransformer().decode(value);

  static List<RedirectURLObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RedirectURLObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RedirectURLObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RedirectURLObjectEnum] to String,
/// and [decode] dynamic data back to [RedirectURLObjectEnum].
class RedirectURLObjectEnumTypeTransformer {
  factory RedirectURLObjectEnumTypeTransformer() =>
      _instance ??= const RedirectURLObjectEnumTypeTransformer._();

  const RedirectURLObjectEnumTypeTransformer._();

  String encode(RedirectURLObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RedirectURLObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RedirectURLObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'redirect_url':
          return RedirectURLObjectEnum.redirectUrl;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RedirectURLObjectEnumTypeTransformer] instance.
  static RedirectURLObjectEnumTypeTransformer? _instance;
}
