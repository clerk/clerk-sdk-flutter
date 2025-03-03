//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JWKSEd25519PublicKey {
  /// Returns a new [JWKSEd25519PublicKey] instance.
  JWKSEd25519PublicKey({
    required this.kid,
    required this.alg,
    required this.use,
    required this.kty,
    required this.crv,
    required this.x,
    this.x5c = const [],
    this.x5t,
    this.x5tHashS256,
    this.x5u,
  });

  String kid;

  String alg;

  String use;

  JWKSEd25519PublicKeyKtyEnum kty;

  JWKSEd25519PublicKeyCrvEnum crv;

  String x;

  List<String> x5c;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? x5t;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? x5tHashS256;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? x5u;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JWKSEd25519PublicKey &&
          other.kid == kid &&
          other.alg == alg &&
          other.use == use &&
          other.kty == kty &&
          other.crv == crv &&
          other.x == x &&
          _deepEquality.equals(other.x5c, x5c) &&
          other.x5t == x5t &&
          other.x5tHashS256 == x5tHashS256 &&
          other.x5u == x5u;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (kid.hashCode) +
      (alg.hashCode) +
      (use.hashCode) +
      (kty.hashCode) +
      (crv.hashCode) +
      (x.hashCode) +
      (x5c.hashCode) +
      (x5t == null ? 0 : x5t!.hashCode) +
      (x5tHashS256 == null ? 0 : x5tHashS256!.hashCode) +
      (x5u == null ? 0 : x5u!.hashCode);

  @override
  String toString() =>
      'JWKSEd25519PublicKey[kid=$kid, alg=$alg, use=$use, kty=$kty, crv=$crv, x=$x, x5c=$x5c, x5t=$x5t, x5tHashS256=$x5tHashS256, x5u=$x5u]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'kid'] = this.kid;
    json[r'alg'] = this.alg;
    json[r'use'] = this.use;
    json[r'kty'] = this.kty;
    json[r'crv'] = this.crv;
    json[r'x'] = this.x;
    json[r'x5c'] = this.x5c;
    if (this.x5t != null) {
      json[r'x5t'] = this.x5t;
    } else {
      json[r'x5t'] = null;
    }
    if (this.x5tHashS256 != null) {
      json[r'x5t#S256'] = this.x5tHashS256;
    } else {
      json[r'x5t#S256'] = null;
    }
    if (this.x5u != null) {
      json[r'x5u'] = this.x5u;
    } else {
      json[r'x5u'] = null;
    }
    return json;
  }

  /// Returns a new [JWKSEd25519PublicKey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JWKSEd25519PublicKey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "JWKSEd25519PublicKey[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "JWKSEd25519PublicKey[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return JWKSEd25519PublicKey(
        kid: mapValueOfType<String>(json, r'kid')!,
        alg: mapValueOfType<String>(json, r'alg')!,
        use: mapValueOfType<String>(json, r'use')!,
        kty: JWKSEd25519PublicKeyKtyEnum.fromJson(json[r'kty'])!,
        crv: JWKSEd25519PublicKeyCrvEnum.fromJson(json[r'crv'])!,
        x: mapValueOfType<String>(json, r'x')!,
        x5c: json[r'x5c'] is Iterable
            ? (json[r'x5c'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        x5t: mapValueOfType<String>(json, r'x5t'),
        x5tHashS256: mapValueOfType<String>(json, r'x5t#S256'),
        x5u: mapValueOfType<String>(json, r'x5u'),
      );
    }
    return null;
  }

  static List<JWKSEd25519PublicKey> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <JWKSEd25519PublicKey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JWKSEd25519PublicKey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JWKSEd25519PublicKey> mapFromJson(dynamic json) {
    final map = <String, JWKSEd25519PublicKey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JWKSEd25519PublicKey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JWKSEd25519PublicKey-objects as value to a dart map
  static Map<String, List<JWKSEd25519PublicKey>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<JWKSEd25519PublicKey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JWKSEd25519PublicKey.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'kid',
    'alg',
    'use',
    'kty',
    'crv',
    'x',
  };
}

class JWKSEd25519PublicKeyKtyEnum {
  /// Instantiate a new enum with the provided [value].
  const JWKSEd25519PublicKeyKtyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const OKP = JWKSEd25519PublicKeyKtyEnum._(r'OKP');

  /// List of all possible values in this [enum][JWKSEd25519PublicKeyKtyEnum].
  static const values = <JWKSEd25519PublicKeyKtyEnum>[
    OKP,
  ];

  static JWKSEd25519PublicKeyKtyEnum? fromJson(dynamic value) =>
      JWKSEd25519PublicKeyKtyEnumTypeTransformer().decode(value);

  static List<JWKSEd25519PublicKeyKtyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <JWKSEd25519PublicKeyKtyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JWKSEd25519PublicKeyKtyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JWKSEd25519PublicKeyKtyEnum] to String,
/// and [decode] dynamic data back to [JWKSEd25519PublicKeyKtyEnum].
class JWKSEd25519PublicKeyKtyEnumTypeTransformer {
  factory JWKSEd25519PublicKeyKtyEnumTypeTransformer() =>
      _instance ??= const JWKSEd25519PublicKeyKtyEnumTypeTransformer._();

  const JWKSEd25519PublicKeyKtyEnumTypeTransformer._();

  String encode(JWKSEd25519PublicKeyKtyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a JWKSEd25519PublicKeyKtyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JWKSEd25519PublicKeyKtyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'OKP':
          return JWKSEd25519PublicKeyKtyEnum.OKP;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [JWKSEd25519PublicKeyKtyEnumTypeTransformer] instance.
  static JWKSEd25519PublicKeyKtyEnumTypeTransformer? _instance;
}

class JWKSEd25519PublicKeyCrvEnum {
  /// Instantiate a new enum with the provided [value].
  const JWKSEd25519PublicKeyCrvEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ed25519 = JWKSEd25519PublicKeyCrvEnum._(r'Ed25519');

  /// List of all possible values in this [enum][JWKSEd25519PublicKeyCrvEnum].
  static const values = <JWKSEd25519PublicKeyCrvEnum>[
    ed25519,
  ];

  static JWKSEd25519PublicKeyCrvEnum? fromJson(dynamic value) =>
      JWKSEd25519PublicKeyCrvEnumTypeTransformer().decode(value);

  static List<JWKSEd25519PublicKeyCrvEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <JWKSEd25519PublicKeyCrvEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JWKSEd25519PublicKeyCrvEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JWKSEd25519PublicKeyCrvEnum] to String,
/// and [decode] dynamic data back to [JWKSEd25519PublicKeyCrvEnum].
class JWKSEd25519PublicKeyCrvEnumTypeTransformer {
  factory JWKSEd25519PublicKeyCrvEnumTypeTransformer() =>
      _instance ??= const JWKSEd25519PublicKeyCrvEnumTypeTransformer._();

  const JWKSEd25519PublicKeyCrvEnumTypeTransformer._();

  String encode(JWKSEd25519PublicKeyCrvEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a JWKSEd25519PublicKeyCrvEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JWKSEd25519PublicKeyCrvEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Ed25519':
          return JWKSEd25519PublicKeyCrvEnum.ed25519;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [JWKSEd25519PublicKeyCrvEnumTypeTransformer] instance.
  static JWKSEd25519PublicKeyCrvEnumTypeTransformer? _instance;
}
