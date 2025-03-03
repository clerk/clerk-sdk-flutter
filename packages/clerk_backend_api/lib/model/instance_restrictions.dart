//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceRestrictions {
  /// Returns a new [InstanceRestrictions] instance.
  InstanceRestrictions({
    required this.object,
    required this.allowlist,
    required this.blocklist,
    required this.blockEmailSubaddresses,
    required this.blockDisposableEmailDomains,
    required this.ignoreDotsForGmailAddresses,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  InstanceRestrictionsObjectEnum object;

  bool allowlist;

  bool blocklist;

  bool blockEmailSubaddresses;

  bool blockDisposableEmailDomains;

  bool ignoreDotsForGmailAddresses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceRestrictions &&
          other.object == object &&
          other.allowlist == allowlist &&
          other.blocklist == blocklist &&
          other.blockEmailSubaddresses == blockEmailSubaddresses &&
          other.blockDisposableEmailDomains == blockDisposableEmailDomains &&
          other.ignoreDotsForGmailAddresses == ignoreDotsForGmailAddresses;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (allowlist.hashCode) +
      (blocklist.hashCode) +
      (blockEmailSubaddresses.hashCode) +
      (blockDisposableEmailDomains.hashCode) +
      (ignoreDotsForGmailAddresses.hashCode);

  @override
  String toString() =>
      'InstanceRestrictions[object=$object, allowlist=$allowlist, blocklist=$blocklist, blockEmailSubaddresses=$blockEmailSubaddresses, blockDisposableEmailDomains=$blockDisposableEmailDomains, ignoreDotsForGmailAddresses=$ignoreDotsForGmailAddresses]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'allowlist'] = this.allowlist;
    json[r'blocklist'] = this.blocklist;
    json[r'block_email_subaddresses'] = this.blockEmailSubaddresses;
    json[r'block_disposable_email_domains'] = this.blockDisposableEmailDomains;
    json[r'ignore_dots_for_gmail_addresses'] = this.ignoreDotsForGmailAddresses;
    return json;
  }

  /// Returns a new [InstanceRestrictions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceRestrictions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceRestrictions[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceRestrictions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceRestrictions(
        object: InstanceRestrictionsObjectEnum.fromJson(json[r'object'])!,
        allowlist: mapValueOfType<bool>(json, r'allowlist')!,
        blocklist: mapValueOfType<bool>(json, r'blocklist')!,
        blockEmailSubaddresses:
            mapValueOfType<bool>(json, r'block_email_subaddresses')!,
        blockDisposableEmailDomains:
            mapValueOfType<bool>(json, r'block_disposable_email_domains')!,
        ignoreDotsForGmailAddresses:
            mapValueOfType<bool>(json, r'ignore_dots_for_gmail_addresses')!,
      );
    }
    return null;
  }

  static List<InstanceRestrictions> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceRestrictions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceRestrictions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceRestrictions> mapFromJson(dynamic json) {
    final map = <String, InstanceRestrictions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceRestrictions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceRestrictions-objects as value to a dart map
  static Map<String, List<InstanceRestrictions>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceRestrictions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceRestrictions.listFromJson(
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
    'allowlist',
    'blocklist',
    'block_email_subaddresses',
    'block_disposable_email_domains',
    'ignore_dots_for_gmail_addresses',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class InstanceRestrictionsObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const InstanceRestrictionsObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const instanceRestrictions =
      InstanceRestrictionsObjectEnum._(r'instance_restrictions');

  /// List of all possible values in this [enum][InstanceRestrictionsObjectEnum].
  static const values = <InstanceRestrictionsObjectEnum>[
    instanceRestrictions,
  ];

  static InstanceRestrictionsObjectEnum? fromJson(dynamic value) =>
      InstanceRestrictionsObjectEnumTypeTransformer().decode(value);

  static List<InstanceRestrictionsObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceRestrictionsObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceRestrictionsObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [InstanceRestrictionsObjectEnum] to String,
/// and [decode] dynamic data back to [InstanceRestrictionsObjectEnum].
class InstanceRestrictionsObjectEnumTypeTransformer {
  factory InstanceRestrictionsObjectEnumTypeTransformer() =>
      _instance ??= const InstanceRestrictionsObjectEnumTypeTransformer._();

  const InstanceRestrictionsObjectEnumTypeTransformer._();

  String encode(InstanceRestrictionsObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a InstanceRestrictionsObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  InstanceRestrictionsObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'instance_restrictions':
          return InstanceRestrictionsObjectEnum.instanceRestrictions;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [InstanceRestrictionsObjectEnumTypeTransformer] instance.
  static InstanceRestrictionsObjectEnumTypeTransformer? _instance;
}
