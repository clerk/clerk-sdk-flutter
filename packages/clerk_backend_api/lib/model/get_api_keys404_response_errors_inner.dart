//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetApiKeys404ResponseErrorsInner {
  /// Returns a new [GetApiKeys404ResponseErrorsInner] instance.
  GetApiKeys404ResponseErrorsInner({
    required this.message,
    required this.longMessage,
    required this.code,
  });

  String message;

  String longMessage;

  String code;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetApiKeys404ResponseErrorsInner &&
          other.message == message &&
          other.longMessage == longMessage &&
          other.code == code;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (message.hashCode) + (longMessage.hashCode) + (code.hashCode);

  @override
  String toString() =>
      'GetApiKeys404ResponseErrorsInner[message=$message, longMessage=$longMessage, code=$code]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'message'] = this.message;
    json[r'long_message'] = this.longMessage;
    json[r'code'] = this.code;
    return json;
  }

  /// Returns a new [GetApiKeys404ResponseErrorsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetApiKeys404ResponseErrorsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GetApiKeys404ResponseErrorsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GetApiKeys404ResponseErrorsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetApiKeys404ResponseErrorsInner(
        message: mapValueOfType<String>(json, r'message')!,
        longMessage: mapValueOfType<String>(json, r'long_message')!,
        code: mapValueOfType<String>(json, r'code')!,
      );
    }
    return null;
  }

  static List<GetApiKeys404ResponseErrorsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GetApiKeys404ResponseErrorsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetApiKeys404ResponseErrorsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetApiKeys404ResponseErrorsInner> mapFromJson(
      dynamic json) {
    final map = <String, GetApiKeys404ResponseErrorsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetApiKeys404ResponseErrorsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetApiKeys404ResponseErrorsInner-objects as value to a dart map
  static Map<String, List<GetApiKeys404ResponseErrorsInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GetApiKeys404ResponseErrorsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetApiKeys404ResponseErrorsInner.listFromJson(
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
