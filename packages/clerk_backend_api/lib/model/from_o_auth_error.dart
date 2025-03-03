//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FromOAuthError {
  /// Returns a new [FromOAuthError] instance.
  FromOAuthError({
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
      other is FromOAuthError &&
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
      'FromOAuthError[message=$message, longMessage=$longMessage, code=$code, meta=$meta, clerkTraceId=$clerkTraceId]';

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

  /// Returns a new [FromOAuthError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FromOAuthError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FromOAuthError[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FromOAuthError[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FromOAuthError(
        message: mapValueOfType<String>(json, r'message')!,
        longMessage: mapValueOfType<String>(json, r'long_message')!,
        code: mapValueOfType<String>(json, r'code')!,
        meta: mapValueOfType<Object>(json, r'meta'),
        clerkTraceId: mapValueOfType<String>(json, r'clerk_trace_id'),
      );
    }
    return null;
  }

  static List<FromOAuthError> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FromOAuthError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FromOAuthError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FromOAuthError> mapFromJson(dynamic json) {
    final map = <String, FromOAuthError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FromOAuthError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FromOAuthError-objects as value to a dart map
  static Map<String, List<FromOAuthError>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FromOAuthError>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FromOAuthError.listFromJson(
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
