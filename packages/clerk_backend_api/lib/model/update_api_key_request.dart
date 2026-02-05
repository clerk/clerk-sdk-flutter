//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateApiKeyRequest {
  /// Returns a new [UpdateApiKeyRequest] instance.
  UpdateApiKeyRequest({
    this.claims,
    this.scopes = const [],
    this.description,
    this.subject,
    this.secondsUntilExpiration,
  });

  Object? claims;

  List<String> scopes;

  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subject;

  /// Minimum value: 0
  num? secondsUntilExpiration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateApiKeyRequest &&
          other.claims == claims &&
          _deepEquality.equals(other.scopes, scopes) &&
          other.description == description &&
          other.subject == subject &&
          other.secondsUntilExpiration == secondsUntilExpiration;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (claims == null ? 0 : claims!.hashCode) +
      (scopes.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (subject == null ? 0 : subject!.hashCode) +
      (secondsUntilExpiration == null ? 0 : secondsUntilExpiration!.hashCode);

  @override
  String toString() =>
      'UpdateApiKeyRequest[claims=$claims, scopes=$scopes, description=$description, subject=$subject, secondsUntilExpiration=$secondsUntilExpiration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.claims != null) {
      json[r'claims'] = this.claims;
    } else {
      json[r'claims'] = null;
    }
    json[r'scopes'] = this.scopes;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    if (this.secondsUntilExpiration != null) {
      json[r'seconds_until_expiration'] = this.secondsUntilExpiration;
    } else {
      json[r'seconds_until_expiration'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateApiKeyRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateApiKeyRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateApiKeyRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateApiKeyRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateApiKeyRequest(
        claims: mapValueOfType<Object>(json, r'claims'),
        scopes: json[r'scopes'] is Iterable
            ? (json[r'scopes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        description: mapValueOfType<String>(json, r'description'),
        subject: mapValueOfType<String>(json, r'subject'),
        secondsUntilExpiration: json[r'seconds_until_expiration'] == null
            ? null
            : num.parse('${json[r'seconds_until_expiration']}'),
      );
    }
    return null;
  }

  static List<UpdateApiKeyRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateApiKeyRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateApiKeyRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateApiKeyRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateApiKeyRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateApiKeyRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateApiKeyRequest-objects as value to a dart map
  static Map<String, List<UpdateApiKeyRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateApiKeyRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateApiKeyRequest.listFromJson(
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
