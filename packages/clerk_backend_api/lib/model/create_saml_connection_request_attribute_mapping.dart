//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateSAMLConnectionRequestAttributeMapping {
  /// Returns a new [CreateSAMLConnectionRequestAttributeMapping] instance.
  CreateSAMLConnectionRequestAttributeMapping({
    this.userId,
    this.emailAddress,
    this.firstName,
    this.lastName,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? emailAddress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? firstName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateSAMLConnectionRequestAttributeMapping &&
          other.userId == userId &&
          other.emailAddress == emailAddress &&
          other.firstName == firstName &&
          other.lastName == lastName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId == null ? 0 : userId!.hashCode) +
      (emailAddress == null ? 0 : emailAddress!.hashCode) +
      (firstName == null ? 0 : firstName!.hashCode) +
      (lastName == null ? 0 : lastName!.hashCode);

  @override
  String toString() =>
      'CreateSAMLConnectionRequestAttributeMapping[userId=$userId, emailAddress=$emailAddress, firstName=$firstName, lastName=$lastName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    if (this.emailAddress != null) {
      json[r'email_address'] = this.emailAddress;
    } else {
      json[r'email_address'] = null;
    }
    if (this.firstName != null) {
      json[r'first_name'] = this.firstName;
    } else {
      json[r'first_name'] = null;
    }
    if (this.lastName != null) {
      json[r'last_name'] = this.lastName;
    } else {
      json[r'last_name'] = null;
    }
    return json;
  }

  /// Returns a new [CreateSAMLConnectionRequestAttributeMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateSAMLConnectionRequestAttributeMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateSAMLConnectionRequestAttributeMapping[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateSAMLConnectionRequestAttributeMapping[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateSAMLConnectionRequestAttributeMapping(
        userId: mapValueOfType<String>(json, r'user_id'),
        emailAddress: mapValueOfType<String>(json, r'email_address'),
        firstName: mapValueOfType<String>(json, r'first_name'),
        lastName: mapValueOfType<String>(json, r'last_name'),
      );
    }
    return null;
  }

  static List<CreateSAMLConnectionRequestAttributeMapping> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateSAMLConnectionRequestAttributeMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSAMLConnectionRequestAttributeMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateSAMLConnectionRequestAttributeMapping> mapFromJson(
      dynamic json) {
    final map = <String, CreateSAMLConnectionRequestAttributeMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            CreateSAMLConnectionRequestAttributeMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateSAMLConnectionRequestAttributeMapping-objects as value to a dart map
  static Map<String, List<CreateSAMLConnectionRequestAttributeMapping>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateSAMLConnectionRequestAttributeMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            CreateSAMLConnectionRequestAttributeMapping.listFromJson(
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
