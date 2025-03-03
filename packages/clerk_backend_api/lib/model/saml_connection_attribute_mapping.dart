//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SAMLConnectionAttributeMapping {
  /// Returns a new [SAMLConnectionAttributeMapping] instance.
  SAMLConnectionAttributeMapping({
    required this.userId,
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
  });

  String userId;

  String emailAddress;

  String firstName;

  String lastName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SAMLConnectionAttributeMapping &&
          other.userId == userId &&
          other.emailAddress == emailAddress &&
          other.firstName == firstName &&
          other.lastName == lastName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId.hashCode) +
      (emailAddress.hashCode) +
      (firstName.hashCode) +
      (lastName.hashCode);

  @override
  String toString() =>
      'SAMLConnectionAttributeMapping[userId=$userId, emailAddress=$emailAddress, firstName=$firstName, lastName=$lastName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'user_id'] = this.userId;
    json[r'email_address'] = this.emailAddress;
    json[r'first_name'] = this.firstName;
    json[r'last_name'] = this.lastName;
    return json;
  }

  /// Returns a new [SAMLConnectionAttributeMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SAMLConnectionAttributeMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SAMLConnectionAttributeMapping[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SAMLConnectionAttributeMapping[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SAMLConnectionAttributeMapping(
        userId: mapValueOfType<String>(json, r'user_id')!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        firstName: mapValueOfType<String>(json, r'first_name')!,
        lastName: mapValueOfType<String>(json, r'last_name')!,
      );
    }
    return null;
  }

  static List<SAMLConnectionAttributeMapping> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SAMLConnectionAttributeMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SAMLConnectionAttributeMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SAMLConnectionAttributeMapping> mapFromJson(dynamic json) {
    final map = <String, SAMLConnectionAttributeMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SAMLConnectionAttributeMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SAMLConnectionAttributeMapping-objects as value to a dart map
  static Map<String, List<SAMLConnectionAttributeMapping>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SAMLConnectionAttributeMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SAMLConnectionAttributeMapping.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'user_id',
    'email_address',
    'first_name',
    'last_name',
  };
}
