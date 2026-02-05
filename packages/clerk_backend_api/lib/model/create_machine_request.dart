//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateMachineRequest {
  /// Returns a new [CreateMachineRequest] instance.
  CreateMachineRequest({
    required this.name,
    this.scopedMachines = const [],
    this.defaultTokenTtl = 3600,
  });

  /// The name of the machine
  String name;

  /// Array of machine IDs that this machine will have access to. Maximum of 150 scopes per machine.
  List<String> scopedMachines;

  /// The default time-to-live (TTL) in seconds for tokens created by this machine. Must be at least 1 second.
  ///
  /// Minimum value: 1
  /// Maximum value: 315360000
  int defaultTokenTtl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateMachineRequest &&
          other.name == name &&
          _deepEquality.equals(other.scopedMachines, scopedMachines) &&
          other.defaultTokenTtl == defaultTokenTtl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) + (scopedMachines.hashCode) + (defaultTokenTtl.hashCode);

  @override
  String toString() =>
      'CreateMachineRequest[name=$name, scopedMachines=$scopedMachines, defaultTokenTtl=$defaultTokenTtl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'scoped_machines'] = this.scopedMachines;
    json[r'default_token_ttl'] = this.defaultTokenTtl;
    return json;
  }

  /// Returns a new [CreateMachineRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateMachineRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateMachineRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateMachineRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateMachineRequest(
        name: mapValueOfType<String>(json, r'name')!,
        scopedMachines: json[r'scoped_machines'] is Iterable
            ? (json[r'scoped_machines'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        defaultTokenTtl:
            mapValueOfType<int>(json, r'default_token_ttl') ?? 3600,
      );
    }
    return null;
  }

  static List<CreateMachineRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateMachineRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateMachineRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateMachineRequest> mapFromJson(dynamic json) {
    final map = <String, CreateMachineRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateMachineRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateMachineRequest-objects as value to a dart map
  static Map<String, List<CreateMachineRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateMachineRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateMachineRequest.listFromJson(
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
  };
}
