//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SessionRefresh {
  /// Returns a new [SessionRefresh] instance.
  SessionRefresh({
    required this.object,
    required this.jwt,
    this.cookies = const [],
  });

  /// String representing the object's type. Objects of the same type share the same value.
  SessionRefreshObjectEnum object;

  /// String representing the encoded JSON Web Token (JWT) value.
  String jwt;

  /// Array of cookie directives.
  List<String> cookies;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionRefresh &&
          other.object == object &&
          other.jwt == jwt &&
          _deepEquality.equals(other.cookies, cookies);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (jwt.hashCode) + (cookies.hashCode);

  @override
  String toString() =>
      'SessionRefresh[object=$object, jwt=$jwt, cookies=$cookies]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'jwt'] = this.jwt;
    json[r'cookies'] = this.cookies;
    return json;
  }

  /// Returns a new [SessionRefresh] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SessionRefresh? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SessionRefresh[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SessionRefresh[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SessionRefresh(
        object: SessionRefreshObjectEnum.fromJson(json[r'object'])!,
        jwt: mapValueOfType<String>(json, r'jwt')!,
        cookies: json[r'cookies'] is Iterable
            ? (json[r'cookies'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SessionRefresh> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SessionRefresh>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SessionRefresh.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SessionRefresh> mapFromJson(dynamic json) {
    final map = <String, SessionRefresh>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SessionRefresh.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SessionRefresh-objects as value to a dart map
  static Map<String, List<SessionRefresh>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SessionRefresh>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SessionRefresh.listFromJson(
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
    'jwt',
    'cookies',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class SessionRefreshObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SessionRefreshObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const cookies = SessionRefreshObjectEnum._(r'cookies');

  /// List of all possible values in this [enum][SessionRefreshObjectEnum].
  static const values = <SessionRefreshObjectEnum>[
    cookies,
  ];

  static SessionRefreshObjectEnum? fromJson(dynamic value) =>
      SessionRefreshObjectEnumTypeTransformer().decode(value);

  static List<SessionRefreshObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SessionRefreshObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SessionRefreshObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SessionRefreshObjectEnum] to String,
/// and [decode] dynamic data back to [SessionRefreshObjectEnum].
class SessionRefreshObjectEnumTypeTransformer {
  factory SessionRefreshObjectEnumTypeTransformer() =>
      _instance ??= const SessionRefreshObjectEnumTypeTransformer._();

  const SessionRefreshObjectEnumTypeTransformer._();

  String encode(SessionRefreshObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SessionRefreshObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SessionRefreshObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'cookies':
          return SessionRefreshObjectEnum.cookies;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SessionRefreshObjectEnumTypeTransformer] instance.
  static SessionRefreshObjectEnumTypeTransformer? _instance;
}
