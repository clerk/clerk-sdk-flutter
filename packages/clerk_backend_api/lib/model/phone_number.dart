//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PhoneNumber {
  /// Returns a new [PhoneNumber] instance.
  PhoneNumber({
    this.id,
    required this.object,
    required this.phoneNumber,
    this.reservedForSecondFactor,
    this.defaultSecondFactor,
    required this.reserved,
    required this.verification,
    this.linkedTo = const [],
    this.backupCodes = const [],
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
  PhoneNumberObjectEnum object;

  String phoneNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? reservedForSecondFactor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? defaultSecondFactor;

  bool reserved;

  PhoneNumberVerification? verification;

  List<IdentificationLink> linkedTo;

  List<String>? backupCodes;

  /// Unix timestamp of creation
  int createdAt;

  /// Unix timestamp of creation
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneNumber &&
          other.id == id &&
          other.object == object &&
          other.phoneNumber == phoneNumber &&
          other.reservedForSecondFactor == reservedForSecondFactor &&
          other.defaultSecondFactor == defaultSecondFactor &&
          other.reserved == reserved &&
          other.verification == verification &&
          _deepEquality.equals(other.linkedTo, linkedTo) &&
          _deepEquality.equals(other.backupCodes, backupCodes) &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (object.hashCode) +
      (phoneNumber.hashCode) +
      (reservedForSecondFactor == null
          ? 0
          : reservedForSecondFactor!.hashCode) +
      (defaultSecondFactor == null ? 0 : defaultSecondFactor!.hashCode) +
      (reserved.hashCode) +
      (verification == null ? 0 : verification!.hashCode) +
      (linkedTo.hashCode) +
      (backupCodes == null ? 0 : backupCodes!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'PhoneNumber[id=$id, object=$object, phoneNumber=$phoneNumber, reservedForSecondFactor=$reservedForSecondFactor, defaultSecondFactor=$defaultSecondFactor, reserved=$reserved, verification=$verification, linkedTo=$linkedTo, backupCodes=$backupCodes, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    json[r'object'] = this.object;
    json[r'phone_number'] = this.phoneNumber;
    if (this.reservedForSecondFactor != null) {
      json[r'reserved_for_second_factor'] = this.reservedForSecondFactor;
    } else {
      json[r'reserved_for_second_factor'] = null;
    }
    if (this.defaultSecondFactor != null) {
      json[r'default_second_factor'] = this.defaultSecondFactor;
    } else {
      json[r'default_second_factor'] = null;
    }
    json[r'reserved'] = this.reserved;
    if (this.verification != null) {
      json[r'verification'] = this.verification;
    } else {
      json[r'verification'] = null;
    }
    json[r'linked_to'] = this.linkedTo;
    if (this.backupCodes != null) {
      json[r'backup_codes'] = this.backupCodes;
    } else {
      json[r'backup_codes'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [PhoneNumber] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PhoneNumber? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PhoneNumber[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PhoneNumber[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PhoneNumber(
        id: mapValueOfType<String>(json, r'id'),
        object: PhoneNumberObjectEnum.fromJson(json[r'object'])!,
        phoneNumber: mapValueOfType<String>(json, r'phone_number')!,
        reservedForSecondFactor:
            mapValueOfType<bool>(json, r'reserved_for_second_factor'),
        defaultSecondFactor:
            mapValueOfType<bool>(json, r'default_second_factor'),
        reserved: mapValueOfType<bool>(json, r'reserved')!,
        verification: PhoneNumberVerification.fromJson(json[r'verification']),
        linkedTo: IdentificationLink.listFromJson(json[r'linked_to']),
        backupCodes: json[r'backup_codes'] is Iterable
            ? (json[r'backup_codes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<PhoneNumber> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PhoneNumber>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PhoneNumber.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PhoneNumber> mapFromJson(dynamic json) {
    final map = <String, PhoneNumber>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PhoneNumber.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PhoneNumber-objects as value to a dart map
  static Map<String, List<PhoneNumber>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PhoneNumber>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PhoneNumber.listFromJson(
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
    'phone_number',
    'reserved',
    'verification',
    'linked_to',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class PhoneNumberObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const PhoneNumberObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const phoneNumber = PhoneNumberObjectEnum._(r'phone_number');

  /// List of all possible values in this [enum][PhoneNumberObjectEnum].
  static const values = <PhoneNumberObjectEnum>[
    phoneNumber,
  ];

  static PhoneNumberObjectEnum? fromJson(dynamic value) =>
      PhoneNumberObjectEnumTypeTransformer().decode(value);

  static List<PhoneNumberObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PhoneNumberObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PhoneNumberObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PhoneNumberObjectEnum] to String,
/// and [decode] dynamic data back to [PhoneNumberObjectEnum].
class PhoneNumberObjectEnumTypeTransformer {
  factory PhoneNumberObjectEnumTypeTransformer() =>
      _instance ??= const PhoneNumberObjectEnumTypeTransformer._();

  const PhoneNumberObjectEnumTypeTransformer._();

  String encode(PhoneNumberObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PhoneNumberObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PhoneNumberObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'phone_number':
          return PhoneNumberObjectEnum.phoneNumber;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PhoneNumberObjectEnumTypeTransformer] instance.
  static PhoneNumberObjectEnumTypeTransformer? _instance;
}
