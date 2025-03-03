//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ClerkError {
  /// Returns a new [ClerkError] instance.
  ClerkError({
    required this.message,
    required this.longMessage,
    required this.code,
    this.meta,
    this.clerkTraceId,
  });

  String message;

  String longMessage;

  String code;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? meta;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? clerkTraceId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClerkError &&
          other.message == message &&
          other.longMessage == longMessage &&
          other.code == code &&
          other.meta == meta &&
          other.clerkTraceId == clerkTraceId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (message.hashCode) +
      (longMessage.hashCode) +
      (code.hashCode) +
      (meta == null ? 0 : meta!.hashCode) +
      (clerkTraceId == null ? 0 : clerkTraceId!.hashCode);

  @override
  String toString() =>
      'ClerkError[message=$message, longMessage=$longMessage, code=$code, meta=$meta, clerkTraceId=$clerkTraceId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'message'] = this.message;
    json[r'long_message'] = this.longMessage;
    json[r'code'] = this.code;
    if (this.meta != null) {
      json[r'meta'] = this.meta;
    } else {
      json[r'meta'] = null;
    }
    if (this.clerkTraceId != null) {
      json[r'clerk_trace_id'] = this.clerkTraceId;
    } else {
      json[r'clerk_trace_id'] = null;
    }
    return json;
  }

  /// Returns a new [ClerkError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ClerkError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ClerkError[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ClerkError[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ClerkError(
        message: mapValueOfType<String>(json, r'message')!,
        longMessage: mapValueOfType<String>(json, r'long_message')!,
        code: mapValueOfType<String>(json, r'code')!,
        meta: mapValueOfType<Object>(json, r'meta'),
        clerkTraceId: mapValueOfType<String>(json, r'clerk_trace_id'),
      );
    }
    return null;
  }

  static List<ClerkError> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ClerkError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ClerkError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ClerkError> mapFromJson(dynamic json) {
    final map = <String, ClerkError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ClerkError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ClerkError-objects as value to a dart map
  static Map<String, List<ClerkError>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ClerkError>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ClerkError.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'long_message',
    'code',
  };
}
