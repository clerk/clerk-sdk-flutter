//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerifyOAuthAccessToken200Response {
  /// Returns a new [VerifyOAuthAccessToken200Response] instance.
  VerifyOAuthAccessToken200Response({
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
    required this.active,
  });

  VerifyOAuthAccessToken200ResponseObjectEnum object;

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

  /// Indicates that a JWT access token is not active (expired)
  bool active;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerifyOAuthAccessToken200Response &&
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
          other.updatedAt == updatedAt &&
          other.active == active;

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
      (updatedAt.hashCode) +
      (active.hashCode);

  @override
  String toString() =>
      'VerifyOAuthAccessToken200Response[object=$object, id=$id, clientId=$clientId, subject=$subject, scopes=$scopes, revoked=$revoked, revocationReason=$revocationReason, expired=$expired, expiration=$expiration, createdAt=$createdAt, updatedAt=$updatedAt, active=$active]';

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
    json[r'active'] = this.active;
    return json;
  }

  /// Returns a new [VerifyOAuthAccessToken200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerifyOAuthAccessToken200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerifyOAuthAccessToken200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerifyOAuthAccessToken200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerifyOAuthAccessToken200Response(
        object: VerifyOAuthAccessToken200ResponseObjectEnum.fromJson(
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
        active: mapValueOfType<bool>(json, r'active')!,
      );
    }
    return null;
  }

  static List<VerifyOAuthAccessToken200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerifyOAuthAccessToken200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyOAuthAccessToken200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerifyOAuthAccessToken200Response> mapFromJson(
      dynamic json) {
    final map = <String, VerifyOAuthAccessToken200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyOAuthAccessToken200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerifyOAuthAccessToken200Response-objects as value to a dart map
  static Map<String, List<VerifyOAuthAccessToken200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerifyOAuthAccessToken200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerifyOAuthAccessToken200Response.listFromJson(
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
    'active',
  };
}

class VerifyOAuthAccessToken200ResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const VerifyOAuthAccessToken200ResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const clerkIdpOauthAccessToken =
      VerifyOAuthAccessToken200ResponseObjectEnum._(
          r'clerk_idp_oauth_access_token');

  /// List of all possible values in this [enum][VerifyOAuthAccessToken200ResponseObjectEnum].
  static const values = <VerifyOAuthAccessToken200ResponseObjectEnum>[
    clerkIdpOauthAccessToken,
  ];

  static VerifyOAuthAccessToken200ResponseObjectEnum? fromJson(dynamic value) =>
      VerifyOAuthAccessToken200ResponseObjectEnumTypeTransformer()
          .decode(value);

  static List<VerifyOAuthAccessToken200ResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerifyOAuthAccessToken200ResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyOAuthAccessToken200ResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerifyOAuthAccessToken200ResponseObjectEnum] to String,
/// and [decode] dynamic data back to [VerifyOAuthAccessToken200ResponseObjectEnum].
class VerifyOAuthAccessToken200ResponseObjectEnumTypeTransformer {
  factory VerifyOAuthAccessToken200ResponseObjectEnumTypeTransformer() =>
      _instance ??=
          const VerifyOAuthAccessToken200ResponseObjectEnumTypeTransformer._();

  const VerifyOAuthAccessToken200ResponseObjectEnumTypeTransformer._();

  String encode(VerifyOAuthAccessToken200ResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerifyOAuthAccessToken200ResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerifyOAuthAccessToken200ResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'clerk_idp_oauth_access_token':
          return VerifyOAuthAccessToken200ResponseObjectEnum
              .clerkIdpOauthAccessToken;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerifyOAuthAccessToken200ResponseObjectEnumTypeTransformer] instance.
  static VerifyOAuthAccessToken200ResponseObjectEnumTypeTransformer? _instance;
}
