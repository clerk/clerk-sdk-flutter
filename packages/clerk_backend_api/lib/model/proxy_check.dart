//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProxyCheck {
  /// Returns a new [ProxyCheck] instance.
  ProxyCheck({
    required this.object,
    required this.id,
    required this.domainId,
    required this.lastRunAt,
    required this.proxyUrl,
    required this.successful,
    required this.createdAt,
    required this.updatedAt,
  });

  ProxyCheckObjectEnum object;

  String id;

  String domainId;

  /// Unix timestamp of last run.
  int? lastRunAt;

  String proxyUrl;

  bool successful;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProxyCheck &&
          other.object == object &&
          other.id == id &&
          other.domainId == domainId &&
          other.lastRunAt == lastRunAt &&
          other.proxyUrl == proxyUrl &&
          other.successful == successful &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (domainId.hashCode) +
      (lastRunAt == null ? 0 : lastRunAt!.hashCode) +
      (proxyUrl.hashCode) +
      (successful.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'ProxyCheck[object=$object, id=$id, domainId=$domainId, lastRunAt=$lastRunAt, proxyUrl=$proxyUrl, successful=$successful, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'domain_id'] = this.domainId;
    if (this.lastRunAt != null) {
      json[r'last_run_at'] = this.lastRunAt;
    } else {
      json[r'last_run_at'] = null;
    }
    json[r'proxy_url'] = this.proxyUrl;
    json[r'successful'] = this.successful;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [ProxyCheck] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProxyCheck? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ProxyCheck[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ProxyCheck[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProxyCheck(
        object: ProxyCheckObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        domainId: mapValueOfType<String>(json, r'domain_id')!,
        lastRunAt: mapValueOfType<int>(json, r'last_run_at'),
        proxyUrl: mapValueOfType<String>(json, r'proxy_url')!,
        successful: mapValueOfType<bool>(json, r'successful')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<ProxyCheck> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProxyCheck>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProxyCheck.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProxyCheck> mapFromJson(dynamic json) {
    final map = <String, ProxyCheck>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProxyCheck.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProxyCheck-objects as value to a dart map
  static Map<String, List<ProxyCheck>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ProxyCheck>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProxyCheck.listFromJson(
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
    'domain_id',
    'last_run_at',
    'proxy_url',
    'successful',
    'created_at',
    'updated_at',
  };
}

class ProxyCheckObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const ProxyCheckObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const proxyCheck = ProxyCheckObjectEnum._(r'proxy_check');

  /// List of all possible values in this [enum][ProxyCheckObjectEnum].
  static const values = <ProxyCheckObjectEnum>[
    proxyCheck,
  ];

  static ProxyCheckObjectEnum? fromJson(dynamic value) =>
      ProxyCheckObjectEnumTypeTransformer().decode(value);

  static List<ProxyCheckObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProxyCheckObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProxyCheckObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProxyCheckObjectEnum] to String,
/// and [decode] dynamic data back to [ProxyCheckObjectEnum].
class ProxyCheckObjectEnumTypeTransformer {
  factory ProxyCheckObjectEnumTypeTransformer() =>
      _instance ??= const ProxyCheckObjectEnumTypeTransformer._();

  const ProxyCheckObjectEnumTypeTransformer._();

  String encode(ProxyCheckObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ProxyCheckObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProxyCheckObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'proxy_check':
          return ProxyCheckObjectEnum.proxyCheck;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ProxyCheckObjectEnumTypeTransformer] instance.
  static ProxyCheckObjectEnumTypeTransformer? _instance;
}
