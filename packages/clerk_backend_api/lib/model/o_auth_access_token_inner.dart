//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OAuthAccessTokenInner {
  /// Returns a new [OAuthAccessTokenInner] instance.
  OAuthAccessTokenInner({
    required this.object,
    required this.externalAccountId,
    required this.providerUserId,
    required this.token,
    required this.expiresAt,
    required this.provider,
    this.publicMetadata = const {},
    required this.label,
    this.scopes = const [],
    this.idToken,
    this.tokenSecret,
  });

  OAuthAccessTokenInnerObjectEnum object;

  /// External account ID
  String externalAccountId;

  /// The unique ID of the user in the external provider's system
  String providerUserId;

  /// The access token
  String token;

  /// Unix timestamp of the access token expiration.
  int? expiresAt;

  /// The ID of the provider
  String provider;

  Map<String, Object> publicMetadata;

  String? label;

  /// The list of scopes that the token is valid for. Only present for OAuth 2.0 tokens.
  List<String> scopes;

  /// The ID token retrieved from the OIDC provider. Only present for OIDC-compliant OAuth 2.0 providers when available.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? idToken;

  /// The token secret. Only present for OAuth 1.0 tokens.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tokenSecret;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OAuthAccessTokenInner &&
          other.object == object &&
          other.externalAccountId == externalAccountId &&
          other.providerUserId == providerUserId &&
          other.token == token &&
          other.expiresAt == expiresAt &&
          other.provider == provider &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.label == label &&
          _deepEquality.equals(other.scopes, scopes) &&
          other.idToken == idToken &&
          other.tokenSecret == tokenSecret;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (externalAccountId.hashCode) +
      (providerUserId.hashCode) +
      (token.hashCode) +
      (expiresAt == null ? 0 : expiresAt!.hashCode) +
      (provider.hashCode) +
      (publicMetadata.hashCode) +
      (label == null ? 0 : label!.hashCode) +
      (scopes.hashCode) +
      (idToken == null ? 0 : idToken!.hashCode) +
      (tokenSecret == null ? 0 : tokenSecret!.hashCode);

  @override
  String toString() =>
      'OAuthAccessTokenInner[object=$object, externalAccountId=$externalAccountId, providerUserId=$providerUserId, token=$token, expiresAt=$expiresAt, provider=$provider, publicMetadata=$publicMetadata, label=$label, scopes=$scopes, idToken=$idToken, tokenSecret=$tokenSecret]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'external_account_id'] = this.externalAccountId;
    json[r'provider_user_id'] = this.providerUserId;
    json[r'token'] = this.token;
    if (this.expiresAt != null) {
      json[r'expires_at'] = this.expiresAt;
    } else {
      json[r'expires_at'] = null;
    }
    json[r'provider'] = this.provider;
    json[r'public_metadata'] = this.publicMetadata;
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
    json[r'scopes'] = this.scopes;
    if (this.idToken != null) {
      json[r'id_token'] = this.idToken;
    } else {
      json[r'id_token'] = null;
    }
    if (this.tokenSecret != null) {
      json[r'token_secret'] = this.tokenSecret;
    } else {
      json[r'token_secret'] = null;
    }
    return json;
  }

  /// Returns a new [OAuthAccessTokenInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OAuthAccessTokenInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OAuthAccessTokenInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OAuthAccessTokenInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OAuthAccessTokenInner(
        object: OAuthAccessTokenInnerObjectEnum.fromJson(json[r'object'])!,
        externalAccountId:
            mapValueOfType<String>(json, r'external_account_id')!,
        providerUserId: mapValueOfType<String>(json, r'provider_user_id')!,
        token: mapValueOfType<String>(json, r'token')!,
        expiresAt: mapValueOfType<int>(json, r'expires_at'),
        provider: mapValueOfType<String>(json, r'provider')!,
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata')!,
        label: mapValueOfType<String>(json, r'label'),
        scopes: json[r'scopes'] is Iterable
            ? (json[r'scopes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        idToken: mapValueOfType<String>(json, r'id_token'),
        tokenSecret: mapValueOfType<String>(json, r'token_secret'),
      );
    }
    return null;
  }

  static List<OAuthAccessTokenInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OAuthAccessTokenInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OAuthAccessTokenInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OAuthAccessTokenInner> mapFromJson(dynamic json) {
    final map = <String, OAuthAccessTokenInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OAuthAccessTokenInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OAuthAccessTokenInner-objects as value to a dart map
  static Map<String, List<OAuthAccessTokenInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OAuthAccessTokenInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OAuthAccessTokenInner.listFromJson(
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
    'external_account_id',
    'provider_user_id',
    'token',
    'expires_at',
    'provider',
    'public_metadata',
    'label',
  };
}

class OAuthAccessTokenInnerObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const OAuthAccessTokenInnerObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const oauthAccessToken =
      OAuthAccessTokenInnerObjectEnum._(r'oauth_access_token');

  /// List of all possible values in this [enum][OAuthAccessTokenInnerObjectEnum].
  static const values = <OAuthAccessTokenInnerObjectEnum>[
    oauthAccessToken,
  ];

  static OAuthAccessTokenInnerObjectEnum? fromJson(dynamic value) =>
      OAuthAccessTokenInnerObjectEnumTypeTransformer().decode(value);

  static List<OAuthAccessTokenInnerObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OAuthAccessTokenInnerObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OAuthAccessTokenInnerObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OAuthAccessTokenInnerObjectEnum] to String,
/// and [decode] dynamic data back to [OAuthAccessTokenInnerObjectEnum].
class OAuthAccessTokenInnerObjectEnumTypeTransformer {
  factory OAuthAccessTokenInnerObjectEnumTypeTransformer() =>
      _instance ??= const OAuthAccessTokenInnerObjectEnumTypeTransformer._();

  const OAuthAccessTokenInnerObjectEnumTypeTransformer._();

  String encode(OAuthAccessTokenInnerObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OAuthAccessTokenInnerObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OAuthAccessTokenInnerObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'oauth_access_token':
          return OAuthAccessTokenInnerObjectEnum.oauthAccessToken;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OAuthAccessTokenInnerObjectEnumTypeTransformer] instance.
  static OAuthAccessTokenInnerObjectEnumTypeTransformer? _instance;
}
