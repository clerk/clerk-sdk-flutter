//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateOAuthApplicationRequest {
  /// Returns a new [UpdateOAuthApplicationRequest] instance.
  UpdateOAuthApplicationRequest({
    this.name,
    this.redirectUris = const [],
    this.callbackUrl,
    this.scopes = 'profile email',
    this.public,
  });

  /// The new name of the OAuth application. Max length: 256
  String? name;

  /// An array of redirect URIs of the new OAuth application
  List<String>? redirectUris;

  /// The new callback URL of the OAuth application
  String? callbackUrl;

  /// Define the allowed scopes for the new OAuth applications that dictate the user payload of the OAuth user info endpoint. Available scopes are `profile`, `email`, `public_metadata`, `private_metadata`. Provide the requested scopes as a string, separated by spaces.
  String? scopes;

  /// If true, this client is public and you can use the Proof Key of Code Exchange (PKCE) flow.
  bool? public;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateOAuthApplicationRequest &&
          other.name == name &&
          _deepEquality.equals(other.redirectUris, redirectUris) &&
          other.callbackUrl == callbackUrl &&
          other.scopes == scopes &&
          other.public == public;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name == null ? 0 : name!.hashCode) +
      (redirectUris == null ? 0 : redirectUris!.hashCode) +
      (callbackUrl == null ? 0 : callbackUrl!.hashCode) +
      (scopes == null ? 0 : scopes!.hashCode) +
      (public == null ? 0 : public!.hashCode);

  @override
  String toString() =>
      'UpdateOAuthApplicationRequest[name=$name, redirectUris=$redirectUris, callbackUrl=$callbackUrl, scopes=$scopes, public=$public]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.redirectUris != null) {
      json[r'redirect_uris'] = this.redirectUris;
    } else {
      json[r'redirect_uris'] = null;
    }
    if (this.callbackUrl != null) {
      json[r'callback_url'] = this.callbackUrl;
    } else {
      json[r'callback_url'] = null;
    }
    if (this.scopes != null) {
      json[r'scopes'] = this.scopes;
    } else {
      json[r'scopes'] = null;
    }
    if (this.public != null) {
      json[r'public'] = this.public;
    } else {
      json[r'public'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateOAuthApplicationRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateOAuthApplicationRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateOAuthApplicationRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateOAuthApplicationRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateOAuthApplicationRequest(
        name: mapValueOfType<String>(json, r'name'),
        redirectUris: json[r'redirect_uris'] is Iterable
            ? (json[r'redirect_uris'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        callbackUrl: mapValueOfType<String>(json, r'callback_url'),
        scopes: mapValueOfType<String>(json, r'scopes') ?? 'profile email',
        public: mapValueOfType<bool>(json, r'public'),
      );
    }
    return null;
  }

  static List<UpdateOAuthApplicationRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateOAuthApplicationRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateOAuthApplicationRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateOAuthApplicationRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateOAuthApplicationRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateOAuthApplicationRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateOAuthApplicationRequest-objects as value to a dart map
  static Map<String, List<UpdateOAuthApplicationRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateOAuthApplicationRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateOAuthApplicationRequest.listFromJson(
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
