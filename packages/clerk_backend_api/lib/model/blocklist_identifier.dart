//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BlocklistIdentifier {
  /// Returns a new [BlocklistIdentifier] instance.
  BlocklistIdentifier({
    this.object,
    this.id,
    this.identifier,
    this.identifierType,
    this.instanceId,
    this.createdAt,
    this.updatedAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  BlocklistIdentifierObjectEnum? object;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// An email address, email domain, phone number or web3 wallet.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? identifier;

  BlocklistIdentifierIdentifierTypeEnum? identifierType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? instanceId;

  /// Unix timestamp of creation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? createdAt;

  /// Unix timestamp of last update.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlocklistIdentifier &&
          other.object == object &&
          other.id == id &&
          other.identifier == identifier &&
          other.identifierType == identifierType &&
          other.instanceId == instanceId &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object == null ? 0 : object!.hashCode) +
      (id == null ? 0 : id!.hashCode) +
      (identifier == null ? 0 : identifier!.hashCode) +
      (identifierType == null ? 0 : identifierType!.hashCode) +
      (instanceId == null ? 0 : instanceId!.hashCode) +
      (createdAt == null ? 0 : createdAt!.hashCode) +
      (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() =>
      'BlocklistIdentifier[object=$object, id=$id, identifier=$identifier, identifierType=$identifierType, instanceId=$instanceId, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.identifier != null) {
      json[r'identifier'] = this.identifier;
    } else {
      json[r'identifier'] = null;
    }
    if (this.identifierType != null) {
      json[r'identifier_type'] = this.identifierType;
    } else {
      json[r'identifier_type'] = null;
    }
    if (this.instanceId != null) {
      json[r'instance_id'] = this.instanceId;
    } else {
      json[r'instance_id'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [BlocklistIdentifier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BlocklistIdentifier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "BlocklistIdentifier[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "BlocklistIdentifier[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BlocklistIdentifier(
        object: BlocklistIdentifierObjectEnum.fromJson(json[r'object']),
        id: mapValueOfType<String>(json, r'id'),
        identifier: mapValueOfType<String>(json, r'identifier'),
        identifierType: BlocklistIdentifierIdentifierTypeEnum.fromJson(
            json[r'identifier_type']),
        instanceId: mapValueOfType<String>(json, r'instance_id'),
        createdAt: mapValueOfType<int>(json, r'created_at'),
        updatedAt: mapValueOfType<int>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<BlocklistIdentifier> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BlocklistIdentifier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlocklistIdentifier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BlocklistIdentifier> mapFromJson(dynamic json) {
    final map = <String, BlocklistIdentifier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BlocklistIdentifier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BlocklistIdentifier-objects as value to a dart map
  static Map<String, List<BlocklistIdentifier>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<BlocklistIdentifier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BlocklistIdentifier.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}

/// String representing the object's type. Objects of the same type share the same value.
class BlocklistIdentifierObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const BlocklistIdentifierObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const blocklistIdentifier =
      BlocklistIdentifierObjectEnum._(r'blocklist_identifier');

  /// List of all possible values in this [enum][BlocklistIdentifierObjectEnum].
  static const values = <BlocklistIdentifierObjectEnum>[
    blocklistIdentifier,
  ];

  static BlocklistIdentifierObjectEnum? fromJson(dynamic value) =>
      BlocklistIdentifierObjectEnumTypeTransformer().decode(value);

  static List<BlocklistIdentifierObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BlocklistIdentifierObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlocklistIdentifierObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BlocklistIdentifierObjectEnum] to String,
/// and [decode] dynamic data back to [BlocklistIdentifierObjectEnum].
class BlocklistIdentifierObjectEnumTypeTransformer {
  factory BlocklistIdentifierObjectEnumTypeTransformer() =>
      _instance ??= const BlocklistIdentifierObjectEnumTypeTransformer._();

  const BlocklistIdentifierObjectEnumTypeTransformer._();

  String encode(BlocklistIdentifierObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BlocklistIdentifierObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BlocklistIdentifierObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'blocklist_identifier':
          return BlocklistIdentifierObjectEnum.blocklistIdentifier;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BlocklistIdentifierObjectEnumTypeTransformer] instance.
  static BlocklistIdentifierObjectEnumTypeTransformer? _instance;
}

class BlocklistIdentifierIdentifierTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const BlocklistIdentifierIdentifierTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const emailAddress =
      BlocklistIdentifierIdentifierTypeEnum._(r'email_address');
  static const phoneNumber =
      BlocklistIdentifierIdentifierTypeEnum._(r'phone_number');
  static const web3Wallet =
      BlocklistIdentifierIdentifierTypeEnum._(r'web3_wallet');

  /// List of all possible values in this [enum][BlocklistIdentifierIdentifierTypeEnum].
  static const values = <BlocklistIdentifierIdentifierTypeEnum>[
    emailAddress,
    phoneNumber,
    web3Wallet,
  ];

  static BlocklistIdentifierIdentifierTypeEnum? fromJson(dynamic value) =>
      BlocklistIdentifierIdentifierTypeEnumTypeTransformer().decode(value);

  static List<BlocklistIdentifierIdentifierTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BlocklistIdentifierIdentifierTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlocklistIdentifierIdentifierTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BlocklistIdentifierIdentifierTypeEnum] to String,
/// and [decode] dynamic data back to [BlocklistIdentifierIdentifierTypeEnum].
class BlocklistIdentifierIdentifierTypeEnumTypeTransformer {
  factory BlocklistIdentifierIdentifierTypeEnumTypeTransformer() =>
      _instance ??=
          const BlocklistIdentifierIdentifierTypeEnumTypeTransformer._();

  const BlocklistIdentifierIdentifierTypeEnumTypeTransformer._();

  String encode(BlocklistIdentifierIdentifierTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BlocklistIdentifierIdentifierTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BlocklistIdentifierIdentifierTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'email_address':
          return BlocklistIdentifierIdentifierTypeEnum.emailAddress;
        case r'phone_number':
          return BlocklistIdentifierIdentifierTypeEnum.phoneNumber;
        case r'web3_wallet':
          return BlocklistIdentifierIdentifierTypeEnum.web3Wallet;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BlocklistIdentifierIdentifierTypeEnumTypeTransformer] instance.
  static BlocklistIdentifierIdentifierTypeEnumTypeTransformer? _instance;
}
