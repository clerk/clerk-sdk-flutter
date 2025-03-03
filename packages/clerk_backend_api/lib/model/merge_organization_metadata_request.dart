//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MergeOrganizationMetadataRequest {
  /// Returns a new [MergeOrganizationMetadataRequest] instance.
  MergeOrganizationMetadataRequest({
    this.publicMetadata = const {},
    this.privateMetadata = const {},
  });

  /// Metadata saved on the organization, that is visible to both your frontend and backend. The new object will be merged with the existing value.
  Map<String, Object> publicMetadata;

  /// Metadata saved on the organization that is only visible to your backend. The new object will be merged with the existing value.
  Map<String, Object> privateMetadata;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MergeOrganizationMetadataRequest &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          _deepEquality.equals(other.privateMetadata, privateMetadata);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (publicMetadata.hashCode) + (privateMetadata.hashCode);

  @override
  String toString() =>
      'MergeOrganizationMetadataRequest[publicMetadata=$publicMetadata, privateMetadata=$privateMetadata]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'public_metadata'] = this.publicMetadata;
    json[r'private_metadata'] = this.privateMetadata;
    return json;
  }

  /// Returns a new [MergeOrganizationMetadataRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MergeOrganizationMetadataRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MergeOrganizationMetadataRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MergeOrganizationMetadataRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MergeOrganizationMetadataRequest(
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        privateMetadata:
            mapCastOfType<String, Object>(json, r'private_metadata') ??
                const {},
      );
    }
    return null;
  }

  static List<MergeOrganizationMetadataRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MergeOrganizationMetadataRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MergeOrganizationMetadataRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MergeOrganizationMetadataRequest> mapFromJson(
      dynamic json) {
    final map = <String, MergeOrganizationMetadataRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MergeOrganizationMetadataRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MergeOrganizationMetadataRequest-objects as value to a dart map
  static Map<String, List<MergeOrganizationMetadataRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MergeOrganizationMetadataRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MergeOrganizationMetadataRequest.listFromJson(
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
