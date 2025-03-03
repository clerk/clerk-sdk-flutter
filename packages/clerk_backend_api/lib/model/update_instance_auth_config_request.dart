//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateInstanceAuthConfigRequest {
  /// Returns a new [UpdateInstanceAuthConfigRequest] instance.
  UpdateInstanceAuthConfigRequest({
    this.restrictedToAllowlist = false,
    this.fromEmailAddress,
    this.progressiveSignUp,
    this.enhancedEmailDeliverability,
    this.testMode,
  });

  /// Whether sign up is restricted to email addresses, phone numbers and usernames that are on the allowlist.
  bool? restrictedToAllowlist;

  /// The local part of the email address from which authentication-related emails (e.g. OTP code, magic links) will be sent. Only alphanumeric values are allowed. Note that this value should contain only the local part of the address (e.g. `foo` for `foo@example.com`).
  String? fromEmailAddress;

  /// Enable the Progressive Sign Up algorithm. Refer to the [docs](https://clerk.com/docs/upgrade-guides/progressive-sign-up) for more info.
  bool? progressiveSignUp;

  /// The \"enhanced_email_deliverability\" feature will send emails from \"verifications@clerk.dev\" instead of your domain. This can be helpful if you do not have a high domain reputation.
  bool? enhancedEmailDeliverability;

  /// Toggles test mode for this instance, allowing the use of test email addresses and phone numbers. Defaults to true for development instances.
  bool? testMode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateInstanceAuthConfigRequest &&
          other.restrictedToAllowlist == restrictedToAllowlist &&
          other.fromEmailAddress == fromEmailAddress &&
          other.progressiveSignUp == progressiveSignUp &&
          other.enhancedEmailDeliverability == enhancedEmailDeliverability &&
          other.testMode == testMode;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (restrictedToAllowlist == null ? 0 : restrictedToAllowlist!.hashCode) +
      (fromEmailAddress == null ? 0 : fromEmailAddress!.hashCode) +
      (progressiveSignUp == null ? 0 : progressiveSignUp!.hashCode) +
      (enhancedEmailDeliverability == null
          ? 0
          : enhancedEmailDeliverability!.hashCode) +
      (testMode == null ? 0 : testMode!.hashCode);

  @override
  String toString() =>
      'UpdateInstanceAuthConfigRequest[restrictedToAllowlist=$restrictedToAllowlist, fromEmailAddress=$fromEmailAddress, progressiveSignUp=$progressiveSignUp, enhancedEmailDeliverability=$enhancedEmailDeliverability, testMode=$testMode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.restrictedToAllowlist != null) {
      json[r'restricted_to_allowlist'] = this.restrictedToAllowlist;
    } else {
      json[r'restricted_to_allowlist'] = null;
    }
    if (this.fromEmailAddress != null) {
      json[r'from_email_address'] = this.fromEmailAddress;
    } else {
      json[r'from_email_address'] = null;
    }
    if (this.progressiveSignUp != null) {
      json[r'progressive_sign_up'] = this.progressiveSignUp;
    } else {
      json[r'progressive_sign_up'] = null;
    }
    if (this.enhancedEmailDeliverability != null) {
      json[r'enhanced_email_deliverability'] = this.enhancedEmailDeliverability;
    } else {
      json[r'enhanced_email_deliverability'] = null;
    }
    if (this.testMode != null) {
      json[r'test_mode'] = this.testMode;
    } else {
      json[r'test_mode'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateInstanceAuthConfigRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateInstanceAuthConfigRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateInstanceAuthConfigRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateInstanceAuthConfigRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateInstanceAuthConfigRequest(
        restrictedToAllowlist:
            mapValueOfType<bool>(json, r'restricted_to_allowlist') ?? false,
        fromEmailAddress: mapValueOfType<String>(json, r'from_email_address'),
        progressiveSignUp: mapValueOfType<bool>(json, r'progressive_sign_up'),
        enhancedEmailDeliverability:
            mapValueOfType<bool>(json, r'enhanced_email_deliverability'),
        testMode: mapValueOfType<bool>(json, r'test_mode'),
      );
    }
    return null;
  }

  static List<UpdateInstanceAuthConfigRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateInstanceAuthConfigRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateInstanceAuthConfigRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateInstanceAuthConfigRequest> mapFromJson(
      dynamic json) {
    final map = <String, UpdateInstanceAuthConfigRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateInstanceAuthConfigRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateInstanceAuthConfigRequest-objects as value to a dart map
  static Map<String, List<UpdateInstanceAuthConfigRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateInstanceAuthConfigRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateInstanceAuthConfigRequest.listFromJson(
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
