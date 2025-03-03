//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Web3Wallet {
  /// Returns a new [Web3Wallet] instance.
  Web3Wallet({
    this.id,
    required this.object,
    required this.web3Wallet,
    required this.verification,
    required this.createdAt,
    required this.updatedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// String representing the object's type. Objects of the same type share the same value.
  Web3WalletObjectEnum object;

  String web3Wallet;

  Web3WalletVerification? verification;

  /// Unix timestamp of creation
  int createdAt;

  /// Unix timestamp of creation
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Web3Wallet &&
          other.id == id &&
          other.object == object &&
          other.web3Wallet == web3Wallet &&
          other.verification == verification &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (object.hashCode) +
      (web3Wallet.hashCode) +
      (verification == null ? 0 : verification!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'Web3Wallet[id=$id, object=$object, web3Wallet=$web3Wallet, verification=$verification, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    json[r'object'] = this.object;
    json[r'web3_wallet'] = this.web3Wallet;
    if (this.verification != null) {
      json[r'verification'] = this.verification;
    } else {
      json[r'verification'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [Web3Wallet] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Web3Wallet? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Web3Wallet[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Web3Wallet[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Web3Wallet(
        id: mapValueOfType<String>(json, r'id'),
        object: Web3WalletObjectEnum.fromJson(json[r'object'])!,
        web3Wallet: mapValueOfType<String>(json, r'web3_wallet')!,
        verification: Web3WalletVerification.fromJson(json[r'verification']),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<Web3Wallet> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Web3Wallet>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Web3Wallet.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Web3Wallet> mapFromJson(dynamic json) {
    final map = <String, Web3Wallet>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Web3Wallet.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Web3Wallet-objects as value to a dart map
  static Map<String, List<Web3Wallet>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Web3Wallet>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Web3Wallet.listFromJson(
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
    'web3_wallet',
    'verification',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class Web3WalletObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const Web3WalletObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const web3Wallet = Web3WalletObjectEnum._(r'web3_wallet');

  /// List of all possible values in this [enum][Web3WalletObjectEnum].
  static const values = <Web3WalletObjectEnum>[
    web3Wallet,
  ];

  static Web3WalletObjectEnum? fromJson(dynamic value) =>
      Web3WalletObjectEnumTypeTransformer().decode(value);

  static List<Web3WalletObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Web3WalletObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Web3WalletObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [Web3WalletObjectEnum] to String,
/// and [decode] dynamic data back to [Web3WalletObjectEnum].
class Web3WalletObjectEnumTypeTransformer {
  factory Web3WalletObjectEnumTypeTransformer() =>
      _instance ??= const Web3WalletObjectEnumTypeTransformer._();

  const Web3WalletObjectEnumTypeTransformer._();

  String encode(Web3WalletObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a Web3WalletObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  Web3WalletObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'web3_wallet':
          return Web3WalletObjectEnum.web3Wallet;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [Web3WalletObjectEnumTypeTransformer] instance.
  static Web3WalletObjectEnumTypeTransformer? _instance;
}
