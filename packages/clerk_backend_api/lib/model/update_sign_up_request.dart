//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateSignUpRequest {
  /// Returns a new [UpdateSignUpRequest] instance.
  UpdateSignUpRequest({
    this.externalId,
    this.customAction,
  });

  /// The ID of the guest attempting to sign up as used in your external systems or your previous authentication solution. This will be copied to the resulting user when the sign-up is completed.
  String? externalId;

  /// If true, the sign-up will be marked as a custom action.
  bool? customAction;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateSignUpRequest &&
          other.externalId == externalId &&
          other.customAction == customAction;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (externalId == null ? 0 : externalId!.hashCode) +
      (customAction == null ? 0 : customAction!.hashCode);

  @override
  String toString() =>
      'UpdateSignUpRequest[externalId=$externalId, customAction=$customAction]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.externalId != null) {
      json[r'external_id'] = this.externalId;
    } else {
      json[r'external_id'] = null;
    }
    if (this.customAction != null) {
      json[r'custom_action'] = this.customAction;
    } else {
      json[r'custom_action'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateSignUpRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateSignUpRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateSignUpRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateSignUpRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateSignUpRequest(
        externalId: mapValueOfType<String>(json, r'external_id'),
        customAction: mapValueOfType<bool>(json, r'custom_action'),
      );
    }
    return null;
  }

  static List<UpdateSignUpRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateSignUpRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateSignUpRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateSignUpRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateSignUpRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateSignUpRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateSignUpRequest-objects as value to a dart map
  static Map<String, List<UpdateSignUpRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateSignUpRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateSignUpRequest.listFromJson(
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
