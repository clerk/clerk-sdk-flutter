//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateM2MToken201Response {
  /// Returns a new [CreateM2MToken201Response] instance.
  CreateM2MToken201Response({
    required this.object,
    required this.id,
    required this.subject,
    this.claims,
    this.scopes = const [],
    required this.token,
    required this.revoked,
    required this.revocationReason,
    required this.expired,
    required this.expiration,
    required this.lastUsedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  CreateM2MToken201ResponseObjectEnum object;

  String id;

  String subject;

  Object? claims;

  List<String> scopes;

  String token;

  bool revoked;

  String? revocationReason;

  bool expired;

  /// The timestamp for when the token will expire, in milliseconds
  num? expiration;

  /// The timestamp for when the token was last used, in milliseconds
  num? lastUsedAt;

  /// The timestamp for when the token was created, in milliseconds
  num createdAt;

  /// The timestamp for when the token was last updated, in milliseconds
  num updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateM2MToken201Response &&
          other.object == object &&
          other.id == id &&
          other.subject == subject &&
          other.claims == claims &&
          _deepEquality.equals(other.scopes, scopes) &&
          other.token == token &&
          other.revoked == revoked &&
          other.revocationReason == revocationReason &&
          other.expired == expired &&
          other.expiration == expiration &&
          other.lastUsedAt == lastUsedAt &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (subject.hashCode) +
      (claims == null ? 0 : claims!.hashCode) +
      (scopes.hashCode) +
      (token.hashCode) +
      (revoked.hashCode) +
      (revocationReason == null ? 0 : revocationReason!.hashCode) +
      (expired.hashCode) +
      (expiration == null ? 0 : expiration!.hashCode) +
      (lastUsedAt == null ? 0 : lastUsedAt!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'CreateM2MToken201Response[object=$object, id=$id, subject=$subject, claims=$claims, scopes=$scopes, token=$token, revoked=$revoked, revocationReason=$revocationReason, expired=$expired, expiration=$expiration, lastUsedAt=$lastUsedAt, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'subject'] = this.subject;
    if (this.claims != null) {
      json[r'claims'] = this.claims;
    } else {
      json[r'claims'] = null;
    }
    json[r'scopes'] = this.scopes;
    json[r'token'] = this.token;
    json[r'revoked'] = this.revoked;
    if (this.revocationReason != null) {
      json[r'revocation_reason'] = this.revocationReason;
    } else {
      json[r'revocation_reason'] = null;
    }
    json[r'expired'] = this.expired;
    if (this.expiration != null) {
      json[r'expiration'] = this.expiration;
    } else {
      json[r'expiration'] = null;
    }
    if (this.lastUsedAt != null) {
      json[r'last_used_at'] = this.lastUsedAt;
    } else {
      json[r'last_used_at'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [CreateM2MToken201Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateM2MToken201Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateM2MToken201Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateM2MToken201Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateM2MToken201Response(
        object: CreateM2MToken201ResponseObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        subject: mapValueOfType<String>(json, r'subject')!,
        claims: mapValueOfType<Object>(json, r'claims'),
        scopes: json[r'scopes'] is Iterable
            ? (json[r'scopes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        token: mapValueOfType<String>(json, r'token')!,
        revoked: mapValueOfType<bool>(json, r'revoked')!,
        revocationReason: mapValueOfType<String>(json, r'revocation_reason'),
        expired: mapValueOfType<bool>(json, r'expired')!,
        expiration: json[r'expiration'] == null
            ? null
            : num.parse('${json[r'expiration']}'),
        lastUsedAt: json[r'last_used_at'] == null
            ? null
            : num.parse('${json[r'last_used_at']}'),
        createdAt: num.parse('${json[r'created_at']}'),
        updatedAt: num.parse('${json[r'updated_at']}'),
      );
    }
    return null;
  }

  static List<CreateM2MToken201Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateM2MToken201Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateM2MToken201Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateM2MToken201Response> mapFromJson(dynamic json) {
    final map = <String, CreateM2MToken201Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateM2MToken201Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateM2MToken201Response-objects as value to a dart map
  static Map<String, List<CreateM2MToken201Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateM2MToken201Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateM2MToken201Response.listFromJson(
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
    'subject',
    'token',
    'revoked',
    'revocation_reason',
    'expired',
    'expiration',
    'last_used_at',
    'created_at',
    'updated_at',
  };
}

class CreateM2MToken201ResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const CreateM2MToken201ResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const machineToMachineToken =
      CreateM2MToken201ResponseObjectEnum._(r'machine_to_machine_token');

  /// List of all possible values in this [enum][CreateM2MToken201ResponseObjectEnum].
  static const values = <CreateM2MToken201ResponseObjectEnum>[
    machineToMachineToken,
  ];

  static CreateM2MToken201ResponseObjectEnum? fromJson(dynamic value) =>
      CreateM2MToken201ResponseObjectEnumTypeTransformer().decode(value);

  static List<CreateM2MToken201ResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateM2MToken201ResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateM2MToken201ResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateM2MToken201ResponseObjectEnum] to String,
/// and [decode] dynamic data back to [CreateM2MToken201ResponseObjectEnum].
class CreateM2MToken201ResponseObjectEnumTypeTransformer {
  factory CreateM2MToken201ResponseObjectEnumTypeTransformer() => _instance ??=
      const CreateM2MToken201ResponseObjectEnumTypeTransformer._();

  const CreateM2MToken201ResponseObjectEnumTypeTransformer._();

  String encode(CreateM2MToken201ResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CreateM2MToken201ResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateM2MToken201ResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'machine_to_machine_token':
          return CreateM2MToken201ResponseObjectEnum.machineToMachineToken;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CreateM2MToken201ResponseObjectEnumTypeTransformer] instance.
  static CreateM2MToken201ResponseObjectEnumTypeTransformer? _instance;
}
