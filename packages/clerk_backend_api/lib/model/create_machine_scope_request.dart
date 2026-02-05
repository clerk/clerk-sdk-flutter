//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateMachineScopeRequest {
  /// Returns a new [CreateMachineScopeRequest] instance.
  CreateMachineScopeRequest({
    required this.toMachineId,
  });

  /// The ID of the machine that will be scoped to the current machine
  String toMachineId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateMachineScopeRequest && other.toMachineId == toMachineId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (toMachineId.hashCode);

  @override
  String toString() => 'CreateMachineScopeRequest[toMachineId=$toMachineId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'to_machine_id'] = this.toMachineId;
    return json;
  }

  /// Returns a new [CreateMachineScopeRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateMachineScopeRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateMachineScopeRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateMachineScopeRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateMachineScopeRequest(
        toMachineId: mapValueOfType<String>(json, r'to_machine_id')!,
      );
    }
    return null;
  }

  static List<CreateMachineScopeRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateMachineScopeRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateMachineScopeRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateMachineScopeRequest> mapFromJson(dynamic json) {
    final map = <String, CreateMachineScopeRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateMachineScopeRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateMachineScopeRequest-objects as value to a dart map
  static Map<String, List<CreateMachineScopeRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateMachineScopeRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateMachineScopeRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'to_machine_id',
  };
}
