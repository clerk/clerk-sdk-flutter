//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerifyOAuthAccessToken200ResponseAnyOf {
  /// Returns a new [VerifyOAuthAccessToken200ResponseAnyOf] instance.
  VerifyOAuthAccessToken200ResponseAnyOf({
    required this.object,
    required this.id,
    required this.clientId,
    required this.subject,
    this.scopes = const [],
    required this.revoked,
    required this.revocationReason,
    required this.expired,
    required this.expiration,
    required this.createdAt,
    required this.updatedAt,
  });

  VerifyOAuthAccessToken200ResponseAnyOfObjectEnum object;

  String id;

  String clientId;

  String subject;

  List<String> scopes;

  bool revoked;

  String? revocationReason;

  bool expired;

  num? expiration;

  num createdAt;

  num updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerifyOAuthAccessToken200ResponseAnyOf &&
          other.object == object &&
          other.id == id &&
          other.clientId == clientId &&
          other.subject == subject &&
          _deepEquality.equals(other.scopes, scopes) &&
          other.revoked == revoked &&
          other.revocationReason == revocationReason &&
          other.expired == expired &&
          other.expiration == expiration &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (clientId.hashCode) +
      (subject.hashCode) +
      (scopes.hashCode) +
      (revoked.hashCode) +
      (revocationReason == null ? 0 : revocationReason!.hashCode) +
      (expired.hashCode) +
      (expiration == null ? 0 : expiration!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'VerifyOAuthAccessToken200ResponseAnyOf[object=$object, id=$id, clientId=$clientId, subject=$subject, scopes=$scopes, revoked=$revoked, revocationReason=$revocationReason, expired=$expired, expiration=$expiration, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'client_id'] = this.clientId;
    json[r'subject'] = this.subject;
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
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [VerifyOAuthAccessToken200ResponseAnyOf] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerifyOAuthAccessToken200ResponseAnyOf? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerifyOAuthAccessToken200ResponseAnyOf[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerifyOAuthAccessToken200ResponseAnyOf[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerifyOAuthAccessToken200ResponseAnyOf(
        object: VerifyOAuthAccessToken200ResponseAnyOfObjectEnum.fromJson(
            json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        clientId: mapValueOfType<String>(json, r'client_id')!,
        subject: mapValueOfType<String>(json, r'subject')!,
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
        createdAt: num.parse('${json[r'created_at']}'),
        updatedAt: num.parse('${json[r'updated_at']}'),
      );
    }
    return null;
  }

  static List<VerifyOAuthAccessToken200ResponseAnyOf> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerifyOAuthAccessToken200ResponseAnyOf>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyOAuthAccessToken200ResponseAnyOf.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerifyOAuthAccessToken200ResponseAnyOf> mapFromJson(
      dynamic json) {
    final map = <String, VerifyOAuthAccessToken200ResponseAnyOf>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            VerifyOAuthAccessToken200ResponseAnyOf.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerifyOAuthAccessToken200ResponseAnyOf-objects as value to a dart map
  static Map<String, List<VerifyOAuthAccessToken200ResponseAnyOf>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerifyOAuthAccessToken200ResponseAnyOf>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerifyOAuthAccessToken200ResponseAnyOf.listFromJson(
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
    'client_id',
    'subject',
    'scopes',
    'revoked',
    'revocation_reason',
    'expired',
    'expiration',
    'created_at',
    'updated_at',
  };
}

class VerifyOAuthAccessToken200ResponseAnyOfObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerifyOAuthAccessToken200ResponseAnyOfObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const clerkIdpOauthAccessToken =
      VerifyOAuthAccessToken200ResponseAnyOfObjectEnum._(
          r'clerk_idp_oauth_access_token');

  /// List of all possible values in this [enum][VerifyOAuthAccessToken200ResponseAnyOfObjectEnum].
  static const values = <VerifyOAuthAccessToken200ResponseAnyOfObjectEnum>[
    clerkIdpOauthAccessToken,
  ];

  static VerifyOAuthAccessToken200ResponseAnyOfObjectEnum? fromJson(
          dynamic value) =>
      VerifyOAuthAccessToken200ResponseAnyOfObjectEnumTypeTransformer()
          .decode(value);

  static List<VerifyOAuthAccessToken200ResponseAnyOfObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerifyOAuthAccessToken200ResponseAnyOfObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            VerifyOAuthAccessToken200ResponseAnyOfObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerifyOAuthAccessToken200ResponseAnyOfObjectEnum] to String,
/// and [decode] dynamic data back to [VerifyOAuthAccessToken200ResponseAnyOfObjectEnum].
class VerifyOAuthAccessToken200ResponseAnyOfObjectEnumTypeTransformer {
  factory VerifyOAuthAccessToken200ResponseAnyOfObjectEnumTypeTransformer() =>
      _instance ??=
          const VerifyOAuthAccessToken200ResponseAnyOfObjectEnumTypeTransformer
              ._();

  const VerifyOAuthAccessToken200ResponseAnyOfObjectEnumTypeTransformer._();

  String encode(VerifyOAuthAccessToken200ResponseAnyOfObjectEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a VerifyOAuthAccessToken200ResponseAnyOfObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerifyOAuthAccessToken200ResponseAnyOfObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'clerk_idp_oauth_access_token':
          return VerifyOAuthAccessToken200ResponseAnyOfObjectEnum
              .clerkIdpOauthAccessToken;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerifyOAuthAccessToken200ResponseAnyOfObjectEnumTypeTransformer] instance.
  static VerifyOAuthAccessToken200ResponseAnyOfObjectEnumTypeTransformer?
      _instance;
}
