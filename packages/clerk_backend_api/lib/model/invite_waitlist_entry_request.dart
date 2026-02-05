//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InviteWaitlistEntryRequest {
  /// Returns a new [InviteWaitlistEntryRequest] instance.
  InviteWaitlistEntryRequest({
    this.ignoreExisting = false,
  });

  /// Whether an invitation should be created if there is already an existing invitation for this email address, or it's claimed by another user.
  bool? ignoreExisting;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InviteWaitlistEntryRequest &&
          other.ignoreExisting == ignoreExisting;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ignoreExisting == null ? 0 : ignoreExisting!.hashCode);

  @override
  String toString() =>
      'InviteWaitlistEntryRequest[ignoreExisting=$ignoreExisting]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ignoreExisting != null) {
      json[r'ignore_existing'] = this.ignoreExisting;
    } else {
      json[r'ignore_existing'] = null;
    }
    return json;
  }

  /// Returns a new [InviteWaitlistEntryRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InviteWaitlistEntryRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InviteWaitlistEntryRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InviteWaitlistEntryRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InviteWaitlistEntryRequest(
        ignoreExisting: mapValueOfType<bool>(json, r'ignore_existing') ?? false,
      );
    }
    return null;
  }

  static List<InviteWaitlistEntryRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InviteWaitlistEntryRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InviteWaitlistEntryRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InviteWaitlistEntryRequest> mapFromJson(dynamic json) {
    final map = <String, InviteWaitlistEntryRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InviteWaitlistEntryRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InviteWaitlistEntryRequest-objects as value to a dart map
  static Map<String, List<InviteWaitlistEntryRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InviteWaitlistEntryRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InviteWaitlistEntryRequest.listFromJson(
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
