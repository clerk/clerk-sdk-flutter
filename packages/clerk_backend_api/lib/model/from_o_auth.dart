//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FromOAuth {
  /// Returns a new [FromOAuth] instance.
  FromOAuth({
    required this.status,
    required this.strategy,
    this.error,
    required this.expireAt,
    required this.attempts,
    this.verifiedAtClient,
  });

  FromOAuthStatusEnum status;

  String strategy;

  FromOAuthError? error;

  int? expireAt;

  int? attempts;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FromOAuth &&
          other.status == status &&
          other.strategy == strategy &&
          other.error == error &&
          other.expireAt == expireAt &&
          other.attempts == attempts &&
          other.verifiedAtClient == verifiedAtClient;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (status.hashCode) +
      (strategy.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'FromOAuth[status=$status, strategy=$strategy, error=$error, expireAt=$expireAt, attempts=$attempts, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'status'] = this.status;
    json[r'strategy'] = this.strategy;
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.expireAt != null) {
      json[r'expire_at'] = this.expireAt;
    } else {
      json[r'expire_at'] = null;
    }
    if (this.attempts != null) {
      json[r'attempts'] = this.attempts;
    } else {
      json[r'attempts'] = null;
    }
    if (this.verifiedAtClient != null) {
      json[r'verified_at_client'] = this.verifiedAtClient;
    } else {
      json[r'verified_at_client'] = null;
    }
    return json;
  }

  /// Returns a new [FromOAuth] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FromOAuth? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FromOAuth[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FromOAuth[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FromOAuth(
        status: FromOAuthStatusEnum.fromJson(json[r'status'])!,
        strategy: mapValueOfType<String>(json, r'strategy')!,
        error: FromOAuthError.fromJson(json[r'error']),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        attempts: mapValueOfType<int>(json, r'attempts'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<FromOAuth> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FromOAuth>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FromOAuth.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FromOAuth> mapFromJson(dynamic json) {
    final map = <String, FromOAuth>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FromOAuth.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FromOAuth-objects as value to a dart map
  static Map<String, List<FromOAuth>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FromOAuth>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FromOAuth.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
    'strategy',
    'expire_at',
    'attempts',
  };
}

class FromOAuthStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const FromOAuthStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = FromOAuthStatusEnum._(r'unverified');
  static const verified = FromOAuthStatusEnum._(r'verified');

  /// List of all possible values in this [enum][FromOAuthStatusEnum].
  static const values = <FromOAuthStatusEnum>[
    unverified,
    verified,
  ];

  static FromOAuthStatusEnum? fromJson(dynamic value) =>
      FromOAuthStatusEnumTypeTransformer().decode(value);

  static List<FromOAuthStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FromOAuthStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FromOAuthStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FromOAuthStatusEnum] to String,
/// and [decode] dynamic data back to [FromOAuthStatusEnum].
class FromOAuthStatusEnumTypeTransformer {
  factory FromOAuthStatusEnumTypeTransformer() =>
      _instance ??= const FromOAuthStatusEnumTypeTransformer._();

  const FromOAuthStatusEnumTypeTransformer._();

  String encode(FromOAuthStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a FromOAuthStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FromOAuthStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return FromOAuthStatusEnum.unverified;
        case r'verified':
          return FromOAuthStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [FromOAuthStatusEnumTypeTransformer] instance.
  static FromOAuthStatusEnumTypeTransformer? _instance;
}
