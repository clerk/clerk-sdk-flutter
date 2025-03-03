//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdatePhoneNumberRequest {
  /// Returns a new [UpdatePhoneNumberRequest] instance.
  UpdatePhoneNumberRequest({
    this.verified,
    this.primary,
    this.reservedForSecondFactor,
  });

  /// The phone number will be marked as verified.
  bool? verified;

  /// Set this phone number as the primary phone number for the user.
  bool? primary;

  /// Set this phone number as reserved for multi-factor authentication. The phone number must also be verified. If there are no other reserved second factors, the phone number will be set as the default second factor.
  bool? reservedForSecondFactor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdatePhoneNumberRequest &&
          other.verified == verified &&
          other.primary == primary &&
          other.reservedForSecondFactor == reservedForSecondFactor;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (verified == null ? 0 : verified!.hashCode) +
      (primary == null ? 0 : primary!.hashCode) +
      (reservedForSecondFactor == null ? 0 : reservedForSecondFactor!.hashCode);

  @override
  String toString() =>
      'UpdatePhoneNumberRequest[verified=$verified, primary=$primary, reservedForSecondFactor=$reservedForSecondFactor]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.verified != null) {
      json[r'verified'] = this.verified;
    } else {
      json[r'verified'] = null;
    }
    if (this.primary != null) {
      json[r'primary'] = this.primary;
    } else {
      json[r'primary'] = null;
    }
    if (this.reservedForSecondFactor != null) {
      json[r'reserved_for_second_factor'] = this.reservedForSecondFactor;
    } else {
      json[r'reserved_for_second_factor'] = null;
    }
    return json;
  }

  /// Returns a new [UpdatePhoneNumberRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdatePhoneNumberRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdatePhoneNumberRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdatePhoneNumberRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdatePhoneNumberRequest(
        verified: mapValueOfType<bool>(json, r'verified'),
        primary: mapValueOfType<bool>(json, r'primary'),
        reservedForSecondFactor:
            mapValueOfType<bool>(json, r'reserved_for_second_factor'),
      );
    }
    return null;
  }

  static List<UpdatePhoneNumberRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdatePhoneNumberRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdatePhoneNumberRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdatePhoneNumberRequest> mapFromJson(dynamic json) {
    final map = <String, UpdatePhoneNumberRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdatePhoneNumberRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdatePhoneNumberRequest-objects as value to a dart map
  static Map<String, List<UpdatePhoneNumberRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdatePhoneNumberRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdatePhoneNumberRequest.listFromJson(
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
