//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Invitation {
  /// Returns a new [Invitation] instance.
  Invitation({
    required this.object,
    required this.id,
    required this.emailAddress,
    this.publicMetadata = const {},
    this.revoked,
    required this.status,
    this.url,
    this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  InvitationObjectEnum object;

  String id;

  String emailAddress;

  Map<String, Object> publicMetadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? revoked;

  InvitationStatusEnum status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  /// Unix timestamp of expiration.
  int? expiresAt;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Invitation &&
          other.object == object &&
          other.id == id &&
          other.emailAddress == emailAddress &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.revoked == revoked &&
          other.status == status &&
          other.url == url &&
          other.expiresAt == expiresAt &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (emailAddress.hashCode) +
      (publicMetadata.hashCode) +
      (revoked == null ? 0 : revoked!.hashCode) +
      (status.hashCode) +
      (url == null ? 0 : url!.hashCode) +
      (expiresAt == null ? 0 : expiresAt!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'Invitation[object=$object, id=$id, emailAddress=$emailAddress, publicMetadata=$publicMetadata, revoked=$revoked, status=$status, url=$url, expiresAt=$expiresAt, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'email_address'] = this.emailAddress;
    json[r'public_metadata'] = this.publicMetadata;
    if (this.revoked != null) {
      json[r'revoked'] = this.revoked;
    } else {
      json[r'revoked'] = null;
    }
    json[r'status'] = this.status;
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    if (this.expiresAt != null) {
      json[r'expires_at'] = this.expiresAt;
    } else {
      json[r'expires_at'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [Invitation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Invitation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Invitation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Invitation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Invitation(
        object: InvitationObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata')!,
        revoked: mapValueOfType<bool>(json, r'revoked'),
        status: InvitationStatusEnum.fromJson(json[r'status'])!,
        url: mapValueOfType<String>(json, r'url'),
        expiresAt: mapValueOfType<int>(json, r'expires_at'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<Invitation> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Invitation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Invitation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Invitation> mapFromJson(dynamic json) {
    final map = <String, Invitation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Invitation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Invitation-objects as value to a dart map
  static Map<String, List<Invitation>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Invitation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Invitation.listFromJson(
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
    'email_address',
    'public_metadata',
    'status',
    'created_at',
    'updated_at',
  };
}

class InvitationObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const InvitationObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const invitation = InvitationObjectEnum._(r'invitation');

  /// List of all possible values in this [enum][InvitationObjectEnum].
  static const values = <InvitationObjectEnum>[
    invitation,
  ];

  static InvitationObjectEnum? fromJson(dynamic value) =>
      InvitationObjectEnumTypeTransformer().decode(value);

  static List<InvitationObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InvitationObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InvitationObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [InvitationObjectEnum] to String,
/// and [decode] dynamic data back to [InvitationObjectEnum].
class InvitationObjectEnumTypeTransformer {
  factory InvitationObjectEnumTypeTransformer() =>
      _instance ??= const InvitationObjectEnumTypeTransformer._();

  const InvitationObjectEnumTypeTransformer._();

  String encode(InvitationObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a InvitationObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  InvitationObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'invitation':
          return InvitationObjectEnum.invitation;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [InvitationObjectEnumTypeTransformer] instance.
  static InvitationObjectEnumTypeTransformer? _instance;
}

class InvitationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const InvitationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = InvitationStatusEnum._(r'pending');
  static const accepted = InvitationStatusEnum._(r'accepted');
  static const revoked = InvitationStatusEnum._(r'revoked');
  static const expired = InvitationStatusEnum._(r'expired');

  /// List of all possible values in this [enum][InvitationStatusEnum].
  static const values = <InvitationStatusEnum>[
    pending,
    accepted,
    revoked,
    expired,
  ];

  static InvitationStatusEnum? fromJson(dynamic value) =>
      InvitationStatusEnumTypeTransformer().decode(value);

  static List<InvitationStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InvitationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InvitationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [InvitationStatusEnum] to String,
/// and [decode] dynamic data back to [InvitationStatusEnum].
class InvitationStatusEnumTypeTransformer {
  factory InvitationStatusEnumTypeTransformer() =>
      _instance ??= const InvitationStatusEnumTypeTransformer._();

  const InvitationStatusEnumTypeTransformer._();

  String encode(InvitationStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a InvitationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  InvitationStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'pending':
          return InvitationStatusEnum.pending;
        case r'accepted':
          return InvitationStatusEnum.accepted;
        case r'revoked':
          return InvitationStatusEnum.revoked;
        case r'expired':
          return InvitationStatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [InvitationStatusEnumTypeTransformer] instance.
  static InvitationStatusEnumTypeTransformer? _instance;
}
