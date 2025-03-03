//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateEmailAddressRequest {
  /// Returns a new [CreateEmailAddressRequest] instance.
  CreateEmailAddressRequest({
    required this.userId,
    required this.emailAddress,
    this.verified,
    this.primary,
  });

  /// The ID representing the user
  String userId;

  /// The new email address. Must adhere to the RFC 5322 specification for email address format.
  String emailAddress;

  /// When created, the email address will be marked as verified.
  bool? verified;

  /// Create this email address as the primary email address for the user. Default: false, unless it is the first email address.
  bool? primary;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateEmailAddressRequest &&
          other.userId == userId &&
          other.emailAddress == emailAddress &&
          other.verified == verified &&
          other.primary == primary;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId.hashCode) +
      (emailAddress.hashCode) +
      (verified == null ? 0 : verified!.hashCode) +
      (primary == null ? 0 : primary!.hashCode);

  @override
  String toString() =>
      'CreateEmailAddressRequest[userId=$userId, emailAddress=$emailAddress, verified=$verified, primary=$primary]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'user_id'] = this.userId;
    json[r'email_address'] = this.emailAddress;
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
    return json;
  }

  /// Returns a new [CreateEmailAddressRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateEmailAddressRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateEmailAddressRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateEmailAddressRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateEmailAddressRequest(
        userId: mapValueOfType<String>(json, r'user_id')!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        verified: mapValueOfType<bool>(json, r'verified'),
        primary: mapValueOfType<bool>(json, r'primary'),
      );
    }
    return null;
  }

  static List<CreateEmailAddressRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateEmailAddressRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateEmailAddressRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateEmailAddressRequest> mapFromJson(dynamic json) {
    final map = <String, CreateEmailAddressRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateEmailAddressRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateEmailAddressRequest-objects as value to a dart map
  static Map<String, List<CreateEmailAddressRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateEmailAddressRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateEmailAddressRequest.listFromJson(
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
    'email_address',
  };
}
