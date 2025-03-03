//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EmailAddress {
  /// Returns a new [EmailAddress] instance.
  EmailAddress({
    this.id,
    required this.object,
    required this.emailAddress,
    required this.reserved,
    required this.verification,
    this.linkedTo = const [],
    this.matchesSsoConnection,
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
  EmailAddressObjectEnum object;

  String emailAddress;

  bool reserved;

  EmailAddressVerification? verification;

  List<IdentificationLink> linkedTo;

  /// Indicates whether this email address domain matches an active enterprise connection.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? matchesSsoConnection;

  /// Unix timestamp of creation
  int createdAt;

  /// Unix timestamp of creation
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailAddress &&
          other.id == id &&
          other.object == object &&
          other.emailAddress == emailAddress &&
          other.reserved == reserved &&
          other.verification == verification &&
          _deepEquality.equals(other.linkedTo, linkedTo) &&
          other.matchesSsoConnection == matchesSsoConnection &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (object.hashCode) +
      (emailAddress.hashCode) +
      (reserved.hashCode) +
      (verification == null ? 0 : verification!.hashCode) +
      (linkedTo.hashCode) +
      (matchesSsoConnection == null ? 0 : matchesSsoConnection!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'EmailAddress[id=$id, object=$object, emailAddress=$emailAddress, reserved=$reserved, verification=$verification, linkedTo=$linkedTo, matchesSsoConnection=$matchesSsoConnection, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    json[r'object'] = this.object;
    json[r'email_address'] = this.emailAddress;
    json[r'reserved'] = this.reserved;
    if (this.verification != null) {
      json[r'verification'] = this.verification;
    } else {
      json[r'verification'] = null;
    }
    json[r'linked_to'] = this.linkedTo;
    if (this.matchesSsoConnection != null) {
      json[r'matches_sso_connection'] = this.matchesSsoConnection;
    } else {
      json[r'matches_sso_connection'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [EmailAddress] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EmailAddress? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "EmailAddress[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "EmailAddress[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EmailAddress(
        id: mapValueOfType<String>(json, r'id'),
        object: EmailAddressObjectEnum.fromJson(json[r'object'])!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        reserved: mapValueOfType<bool>(json, r'reserved')!,
        verification: EmailAddressVerification.fromJson(json[r'verification']),
        linkedTo: IdentificationLink.listFromJson(json[r'linked_to']),
        matchesSsoConnection:
            mapValueOfType<bool>(json, r'matches_sso_connection'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<EmailAddress> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EmailAddress>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailAddress.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EmailAddress> mapFromJson(dynamic json) {
    final map = <String, EmailAddress>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EmailAddress.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EmailAddress-objects as value to a dart map
  static Map<String, List<EmailAddress>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<EmailAddress>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EmailAddress.listFromJson(
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
    'email_address',
    'reserved',
    'verification',
    'linked_to',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class EmailAddressObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const EmailAddressObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const emailAddress = EmailAddressObjectEnum._(r'email_address');

  /// List of all possible values in this [enum][EmailAddressObjectEnum].
  static const values = <EmailAddressObjectEnum>[
    emailAddress,
  ];

  static EmailAddressObjectEnum? fromJson(dynamic value) =>
      EmailAddressObjectEnumTypeTransformer().decode(value);

  static List<EmailAddressObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EmailAddressObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailAddressObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EmailAddressObjectEnum] to String,
/// and [decode] dynamic data back to [EmailAddressObjectEnum].
class EmailAddressObjectEnumTypeTransformer {
  factory EmailAddressObjectEnumTypeTransformer() =>
      _instance ??= const EmailAddressObjectEnumTypeTransformer._();

  const EmailAddressObjectEnumTypeTransformer._();

  String encode(EmailAddressObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EmailAddressObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EmailAddressObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'email_address':
          return EmailAddressObjectEnum.emailAddress;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EmailAddressObjectEnumTypeTransformer] instance.
  static EmailAddressObjectEnumTypeTransformer? _instance;
}
