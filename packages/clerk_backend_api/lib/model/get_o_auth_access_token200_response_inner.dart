//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetOAuthAccessToken200ResponseInner {
  /// Returns a new [GetOAuthAccessToken200ResponseInner] instance.
  GetOAuthAccessToken200ResponseInner({
    this.object,
    this.externalAccountId,
    this.providerUserId,
    this.token,
    this.provider,
    this.publicMetadata = const {},
    this.label,
    this.scopes = const [],
    this.tokenSecret,
    this.expiresAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? object;

  /// External account ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalAccountId;

  /// The unique ID of the user in the external provider's system
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? providerUserId;

  /// The access token
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? token;

  /// The ID of the provider
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? provider;

  Map<String, Object> publicMetadata;

  String? label;

  /// The list of scopes that the token is valid for. Only present for OAuth 2.0 tokens.
  List<String> scopes;

  /// The token secret. Only present for OAuth 1.0 tokens.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tokenSecret;

  /// Unix timestamp of the access token expiration.
  int? expiresAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetOAuthAccessToken200ResponseInner &&
          other.object == object &&
          other.externalAccountId == externalAccountId &&
          other.providerUserId == providerUserId &&
          other.token == token &&
          other.provider == provider &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.label == label &&
          _deepEquality.equals(other.scopes, scopes) &&
          other.tokenSecret == tokenSecret &&
          other.expiresAt == expiresAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object == null ? 0 : object!.hashCode) +
      (externalAccountId == null ? 0 : externalAccountId!.hashCode) +
      (providerUserId == null ? 0 : providerUserId!.hashCode) +
      (token == null ? 0 : token!.hashCode) +
      (provider == null ? 0 : provider!.hashCode) +
      (publicMetadata.hashCode) +
      (label == null ? 0 : label!.hashCode) +
      (scopes.hashCode) +
      (tokenSecret == null ? 0 : tokenSecret!.hashCode) +
      (expiresAt == null ? 0 : expiresAt!.hashCode);

  @override
  String toString() =>
      'GetOAuthAccessToken200ResponseInner[object=$object, externalAccountId=$externalAccountId, providerUserId=$providerUserId, token=$token, provider=$provider, publicMetadata=$publicMetadata, label=$label, scopes=$scopes, tokenSecret=$tokenSecret, expiresAt=$expiresAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    if (this.externalAccountId != null) {
      json[r'external_account_id'] = this.externalAccountId;
    } else {
      json[r'external_account_id'] = null;
    }
    if (this.providerUserId != null) {
      json[r'provider_user_id'] = this.providerUserId;
    } else {
      json[r'provider_user_id'] = null;
    }
    if (this.token != null) {
      json[r'token'] = this.token;
    } else {
      json[r'token'] = null;
    }
    if (this.provider != null) {
      json[r'provider'] = this.provider;
    } else {
      json[r'provider'] = null;
    }
    json[r'public_metadata'] = this.publicMetadata;
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
    json[r'scopes'] = this.scopes;
    if (this.tokenSecret != null) {
      json[r'token_secret'] = this.tokenSecret;
    } else {
      json[r'token_secret'] = null;
    }
    if (this.expiresAt != null) {
      json[r'expires_at'] = this.expiresAt;
    } else {
      json[r'expires_at'] = null;
    }
    return json;
  }

  /// Returns a new [GetOAuthAccessToken200ResponseInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetOAuthAccessToken200ResponseInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GetOAuthAccessToken200ResponseInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GetOAuthAccessToken200ResponseInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetOAuthAccessToken200ResponseInner(
        object: mapValueOfType<String>(json, r'object'),
        externalAccountId: mapValueOfType<String>(json, r'external_account_id'),
        providerUserId: mapValueOfType<String>(json, r'provider_user_id'),
        token: mapValueOfType<String>(json, r'token'),
        provider: mapValueOfType<String>(json, r'provider'),
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        label: mapValueOfType<String>(json, r'label'),
        scopes: json[r'scopes'] is Iterable
            ? (json[r'scopes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        tokenSecret: mapValueOfType<String>(json, r'token_secret'),
        expiresAt: mapValueOfType<int>(json, r'expires_at'),
      );
    }
    return null;
  }

  static List<GetOAuthAccessToken200ResponseInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GetOAuthAccessToken200ResponseInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetOAuthAccessToken200ResponseInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetOAuthAccessToken200ResponseInner> mapFromJson(
      dynamic json) {
    final map = <String, GetOAuthAccessToken200ResponseInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetOAuthAccessToken200ResponseInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetOAuthAccessToken200ResponseInner-objects as value to a dart map
  static Map<String, List<GetOAuthAccessToken200ResponseInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GetOAuthAccessToken200ResponseInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetOAuthAccessToken200ResponseInner.listFromJson(
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
