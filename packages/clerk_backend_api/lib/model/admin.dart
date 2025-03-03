//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Admin {
  /// Returns a new [Admin] instance.
  Admin({
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
  });

  AdminStatusEnum status;

  AdminStrategyEnum strategy;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Admin &&
          other.status == status &&
          other.strategy == strategy &&
          other.attempts == attempts &&
          other.expireAt == expireAt &&
          other.verifiedAtClient == verifiedAtClient;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (status.hashCode) +
      (strategy.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode);

  @override
  String toString() =>
      'Admin[status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'status'] = this.status;
    json[r'strategy'] = this.strategy;
    if (this.attempts != null) {
      json[r'attempts'] = this.attempts;
    } else {
      json[r'attempts'] = null;
    }
    if (this.expireAt != null) {
      json[r'expire_at'] = this.expireAt;
    } else {
      json[r'expire_at'] = null;
    }
    if (this.verifiedAtClient != null) {
      json[r'verified_at_client'] = this.verifiedAtClient;
    } else {
      json[r'verified_at_client'] = null;
    }
    return json;
  }

  /// Returns a new [Admin] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Admin? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Admin[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Admin[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Admin(
        status: AdminStatusEnum.fromJson(json[r'status'])!,
        strategy: AdminStrategyEnum.fromJson(json[r'strategy'])!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
      );
    }
    return null;
  }

  static List<Admin> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Admin>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Admin.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Admin> mapFromJson(dynamic json) {
    final map = <String, Admin>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Admin.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Admin-objects as value to a dart map
  static Map<String, List<Admin>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Admin>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Admin.listFromJson(
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
    'attempts',
    'expire_at',
  };
}

class AdminStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const AdminStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const verified = AdminStatusEnum._(r'verified');

  /// List of all possible values in this [enum][AdminStatusEnum].
  static const values = <AdminStatusEnum>[
    verified,
  ];

  static AdminStatusEnum? fromJson(dynamic value) =>
      AdminStatusEnumTypeTransformer().decode(value);

  static List<AdminStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AdminStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AdminStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AdminStatusEnum] to String,
/// and [decode] dynamic data back to [AdminStatusEnum].
class AdminStatusEnumTypeTransformer {
  factory AdminStatusEnumTypeTransformer() =>
      _instance ??= const AdminStatusEnumTypeTransformer._();

  const AdminStatusEnumTypeTransformer._();

  String encode(AdminStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AdminStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AdminStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'verified':
          return AdminStatusEnum.verified;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AdminStatusEnumTypeTransformer] instance.
  static AdminStatusEnumTypeTransformer? _instance;
}

class AdminStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const AdminStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const admin = AdminStrategyEnum._(r'admin');

  /// List of all possible values in this [enum][AdminStrategyEnum].
  static const values = <AdminStrategyEnum>[
    admin,
  ];

  static AdminStrategyEnum? fromJson(dynamic value) =>
      AdminStrategyEnumTypeTransformer().decode(value);

  static List<AdminStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AdminStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AdminStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AdminStrategyEnum] to String,
/// and [decode] dynamic data back to [AdminStrategyEnum].
class AdminStrategyEnumTypeTransformer {
  factory AdminStrategyEnumTypeTransformer() =>
      _instance ??= const AdminStrategyEnumTypeTransformer._();

  const AdminStrategyEnumTypeTransformer._();

  String encode(AdminStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AdminStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AdminStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'admin':
          return AdminStrategyEnum.admin;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AdminStrategyEnumTypeTransformer] instance.
  static AdminStrategyEnumTypeTransformer? _instance;
}
