//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetM2MTokens200ResponseM2mTokensInner {
  /// Returns a new [GetM2MTokens200ResponseM2mTokensInner] instance.
  GetM2MTokens200ResponseM2mTokensInner({
    required this.object,
    required this.id,
    required this.subject,
    this.claims,
    this.scopes = const [],
    required this.revoked,
    required this.revocationReason,
    required this.expired,
    required this.expiration,
    required this.lastUsedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  GetM2MTokens200ResponseM2mTokensInnerObjectEnum object;

  String id;

  String subject;

  Object? claims;

  List<String> scopes;

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
      other is GetM2MTokens200ResponseM2mTokensInner &&
          other.object == object &&
          other.id == id &&
          other.subject == subject &&
          other.claims == claims &&
          _deepEquality.equals(other.scopes, scopes) &&
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
      (revoked.hashCode) +
      (revocationReason == null ? 0 : revocationReason!.hashCode) +
      (expired.hashCode) +
      (expiration == null ? 0 : expiration!.hashCode) +
      (lastUsedAt == null ? 0 : lastUsedAt!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'GetM2MTokens200ResponseM2mTokensInner[object=$object, id=$id, subject=$subject, claims=$claims, scopes=$scopes, revoked=$revoked, revocationReason=$revocationReason, expired=$expired, expiration=$expiration, lastUsedAt=$lastUsedAt, createdAt=$createdAt, updatedAt=$updatedAt]';

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

  /// Returns a new [GetM2MTokens200ResponseM2mTokensInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetM2MTokens200ResponseM2mTokensInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GetM2MTokens200ResponseM2mTokensInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GetM2MTokens200ResponseM2mTokensInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetM2MTokens200ResponseM2mTokensInner(
        object: GetM2MTokens200ResponseM2mTokensInnerObjectEnum.fromJson(
            json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        subject: mapValueOfType<String>(json, r'subject')!,
        claims: mapValueOfType<Object>(json, r'claims'),
        scopes: json[r'scopes'] is Iterable
            ? (json[r'scopes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
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

  static List<GetM2MTokens200ResponseM2mTokensInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GetM2MTokens200ResponseM2mTokensInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetM2MTokens200ResponseM2mTokensInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetM2MTokens200ResponseM2mTokensInner> mapFromJson(
      dynamic json) {
    final map = <String, GetM2MTokens200ResponseM2mTokensInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            GetM2MTokens200ResponseM2mTokensInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetM2MTokens200ResponseM2mTokensInner-objects as value to a dart map
  static Map<String, List<GetM2MTokens200ResponseM2mTokensInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GetM2MTokens200ResponseM2mTokensInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetM2MTokens200ResponseM2mTokensInner.listFromJson(
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
    'revoked',
    'revocation_reason',
    'expired',
    'expiration',
    'last_used_at',
    'created_at',
    'updated_at',
  };
}

class GetM2MTokens200ResponseM2mTokensInnerObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const GetM2MTokens200ResponseM2mTokensInnerObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const machineToMachineToken =
      GetM2MTokens200ResponseM2mTokensInnerObjectEnum._(
          r'machine_to_machine_token');

  /// List of all possible values in this [enum][GetM2MTokens200ResponseM2mTokensInnerObjectEnum].
  static const values = <GetM2MTokens200ResponseM2mTokensInnerObjectEnum>[
    machineToMachineToken,
  ];

  static GetM2MTokens200ResponseM2mTokensInnerObjectEnum? fromJson(
          dynamic value) =>
      GetM2MTokens200ResponseM2mTokensInnerObjectEnumTypeTransformer()
          .decode(value);

  static List<GetM2MTokens200ResponseM2mTokensInnerObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GetM2MTokens200ResponseM2mTokensInnerObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            GetM2MTokens200ResponseM2mTokensInnerObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetM2MTokens200ResponseM2mTokensInnerObjectEnum] to String,
/// and [decode] dynamic data back to [GetM2MTokens200ResponseM2mTokensInnerObjectEnum].
class GetM2MTokens200ResponseM2mTokensInnerObjectEnumTypeTransformer {
  factory GetM2MTokens200ResponseM2mTokensInnerObjectEnumTypeTransformer() =>
      _instance ??=
          const GetM2MTokens200ResponseM2mTokensInnerObjectEnumTypeTransformer
              ._();

  const GetM2MTokens200ResponseM2mTokensInnerObjectEnumTypeTransformer._();

  String encode(GetM2MTokens200ResponseM2mTokensInnerObjectEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a GetM2MTokens200ResponseM2mTokensInnerObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetM2MTokens200ResponseM2mTokensInnerObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'machine_to_machine_token':
          return GetM2MTokens200ResponseM2mTokensInnerObjectEnum
              .machineToMachineToken;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [GetM2MTokens200ResponseM2mTokensInnerObjectEnumTypeTransformer] instance.
  static GetM2MTokens200ResponseM2mTokensInnerObjectEnumTypeTransformer?
      _instance;
}
