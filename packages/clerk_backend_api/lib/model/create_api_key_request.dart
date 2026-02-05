//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateApiKeyRequest {
  /// Returns a new [CreateApiKeyRequest] instance.
  CreateApiKeyRequest({
    this.type = 'api_key',
    required this.name,
    this.description,
    required this.subject,
    this.claims,
    this.scopes = const [],
    this.createdBy,
    this.secondsUntilExpiration,
  });

  String type;

  String name;

  String? description;

  String subject;

  Object? claims;

  List<String> scopes;

  String? createdBy;

  /// Minimum value: 0
  num? secondsUntilExpiration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateApiKeyRequest &&
          other.type == type &&
          other.name == name &&
          other.description == description &&
          other.subject == subject &&
          other.claims == claims &&
          _deepEquality.equals(other.scopes, scopes) &&
          other.createdBy == createdBy &&
          other.secondsUntilExpiration == secondsUntilExpiration;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (type.hashCode) +
      (name.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (subject.hashCode) +
      (claims == null ? 0 : claims!.hashCode) +
      (scopes.hashCode) +
      (createdBy == null ? 0 : createdBy!.hashCode) +
      (secondsUntilExpiration == null ? 0 : secondsUntilExpiration!.hashCode);

  @override
  String toString() =>
      'CreateApiKeyRequest[type=$type, name=$name, description=$description, subject=$subject, claims=$claims, scopes=$scopes, createdBy=$createdBy, secondsUntilExpiration=$secondsUntilExpiration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'type'] = this.type;
    json[r'name'] = this.name;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    json[r'subject'] = this.subject;
    if (this.claims != null) {
      json[r'claims'] = this.claims;
    } else {
      json[r'claims'] = null;
    }
    json[r'scopes'] = this.scopes;
    if (this.createdBy != null) {
      json[r'created_by'] = this.createdBy;
    } else {
      json[r'created_by'] = null;
    }
    if (this.secondsUntilExpiration != null) {
      json[r'seconds_until_expiration'] = this.secondsUntilExpiration;
    } else {
      json[r'seconds_until_expiration'] = null;
    }
    return json;
  }

  /// Returns a new [CreateApiKeyRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateApiKeyRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateApiKeyRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateApiKeyRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateApiKeyRequest(
        type: mapValueOfType<String>(json, r'type') ?? 'api_key',
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description'),
        subject: mapValueOfType<String>(json, r'subject')!,
        claims: mapValueOfType<Object>(json, r'claims'),
        scopes: json[r'scopes'] is Iterable
            ? (json[r'scopes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        createdBy: mapValueOfType<String>(json, r'created_by'),
        secondsUntilExpiration: json[r'seconds_until_expiration'] == null
            ? null
            : num.parse('${json[r'seconds_until_expiration']}'),
      );
    }
    return null;
  }

  static List<CreateApiKeyRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateApiKeyRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateApiKeyRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateApiKeyRequest> mapFromJson(dynamic json) {
    final map = <String, CreateApiKeyRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateApiKeyRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateApiKeyRequest-objects as value to a dart map
  static Map<String, List<CreateApiKeyRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateApiKeyRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateApiKeyRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'subject',
  };
}
