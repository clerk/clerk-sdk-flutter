//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IdentificationLink {
  /// Returns a new [IdentificationLink] instance.
  IdentificationLink({
    required this.type,
    required this.id,
  });

  String type;

  String id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentificationLink && other.type == type && other.id == id;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (type.hashCode) + (id.hashCode);

  @override
  String toString() => 'IdentificationLink[type=$type, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'type'] = this.type;
    json[r'id'] = this.id;
    return json;
  }

  /// Returns a new [IdentificationLink] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IdentificationLink? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IdentificationLink[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IdentificationLink[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IdentificationLink(
        type: mapValueOfType<String>(json, r'type')!,
        id: mapValueOfType<String>(json, r'id')!,
      );
    }
    return null;
  }

  static List<IdentificationLink> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IdentificationLink>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IdentificationLink.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IdentificationLink> mapFromJson(dynamic json) {
    final map = <String, IdentificationLink>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IdentificationLink.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IdentificationLink-objects as value to a dart map
  static Map<String, List<IdentificationLink>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IdentificationLink>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IdentificationLink.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
    'id',
  };
}
