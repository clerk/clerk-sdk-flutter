//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreatePhoneNumberRequest {
  /// Returns a new [CreatePhoneNumberRequest] instance.
  CreatePhoneNumberRequest({
    required this.userId,
    required this.phoneNumber,
    this.verified,
    this.primary,
    this.reservedForSecondFactor,
  });

  /// The ID representing the user
  String userId;

  /// The new phone number. Must adhere to the E.164 standard for phone number format.
  String phoneNumber;

  /// When created, the phone number will be marked as verified.
  bool? verified;

  /// Create this phone number as the primary phone number for the user. Default: false, unless it is the first phone number.
  bool? primary;

  /// Create this phone number as reserved for multi-factor authentication. The phone number must also be verified. If there are no other reserved second factors, the phone number will be set as the default second factor.
  bool? reservedForSecondFactor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatePhoneNumberRequest &&
          other.userId == userId &&
          other.phoneNumber == phoneNumber &&
          other.verified == verified &&
          other.primary == primary &&
          other.reservedForSecondFactor == reservedForSecondFactor;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId.hashCode) +
      (phoneNumber.hashCode) +
      (verified == null ? 0 : verified!.hashCode) +
      (primary == null ? 0 : primary!.hashCode) +
      (reservedForSecondFactor == null ? 0 : reservedForSecondFactor!.hashCode);

  @override
  String toString() =>
      'CreatePhoneNumberRequest[userId=$userId, phoneNumber=$phoneNumber, verified=$verified, primary=$primary, reservedForSecondFactor=$reservedForSecondFactor]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'user_id'] = this.userId;
    json[r'phone_number'] = this.phoneNumber;
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

  /// Returns a new [CreatePhoneNumberRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreatePhoneNumberRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreatePhoneNumberRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreatePhoneNumberRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreatePhoneNumberRequest(
        userId: mapValueOfType<String>(json, r'user_id')!,
        phoneNumber: mapValueOfType<String>(json, r'phone_number')!,
        verified: mapValueOfType<bool>(json, r'verified'),
        primary: mapValueOfType<bool>(json, r'primary'),
        reservedForSecondFactor:
            mapValueOfType<bool>(json, r'reserved_for_second_factor'),
      );
    }
    return null;
  }

  static List<CreatePhoneNumberRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreatePhoneNumberRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePhoneNumberRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreatePhoneNumberRequest> mapFromJson(dynamic json) {
    final map = <String, CreatePhoneNumberRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreatePhoneNumberRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreatePhoneNumberRequest-objects as value to a dart map
  static Map<String, List<CreatePhoneNumberRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreatePhoneNumberRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreatePhoneNumberRequest.listFromJson(
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
    'phone_number',
  };
}
