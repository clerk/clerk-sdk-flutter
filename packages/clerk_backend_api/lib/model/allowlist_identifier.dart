//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AllowlistIdentifier {
  /// Returns a new [AllowlistIdentifier] instance.
  AllowlistIdentifier({
    this.object,
    this.id,
    this.invitationId,
    this.identifier,
    this.identifierType,
    this.instanceId,
    this.createdAt,
    this.updatedAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  AllowlistIdentifierObjectEnum? object;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? invitationId;

  /// An email address or a phone number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? identifier;

  AllowlistIdentifierIdentifierTypeEnum? identifierType;

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
      other is AllowlistIdentifier &&
          other.object == object &&
          other.id == id &&
          other.invitationId == invitationId &&
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
      (invitationId == null ? 0 : invitationId!.hashCode) +
      (identifier == null ? 0 : identifier!.hashCode) +
      (identifierType == null ? 0 : identifierType!.hashCode) +
      (instanceId == null ? 0 : instanceId!.hashCode) +
      (createdAt == null ? 0 : createdAt!.hashCode) +
      (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() =>
      'AllowlistIdentifier[object=$object, id=$id, invitationId=$invitationId, identifier=$identifier, identifierType=$identifierType, instanceId=$instanceId, createdAt=$createdAt, updatedAt=$updatedAt]';

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
    if (this.invitationId != null) {
      json[r'invitation_id'] = this.invitationId;
    } else {
      json[r'invitation_id'] = null;
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

  /// Returns a new [AllowlistIdentifier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AllowlistIdentifier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "AllowlistIdentifier[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "AllowlistIdentifier[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AllowlistIdentifier(
        object: AllowlistIdentifierObjectEnum.fromJson(json[r'object']),
        id: mapValueOfType<String>(json, r'id'),
        invitationId: mapValueOfType<String>(json, r'invitation_id'),
        identifier: mapValueOfType<String>(json, r'identifier'),
        identifierType: AllowlistIdentifierIdentifierTypeEnum.fromJson(
            json[r'identifier_type']),
        instanceId: mapValueOfType<String>(json, r'instance_id'),
        createdAt: mapValueOfType<int>(json, r'created_at'),
        updatedAt: mapValueOfType<int>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<AllowlistIdentifier> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AllowlistIdentifier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AllowlistIdentifier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AllowlistIdentifier> mapFromJson(dynamic json) {
    final map = <String, AllowlistIdentifier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AllowlistIdentifier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AllowlistIdentifier-objects as value to a dart map
  static Map<String, List<AllowlistIdentifier>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<AllowlistIdentifier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AllowlistIdentifier.listFromJson(
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
class AllowlistIdentifierObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const AllowlistIdentifierObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const allowlistIdentifier =
      AllowlistIdentifierObjectEnum._(r'allowlist_identifier');

  /// List of all possible values in this [enum][AllowlistIdentifierObjectEnum].
  static const values = <AllowlistIdentifierObjectEnum>[
    allowlistIdentifier,
  ];

  static AllowlistIdentifierObjectEnum? fromJson(dynamic value) =>
      AllowlistIdentifierObjectEnumTypeTransformer().decode(value);

  static List<AllowlistIdentifierObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AllowlistIdentifierObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AllowlistIdentifierObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AllowlistIdentifierObjectEnum] to String,
/// and [decode] dynamic data back to [AllowlistIdentifierObjectEnum].
class AllowlistIdentifierObjectEnumTypeTransformer {
  factory AllowlistIdentifierObjectEnumTypeTransformer() =>
      _instance ??= const AllowlistIdentifierObjectEnumTypeTransformer._();

  const AllowlistIdentifierObjectEnumTypeTransformer._();

  String encode(AllowlistIdentifierObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AllowlistIdentifierObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AllowlistIdentifierObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'allowlist_identifier':
          return AllowlistIdentifierObjectEnum.allowlistIdentifier;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AllowlistIdentifierObjectEnumTypeTransformer] instance.
  static AllowlistIdentifierObjectEnumTypeTransformer? _instance;
}

class AllowlistIdentifierIdentifierTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const AllowlistIdentifierIdentifierTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const emailAddress =
      AllowlistIdentifierIdentifierTypeEnum._(r'email_address');
  static const phoneNumber =
      AllowlistIdentifierIdentifierTypeEnum._(r'phone_number');
  static const web3Wallet =
      AllowlistIdentifierIdentifierTypeEnum._(r'web3_wallet');

  /// List of all possible values in this [enum][AllowlistIdentifierIdentifierTypeEnum].
  static const values = <AllowlistIdentifierIdentifierTypeEnum>[
    emailAddress,
    phoneNumber,
    web3Wallet,
  ];

  static AllowlistIdentifierIdentifierTypeEnum? fromJson(dynamic value) =>
      AllowlistIdentifierIdentifierTypeEnumTypeTransformer().decode(value);

  static List<AllowlistIdentifierIdentifierTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AllowlistIdentifierIdentifierTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AllowlistIdentifierIdentifierTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AllowlistIdentifierIdentifierTypeEnum] to String,
/// and [decode] dynamic data back to [AllowlistIdentifierIdentifierTypeEnum].
class AllowlistIdentifierIdentifierTypeEnumTypeTransformer {
  factory AllowlistIdentifierIdentifierTypeEnumTypeTransformer() =>
      _instance ??=
          const AllowlistIdentifierIdentifierTypeEnumTypeTransformer._();

  const AllowlistIdentifierIdentifierTypeEnumTypeTransformer._();

  String encode(AllowlistIdentifierIdentifierTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AllowlistIdentifierIdentifierTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AllowlistIdentifierIdentifierTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'email_address':
          return AllowlistIdentifierIdentifierTypeEnum.emailAddress;
        case r'phone_number':
          return AllowlistIdentifierIdentifierTypeEnum.phoneNumber;
        case r'web3_wallet':
          return AllowlistIdentifierIdentifierTypeEnum.web3Wallet;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AllowlistIdentifierIdentifierTypeEnumTypeTransformer] instance.
  static AllowlistIdentifierIdentifierTypeEnumTypeTransformer? _instance;
}
