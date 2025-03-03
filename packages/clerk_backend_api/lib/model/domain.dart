//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Domain {
  /// Returns a new [Domain] instance.
  Domain({
    required this.object,
    required this.id,
    required this.name,
    required this.isSatellite,
    required this.frontendApiUrl,
    this.accountsPortalUrl,
    this.proxyUrl,
    required this.developmentOrigin,
    this.cnameTargets = const [],
  });

  DomainObjectEnum object;

  String id;

  String name;

  bool isSatellite;

  String frontendApiUrl;

  /// Null for satellite domains.
  String? accountsPortalUrl;

  String? proxyUrl;

  String developmentOrigin;

  List<CNameTarget>? cnameTargets;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Domain &&
          other.object == object &&
          other.id == id &&
          other.name == name &&
          other.isSatellite == isSatellite &&
          other.frontendApiUrl == frontendApiUrl &&
          other.accountsPortalUrl == accountsPortalUrl &&
          other.proxyUrl == proxyUrl &&
          other.developmentOrigin == developmentOrigin &&
          _deepEquality.equals(other.cnameTargets, cnameTargets);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (name.hashCode) +
      (isSatellite.hashCode) +
      (frontendApiUrl.hashCode) +
      (accountsPortalUrl == null ? 0 : accountsPortalUrl!.hashCode) +
      (proxyUrl == null ? 0 : proxyUrl!.hashCode) +
      (developmentOrigin.hashCode) +
      (cnameTargets == null ? 0 : cnameTargets!.hashCode);

  @override
  String toString() =>
      'Domain[object=$object, id=$id, name=$name, isSatellite=$isSatellite, frontendApiUrl=$frontendApiUrl, accountsPortalUrl=$accountsPortalUrl, proxyUrl=$proxyUrl, developmentOrigin=$developmentOrigin, cnameTargets=$cnameTargets]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'is_satellite'] = this.isSatellite;
    json[r'frontend_api_url'] = this.frontendApiUrl;
    if (this.accountsPortalUrl != null) {
      json[r'accounts_portal_url'] = this.accountsPortalUrl;
    } else {
      json[r'accounts_portal_url'] = null;
    }
    if (this.proxyUrl != null) {
      json[r'proxy_url'] = this.proxyUrl;
    } else {
      json[r'proxy_url'] = null;
    }
    json[r'development_origin'] = this.developmentOrigin;
    if (this.cnameTargets != null) {
      json[r'cname_targets'] = this.cnameTargets;
    } else {
      json[r'cname_targets'] = null;
    }
    return json;
  }

  /// Returns a new [Domain] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Domain? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Domain[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Domain[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Domain(
        object: DomainObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        isSatellite: mapValueOfType<bool>(json, r'is_satellite')!,
        frontendApiUrl: mapValueOfType<String>(json, r'frontend_api_url')!,
        accountsPortalUrl: mapValueOfType<String>(json, r'accounts_portal_url'),
        proxyUrl: mapValueOfType<String>(json, r'proxy_url'),
        developmentOrigin: mapValueOfType<String>(json, r'development_origin')!,
        cnameTargets: CNameTarget.listFromJson(json[r'cname_targets']),
      );
    }
    return null;
  }

  static List<Domain> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Domain>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Domain.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Domain> mapFromJson(dynamic json) {
    final map = <String, Domain>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Domain.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Domain-objects as value to a dart map
  static Map<String, List<Domain>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Domain>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Domain.listFromJson(
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
    'is_satellite',
    'frontend_api_url',
    'development_origin',
  };
}

class DomainObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const DomainObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const domain = DomainObjectEnum._(r'domain');

  /// List of all possible values in this [enum][DomainObjectEnum].
  static const values = <DomainObjectEnum>[
    domain,
  ];

  static DomainObjectEnum? fromJson(dynamic value) =>
      DomainObjectEnumTypeTransformer().decode(value);

  static List<DomainObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DomainObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DomainObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DomainObjectEnum] to String,
/// and [decode] dynamic data back to [DomainObjectEnum].
class DomainObjectEnumTypeTransformer {
  factory DomainObjectEnumTypeTransformer() =>
      _instance ??= const DomainObjectEnumTypeTransformer._();

  const DomainObjectEnumTypeTransformer._();

  String encode(DomainObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a DomainObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DomainObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'domain':
          return DomainObjectEnum.domain;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [DomainObjectEnumTypeTransformer] instance.
  static DomainObjectEnumTypeTransformer? _instance;
}
