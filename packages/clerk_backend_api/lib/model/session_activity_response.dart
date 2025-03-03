//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SessionActivityResponse {
  /// Returns a new [SessionActivityResponse] instance.
  SessionActivityResponse({
    required this.object,
    required this.id,
    this.deviceType,
    required this.isMobile,
    this.browserName,
    this.browserVersion,
    this.ipAddress,
    this.city,
    this.country,
  });

  String object;

  String id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? deviceType;

  bool isMobile;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? browserName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? browserVersion;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ipAddress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? city;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? country;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionActivityResponse &&
          other.object == object &&
          other.id == id &&
          other.deviceType == deviceType &&
          other.isMobile == isMobile &&
          other.browserName == browserName &&
          other.browserVersion == browserVersion &&
          other.ipAddress == ipAddress &&
          other.city == city &&
          other.country == country;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (deviceType == null ? 0 : deviceType!.hashCode) +
      (isMobile.hashCode) +
      (browserName == null ? 0 : browserName!.hashCode) +
      (browserVersion == null ? 0 : browserVersion!.hashCode) +
      (ipAddress == null ? 0 : ipAddress!.hashCode) +
      (city == null ? 0 : city!.hashCode) +
      (country == null ? 0 : country!.hashCode);

  @override
  String toString() =>
      'SessionActivityResponse[object=$object, id=$id, deviceType=$deviceType, isMobile=$isMobile, browserName=$browserName, browserVersion=$browserVersion, ipAddress=$ipAddress, city=$city, country=$country]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    if (this.deviceType != null) {
      json[r'device_type'] = this.deviceType;
    } else {
      json[r'device_type'] = null;
    }
    json[r'is_mobile'] = this.isMobile;
    if (this.browserName != null) {
      json[r'browser_name'] = this.browserName;
    } else {
      json[r'browser_name'] = null;
    }
    if (this.browserVersion != null) {
      json[r'browser_version'] = this.browserVersion;
    } else {
      json[r'browser_version'] = null;
    }
    if (this.ipAddress != null) {
      json[r'ip_address'] = this.ipAddress;
    } else {
      json[r'ip_address'] = null;
    }
    if (this.city != null) {
      json[r'city'] = this.city;
    } else {
      json[r'city'] = null;
    }
    if (this.country != null) {
      json[r'country'] = this.country;
    } else {
      json[r'country'] = null;
    }
    return json;
  }

  /// Returns a new [SessionActivityResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SessionActivityResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SessionActivityResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SessionActivityResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SessionActivityResponse(
        object: mapValueOfType<String>(json, r'object')!,
        id: mapValueOfType<String>(json, r'id')!,
        deviceType: mapValueOfType<String>(json, r'device_type'),
        isMobile: mapValueOfType<bool>(json, r'is_mobile')!,
        browserName: mapValueOfType<String>(json, r'browser_name'),
        browserVersion: mapValueOfType<String>(json, r'browser_version'),
        ipAddress: mapValueOfType<String>(json, r'ip_address'),
        city: mapValueOfType<String>(json, r'city'),
        country: mapValueOfType<String>(json, r'country'),
      );
    }
    return null;
  }

  static List<SessionActivityResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SessionActivityResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SessionActivityResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SessionActivityResponse> mapFromJson(dynamic json) {
    final map = <String, SessionActivityResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SessionActivityResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SessionActivityResponse-objects as value to a dart map
  static Map<String, List<SessionActivityResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SessionActivityResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SessionActivityResponse.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'object',
    'id',
    'is_mobile',
  };
}
