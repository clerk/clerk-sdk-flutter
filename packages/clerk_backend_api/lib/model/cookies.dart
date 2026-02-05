//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Cookies {
  /// Returns a new [Cookies] instance.
  Cookies({
    required this.object,
    this.cookies = const [],
  });

  /// String representing the object's type. Objects of the same type share the same value.
  CookiesObjectEnum object;

  /// Array of cookie directives.
  List<String> cookies;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cookies &&
          other.object == object &&
          _deepEquality.equals(other.cookies, cookies);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (cookies.hashCode);

  @override
  String toString() => 'Cookies[object=$object, cookies=$cookies]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'cookies'] = this.cookies;
    return json;
  }

  /// Returns a new [Cookies] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Cookies? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Cookies[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Cookies[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Cookies(
        object: CookiesObjectEnum.fromJson(json[r'object'])!,
        cookies: json[r'cookies'] is Iterable
            ? (json[r'cookies'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<Cookies> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Cookies>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Cookies.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Cookies> mapFromJson(dynamic json) {
    final map = <String, Cookies>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Cookies.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Cookies-objects as value to a dart map
  static Map<String, List<Cookies>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Cookies>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Cookies.listFromJson(
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
    'cookies',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class CookiesObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const CookiesObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const cookies = CookiesObjectEnum._(r'cookies');

  /// List of all possible values in this [enum][CookiesObjectEnum].
  static const values = <CookiesObjectEnum>[
    cookies,
  ];

  static CookiesObjectEnum? fromJson(dynamic value) =>
      CookiesObjectEnumTypeTransformer().decode(value);

  static List<CookiesObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CookiesObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CookiesObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CookiesObjectEnum] to String,
/// and [decode] dynamic data back to [CookiesObjectEnum].
class CookiesObjectEnumTypeTransformer {
  factory CookiesObjectEnumTypeTransformer() =>
      _instance ??= const CookiesObjectEnumTypeTransformer._();

  const CookiesObjectEnumTypeTransformer._();

  String encode(CookiesObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CookiesObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CookiesObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'cookies':
          return CookiesObjectEnum.cookies;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CookiesObjectEnumTypeTransformer] instance.
  static CookiesObjectEnumTypeTransformer? _instance;
}
