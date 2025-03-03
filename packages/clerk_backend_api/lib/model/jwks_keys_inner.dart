//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JWKSKeysInner {
  /// Returns a new [JWKSKeysInner] instance.
  JWKSKeysInner({
    this.use,
    this.kty,
    this.kid,
    this.alg,
    this.n,
    this.e,
    this.x,
    this.crv,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? use;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kty;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kid;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? alg;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? n;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? e;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? x;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? crv;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JWKSKeysInner &&
    other.use == use &&
    other.kty == kty &&
    other.kid == kid &&
    other.alg == alg &&
    other.n == n &&
    other.e == e &&
    other.x == x &&
    other.crv == crv;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (use == null ? 0 : use!.hashCode) +
    (kty == null ? 0 : kty!.hashCode) +
    (kid == null ? 0 : kid!.hashCode) +
    (alg == null ? 0 : alg!.hashCode) +
    (n == null ? 0 : n!.hashCode) +
    (e == null ? 0 : e!.hashCode) +
    (x == null ? 0 : x!.hashCode) +
    (crv == null ? 0 : crv!.hashCode);

  @override
  String toString() => 'JWKSKeysInner[use=$use, kty=$kty, kid=$kid, alg=$alg, n=$n, e=$e, x=$x, crv=$crv]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.use != null) {
      json[r'use'] = this.use;
    } else {
      json[r'use'] = null;
    }
    if (this.kty != null) {
      json[r'kty'] = this.kty;
    } else {
      json[r'kty'] = null;
    }
    if (this.kid != null) {
      json[r'kid'] = this.kid;
    } else {
      json[r'kid'] = null;
    }
    if (this.alg != null) {
      json[r'alg'] = this.alg;
    } else {
      json[r'alg'] = null;
    }
    if (this.n != null) {
      json[r'n'] = this.n;
    } else {
      json[r'n'] = null;
    }
    if (this.e != null) {
      json[r'e'] = this.e;
    } else {
      json[r'e'] = null;
    }
    if (this.x != null) {
      json[r'x'] = this.x;
    } else {
      json[r'x'] = null;
    }
    if (this.crv != null) {
      json[r'crv'] = this.crv;
    } else {
      json[r'crv'] = null;
    }
    return json;
  }

  /// Returns a new [JWKSKeysInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JWKSKeysInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "JWKSKeysInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "JWKSKeysInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return JWKSKeysInner(
        use: mapValueOfType<String>(json, r'use'),
        kty: mapValueOfType<String>(json, r'kty'),
        kid: mapValueOfType<String>(json, r'kid'),
        alg: mapValueOfType<String>(json, r'alg'),
        n: mapValueOfType<String>(json, r'n'),
        e: mapValueOfType<String>(json, r'e'),
        x: mapValueOfType<String>(json, r'x'),
        crv: mapValueOfType<String>(json, r'crv'),
      );
    }
    return null;
  }

  static List<JWKSKeysInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JWKSKeysInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JWKSKeysInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JWKSKeysInner> mapFromJson(dynamic json) {
    final map = <String, JWKSKeysInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JWKSKeysInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JWKSKeysInner-objects as value to a dart map
  static Map<String, List<JWKSKeysInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JWKSKeysInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JWKSKeysInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

