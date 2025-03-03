//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OAuthApplicationWithSecret {
  /// Returns a new [OAuthApplicationWithSecret] instance.
  OAuthApplicationWithSecret({
    required this.object,
    required this.id,
    required this.instanceId,
    required this.name,
    required this.clientId,
    required this.public,
    required this.scopes,
    this.redirectUris = const [],
    required this.callbackUrl,
    required this.authorizeUrl,
    required this.tokenFetchUrl,
    required this.userInfoUrl,
    required this.discoveryUrl,
    required this.tokenIntrospectionUrl,
    required this.createdAt,
    required this.updatedAt,
    this.clientSecret,
  });

  OAuthApplicationWithSecretObjectEnum object;

  String id;

  String instanceId;

  String name;

  String clientId;

  bool public;

  String scopes;

  List<String> redirectUris;

  /// Deprecated: Use redirect_uris instead.
  String callbackUrl;

  String authorizeUrl;

  String tokenFetchUrl;

  String userInfoUrl;

  String discoveryUrl;

  String tokenIntrospectionUrl;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  /// Empty if public client.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? clientSecret;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OAuthApplicationWithSecret &&
          other.object == object &&
          other.id == id &&
          other.instanceId == instanceId &&
          other.name == name &&
          other.clientId == clientId &&
          other.public == public &&
          other.scopes == scopes &&
          _deepEquality.equals(other.redirectUris, redirectUris) &&
          other.callbackUrl == callbackUrl &&
          other.authorizeUrl == authorizeUrl &&
          other.tokenFetchUrl == tokenFetchUrl &&
          other.userInfoUrl == userInfoUrl &&
          other.discoveryUrl == discoveryUrl &&
          other.tokenIntrospectionUrl == tokenIntrospectionUrl &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.clientSecret == clientSecret;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (instanceId.hashCode) +
      (name.hashCode) +
      (clientId.hashCode) +
      (public.hashCode) +
      (scopes.hashCode) +
      (redirectUris.hashCode) +
      (callbackUrl.hashCode) +
      (authorizeUrl.hashCode) +
      (tokenFetchUrl.hashCode) +
      (userInfoUrl.hashCode) +
      (discoveryUrl.hashCode) +
      (tokenIntrospectionUrl.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode) +
      (clientSecret == null ? 0 : clientSecret!.hashCode);

  @override
  String toString() =>
      'OAuthApplicationWithSecret[object=$object, id=$id, instanceId=$instanceId, name=$name, clientId=$clientId, public=$public, scopes=$scopes, redirectUris=$redirectUris, callbackUrl=$callbackUrl, authorizeUrl=$authorizeUrl, tokenFetchUrl=$tokenFetchUrl, userInfoUrl=$userInfoUrl, discoveryUrl=$discoveryUrl, tokenIntrospectionUrl=$tokenIntrospectionUrl, createdAt=$createdAt, updatedAt=$updatedAt, clientSecret=$clientSecret]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'instance_id'] = this.instanceId;
    json[r'name'] = this.name;
    json[r'client_id'] = this.clientId;
    json[r'public'] = this.public;
    json[r'scopes'] = this.scopes;
    json[r'redirect_uris'] = this.redirectUris;
    json[r'callback_url'] = this.callbackUrl;
    json[r'authorize_url'] = this.authorizeUrl;
    json[r'token_fetch_url'] = this.tokenFetchUrl;
    json[r'user_info_url'] = this.userInfoUrl;
    json[r'discovery_url'] = this.discoveryUrl;
    json[r'token_introspection_url'] = this.tokenIntrospectionUrl;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    if (this.clientSecret != null) {
      json[r'client_secret'] = this.clientSecret;
    } else {
      json[r'client_secret'] = null;
    }
    return json;
  }

  /// Returns a new [OAuthApplicationWithSecret] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OAuthApplicationWithSecret? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OAuthApplicationWithSecret[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OAuthApplicationWithSecret[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OAuthApplicationWithSecret(
        object: OAuthApplicationWithSecretObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        name: mapValueOfType<String>(json, r'name')!,
        clientId: mapValueOfType<String>(json, r'client_id')!,
        public: mapValueOfType<bool>(json, r'public')!,
        scopes: mapValueOfType<String>(json, r'scopes')!,
        redirectUris: json[r'redirect_uris'] is Iterable
            ? (json[r'redirect_uris'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        callbackUrl: mapValueOfType<String>(json, r'callback_url')!,
        authorizeUrl: mapValueOfType<String>(json, r'authorize_url')!,
        tokenFetchUrl: mapValueOfType<String>(json, r'token_fetch_url')!,
        userInfoUrl: mapValueOfType<String>(json, r'user_info_url')!,
        discoveryUrl: mapValueOfType<String>(json, r'discovery_url')!,
        tokenIntrospectionUrl:
            mapValueOfType<String>(json, r'token_introspection_url')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        clientSecret: mapValueOfType<String>(json, r'client_secret'),
      );
    }
    return null;
  }

  static List<OAuthApplicationWithSecret> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OAuthApplicationWithSecret>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OAuthApplicationWithSecret.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OAuthApplicationWithSecret> mapFromJson(dynamic json) {
    final map = <String, OAuthApplicationWithSecret>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OAuthApplicationWithSecret.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OAuthApplicationWithSecret-objects as value to a dart map
  static Map<String, List<OAuthApplicationWithSecret>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OAuthApplicationWithSecret>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OAuthApplicationWithSecret.listFromJson(
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
    'instance_id',
    'name',
    'client_id',
    'public',
    'scopes',
    'redirect_uris',
    'callback_url',
    'authorize_url',
    'token_fetch_url',
    'user_info_url',
    'discovery_url',
    'token_introspection_url',
    'created_at',
    'updated_at',
  };
}

class OAuthApplicationWithSecretObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const OAuthApplicationWithSecretObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const oauthApplication =
      OAuthApplicationWithSecretObjectEnum._(r'oauth_application');

  /// List of all possible values in this [enum][OAuthApplicationWithSecretObjectEnum].
  static const values = <OAuthApplicationWithSecretObjectEnum>[
    oauthApplication,
  ];

  static OAuthApplicationWithSecretObjectEnum? fromJson(dynamic value) =>
      OAuthApplicationWithSecretObjectEnumTypeTransformer().decode(value);

  static List<OAuthApplicationWithSecretObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OAuthApplicationWithSecretObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OAuthApplicationWithSecretObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OAuthApplicationWithSecretObjectEnum] to String,
/// and [decode] dynamic data back to [OAuthApplicationWithSecretObjectEnum].
class OAuthApplicationWithSecretObjectEnumTypeTransformer {
  factory OAuthApplicationWithSecretObjectEnumTypeTransformer() => _instance ??=
      const OAuthApplicationWithSecretObjectEnumTypeTransformer._();

  const OAuthApplicationWithSecretObjectEnumTypeTransformer._();

  String encode(OAuthApplicationWithSecretObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OAuthApplicationWithSecretObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OAuthApplicationWithSecretObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'oauth_application':
          return OAuthApplicationWithSecretObjectEnum.oauthApplication;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OAuthApplicationWithSecretObjectEnumTypeTransformer] instance.
  static OAuthApplicationWithSecretObjectEnumTypeTransformer? _instance;
}
