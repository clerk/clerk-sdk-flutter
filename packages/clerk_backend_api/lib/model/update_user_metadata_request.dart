//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateUserMetadataRequest {
  /// Returns a new [UpdateUserMetadataRequest] instance.
  UpdateUserMetadataRequest({
    this.publicMetadata = const {},
    this.privateMetadata = const {},
    this.unsafeMetadata = const {},
  });

  /// Metadata saved on the user, that is visible to both your frontend and backend. The new object will be merged with the existing value.
  Map<String, Object> publicMetadata;

  /// Metadata saved on the user that is only visible to your backend. The new object will be merged with the existing value.
  Map<String, Object> privateMetadata;

  /// Metadata saved on the user, that can be updated from both the Frontend and Backend APIs. The new object will be merged with the existing value.  Note: Since this data can be modified from the frontend, it is not guaranteed to be safe.
  Map<String, Object> unsafeMetadata;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateUserMetadataRequest &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          _deepEquality.equals(other.privateMetadata, privateMetadata) &&
          _deepEquality.equals(other.unsafeMetadata, unsafeMetadata);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (publicMetadata.hashCode) +
      (privateMetadata.hashCode) +
      (unsafeMetadata.hashCode);

  @override
  String toString() =>
      'UpdateUserMetadataRequest[publicMetadata=$publicMetadata, privateMetadata=$privateMetadata, unsafeMetadata=$unsafeMetadata]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'public_metadata'] = this.publicMetadata;
    json[r'private_metadata'] = this.privateMetadata;
    json[r'unsafe_metadata'] = this.unsafeMetadata;
    return json;
  }

  /// Returns a new [UpdateUserMetadataRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateUserMetadataRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateUserMetadataRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateUserMetadataRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateUserMetadataRequest(
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
        unsafeMetadata:
            mapCastOfType<String, Object>(json, r'unsafe_metadata') ?? const {},
      );
    }
    return null;
  }

  static List<UpdateUserMetadataRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateUserMetadataRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateUserMetadataRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateUserMetadataRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateUserMetadataRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateUserMetadataRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateUserMetadataRequest-objects as value to a dart map
  static Map<String, List<UpdateUserMetadataRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateUserMetadataRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateUserMetadataRequest.listFromJson(
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
