//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JWKSRsaPrivateKey {
  /// Returns a new [JWKSRsaPrivateKey] instance.
  JWKSRsaPrivateKey({
    required this.kid,
    required this.alg,
    required this.use,
    required this.kty,
    required this.n,
    required this.e,
    required this.d,
    required this.p,
    required this.q,
    this.dp,
    this.dq,
    this.qi,
    this.x5c = const [],
    this.x5t,
    this.x5tHashS256,
    this.x5u,
  });

  String kid;

  String alg;

  String use;

  JWKSRsaPrivateKeyKtyEnum kty;

  String n;

  String e;

  String d;

  String p;

  String q;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? dp;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? dq;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? qi;

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
      other is JWKSRsaPrivateKey &&
          other.kid == kid &&
          other.alg == alg &&
          other.use == use &&
          other.kty == kty &&
          other.n == n &&
          other.e == e &&
          other.d == d &&
          other.p == p &&
          other.q == q &&
          other.dp == dp &&
          other.dq == dq &&
          other.qi == qi &&
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
      (n.hashCode) +
      (e.hashCode) +
      (d.hashCode) +
      (p.hashCode) +
      (q.hashCode) +
      (dp == null ? 0 : dp!.hashCode) +
      (dq == null ? 0 : dq!.hashCode) +
      (qi == null ? 0 : qi!.hashCode) +
      (x5c.hashCode) +
      (x5t == null ? 0 : x5t!.hashCode) +
      (x5tHashS256 == null ? 0 : x5tHashS256!.hashCode) +
      (x5u == null ? 0 : x5u!.hashCode);

  @override
  String toString() =>
      'JWKSRsaPrivateKey[kid=$kid, alg=$alg, use=$use, kty=$kty, n=$n, e=$e, d=$d, p=$p, q=$q, dp=$dp, dq=$dq, qi=$qi, x5c=$x5c, x5t=$x5t, x5tHashS256=$x5tHashS256, x5u=$x5u]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'kid'] = this.kid;
    json[r'alg'] = this.alg;
    json[r'use'] = this.use;
    json[r'kty'] = this.kty;
    json[r'n'] = this.n;
    json[r'e'] = this.e;
    json[r'd'] = this.d;
    json[r'p'] = this.p;
    json[r'q'] = this.q;
    if (this.dp != null) {
      json[r'dp'] = this.dp;
    } else {
      json[r'dp'] = null;
    }
    if (this.dq != null) {
      json[r'dq'] = this.dq;
    } else {
      json[r'dq'] = null;
    }
    if (this.qi != null) {
      json[r'qi'] = this.qi;
    } else {
      json[r'qi'] = null;
    }
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

  /// Returns a new [JWKSRsaPrivateKey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JWKSRsaPrivateKey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "JWKSRsaPrivateKey[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "JWKSRsaPrivateKey[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return JWKSRsaPrivateKey(
        kid: mapValueOfType<String>(json, r'kid')!,
        alg: mapValueOfType<String>(json, r'alg')!,
        use: mapValueOfType<String>(json, r'use')!,
        kty: JWKSRsaPrivateKeyKtyEnum.fromJson(json[r'kty'])!,
        n: mapValueOfType<String>(json, r'n')!,
        e: mapValueOfType<String>(json, r'e')!,
        d: mapValueOfType<String>(json, r'd')!,
        p: mapValueOfType<String>(json, r'p')!,
        q: mapValueOfType<String>(json, r'q')!,
        dp: mapValueOfType<String>(json, r'dp'),
        dq: mapValueOfType<String>(json, r'dq'),
        qi: mapValueOfType<String>(json, r'qi'),
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

  static List<JWKSRsaPrivateKey> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <JWKSRsaPrivateKey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JWKSRsaPrivateKey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JWKSRsaPrivateKey> mapFromJson(dynamic json) {
    final map = <String, JWKSRsaPrivateKey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JWKSRsaPrivateKey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JWKSRsaPrivateKey-objects as value to a dart map
  static Map<String, List<JWKSRsaPrivateKey>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<JWKSRsaPrivateKey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JWKSRsaPrivateKey.listFromJson(
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
    'n',
    'e',
    'd',
    'p',
    'q',
  };
}

class JWKSRsaPrivateKeyKtyEnum {
  /// Instantiate a new enum with the provided [value].
  const JWKSRsaPrivateKeyKtyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const RSA = JWKSRsaPrivateKeyKtyEnum._(r'RSA');

  /// List of all possible values in this [enum][JWKSRsaPrivateKeyKtyEnum].
  static const values = <JWKSRsaPrivateKeyKtyEnum>[
    RSA,
  ];

  static JWKSRsaPrivateKeyKtyEnum? fromJson(dynamic value) =>
      JWKSRsaPrivateKeyKtyEnumTypeTransformer().decode(value);

  static List<JWKSRsaPrivateKeyKtyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <JWKSRsaPrivateKeyKtyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JWKSRsaPrivateKeyKtyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JWKSRsaPrivateKeyKtyEnum] to String,
/// and [decode] dynamic data back to [JWKSRsaPrivateKeyKtyEnum].
class JWKSRsaPrivateKeyKtyEnumTypeTransformer {
  factory JWKSRsaPrivateKeyKtyEnumTypeTransformer() =>
      _instance ??= const JWKSRsaPrivateKeyKtyEnumTypeTransformer._();

  const JWKSRsaPrivateKeyKtyEnumTypeTransformer._();

  String encode(JWKSRsaPrivateKeyKtyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a JWKSRsaPrivateKeyKtyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JWKSRsaPrivateKeyKtyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'RSA':
          return JWKSRsaPrivateKeyKtyEnum.RSA;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [JWKSRsaPrivateKeyKtyEnumTypeTransformer] instance.
  static JWKSRsaPrivateKeyKtyEnumTypeTransformer? _instance;
}
