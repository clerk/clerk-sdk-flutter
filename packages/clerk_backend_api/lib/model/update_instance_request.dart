//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateInstanceRequest {
  /// Returns a new [UpdateInstanceRequest] instance.
  UpdateInstanceRequest({
    this.testMode,
    this.hibp,
    this.enhancedEmailDeliverability,
    this.supportEmail,
    this.clerkJsVersion,
    this.developmentOrigin,
    this.allowedOrigins = const [],
    this.cookielessDev,
    this.urlBasedSessionSyncing,
  });

  /// Toggles test mode for this instance, allowing the use of test email addresses and phone numbers. Defaults to true for development instances.
  bool? testMode;

  /// Whether the instance should be using the HIBP service to check passwords for breaches
  bool? hibp;

  /// The \"enhanced_email_deliverability\" feature will send emails from \"verifications@clerk.dev\" instead of your domain. This can be helpful if you do not have a high domain reputation.
  bool? enhancedEmailDeliverability;

  String? supportEmail;

  String? clerkJsVersion;

  String? developmentOrigin;

  /// For browser-like stacks such as browser extensions, Electron, or Capacitor.js the instance allowed origins need to be updated with the request origin value. For Chrome extensions popup, background, or service worker pages the origin is chrome-extension://extension_uiid. For Electron apps the default origin is http://localhost:3000. For Capacitor, the origin is capacitor://localhost.
  List<String> allowedOrigins;

  /// Whether the instance should operate in cookieless development mode (i.e. without third-party cookies). Deprecated: Please use `url_based_session_syncing` instead.
  bool? cookielessDev;

  /// Whether the instance should use URL-based session syncing in development mode (i.e. without third-party cookies).
  bool? urlBasedSessionSyncing;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateInstanceRequest &&
          other.testMode == testMode &&
          other.hibp == hibp &&
          other.enhancedEmailDeliverability == enhancedEmailDeliverability &&
          other.supportEmail == supportEmail &&
          other.clerkJsVersion == clerkJsVersion &&
          other.developmentOrigin == developmentOrigin &&
          _deepEquality.equals(other.allowedOrigins, allowedOrigins) &&
          other.cookielessDev == cookielessDev &&
          other.urlBasedSessionSyncing == urlBasedSessionSyncing;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (testMode == null ? 0 : testMode!.hashCode) +
      (hibp == null ? 0 : hibp!.hashCode) +
      (enhancedEmailDeliverability == null
          ? 0
          : enhancedEmailDeliverability!.hashCode) +
      (supportEmail == null ? 0 : supportEmail!.hashCode) +
      (clerkJsVersion == null ? 0 : clerkJsVersion!.hashCode) +
      (developmentOrigin == null ? 0 : developmentOrigin!.hashCode) +
      (allowedOrigins.hashCode) +
      (cookielessDev == null ? 0 : cookielessDev!.hashCode) +
      (urlBasedSessionSyncing == null ? 0 : urlBasedSessionSyncing!.hashCode);

  @override
  String toString() =>
      'UpdateInstanceRequest[testMode=$testMode, hibp=$hibp, enhancedEmailDeliverability=$enhancedEmailDeliverability, supportEmail=$supportEmail, clerkJsVersion=$clerkJsVersion, developmentOrigin=$developmentOrigin, allowedOrigins=$allowedOrigins, cookielessDev=$cookielessDev, urlBasedSessionSyncing=$urlBasedSessionSyncing]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.testMode != null) {
      json[r'test_mode'] = this.testMode;
    } else {
      json[r'test_mode'] = null;
    }
    if (this.hibp != null) {
      json[r'hibp'] = this.hibp;
    } else {
      json[r'hibp'] = null;
    }
    if (this.enhancedEmailDeliverability != null) {
      json[r'enhanced_email_deliverability'] = this.enhancedEmailDeliverability;
    } else {
      json[r'enhanced_email_deliverability'] = null;
    }
    if (this.supportEmail != null) {
      json[r'support_email'] = this.supportEmail;
    } else {
      json[r'support_email'] = null;
    }
    if (this.clerkJsVersion != null) {
      json[r'clerk_js_version'] = this.clerkJsVersion;
    } else {
      json[r'clerk_js_version'] = null;
    }
    if (this.developmentOrigin != null) {
      json[r'development_origin'] = this.developmentOrigin;
    } else {
      json[r'development_origin'] = null;
    }
    json[r'allowed_origins'] = this.allowedOrigins;
    if (this.cookielessDev != null) {
      json[r'cookieless_dev'] = this.cookielessDev;
    } else {
      json[r'cookieless_dev'] = null;
    }
    if (this.urlBasedSessionSyncing != null) {
      json[r'url_based_session_syncing'] = this.urlBasedSessionSyncing;
    } else {
      json[r'url_based_session_syncing'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateInstanceRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateInstanceRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateInstanceRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateInstanceRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateInstanceRequest(
        testMode: mapValueOfType<bool>(json, r'test_mode'),
        hibp: mapValueOfType<bool>(json, r'hibp'),
        enhancedEmailDeliverability:
            mapValueOfType<bool>(json, r'enhanced_email_deliverability'),
        supportEmail: mapValueOfType<String>(json, r'support_email'),
        clerkJsVersion: mapValueOfType<String>(json, r'clerk_js_version'),
        developmentOrigin: mapValueOfType<String>(json, r'development_origin'),
        allowedOrigins: json[r'allowed_origins'] is Iterable
            ? (json[r'allowed_origins'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        cookielessDev: mapValueOfType<bool>(json, r'cookieless_dev'),
        urlBasedSessionSyncing:
            mapValueOfType<bool>(json, r'url_based_session_syncing'),
      );
    }
    return null;
  }

  static List<UpdateInstanceRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateInstanceRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateInstanceRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateInstanceRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateInstanceRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateInstanceRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateInstanceRequest-objects as value to a dart map
  static Map<String, List<UpdateInstanceRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateInstanceRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateInstanceRequest.listFromJson(
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
