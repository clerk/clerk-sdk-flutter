//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ReplaceRoleSetRequest {
  /// Returns a new [ReplaceRoleSetRequest] instance.
  ReplaceRoleSetRequest({
    required this.destRoleSetKey,
    this.reassignmentMappings,
  });

  /// The key of the destination role set
  String destRoleSetKey;

  /// Mappings from source role keys to destination role keys. Required if members have roles that need to be reassigned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Map<String, String>? reassignmentMappings;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReplaceRoleSetRequest &&
          other.destRoleSetKey == destRoleSetKey &&
          _deepEquality.equals(
              other.reassignmentMappings, reassignmentMappings);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (destRoleSetKey.hashCode) +
      (reassignmentMappings == null ? 0 : reassignmentMappings!.hashCode);

  @override
  String toString() =>
      'ReplaceRoleSetRequest[destRoleSetKey=$destRoleSetKey, reassignmentMappings=$reassignmentMappings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'dest_role_set_key'] = this.destRoleSetKey;
    if (this.reassignmentMappings != null) {
      json[r'reassignment_mappings'] = this.reassignmentMappings;
    } else {
      json[r'reassignment_mappings'] = null;
    }
    return json;
  }

  /// Returns a new [ReplaceRoleSetRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ReplaceRoleSetRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ReplaceRoleSetRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ReplaceRoleSetRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ReplaceRoleSetRequest(
        destRoleSetKey: mapValueOfType<String>(json, r'dest_role_set_key')!,
        reassignmentMappings:
            mapCastOfType<String, String>(json, r'reassignment_mappings'),
      );
    }
    return null;
  }

  static List<ReplaceRoleSetRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ReplaceRoleSetRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReplaceRoleSetRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ReplaceRoleSetRequest> mapFromJson(dynamic json) {
    final map = <String, ReplaceRoleSetRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReplaceRoleSetRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ReplaceRoleSetRequest-objects as value to a dart map
  static Map<String, List<ReplaceRoleSetRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ReplaceRoleSetRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ReplaceRoleSetRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'dest_role_set_key',
  };
}
