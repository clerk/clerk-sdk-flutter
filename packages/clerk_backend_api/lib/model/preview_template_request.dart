//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PreviewTemplateRequest {
  /// Returns a new [PreviewTemplateRequest] instance.
  PreviewTemplateRequest({
    this.subject,
    this.body,
    this.fromEmailName,
    this.replyToEmailName,
  });

  /// The email subject. Applicable only to email templates.
  String? subject;

  /// The template body before variable interpolation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? body;

  /// The local part of the From email address that will be used for emails. For example, in the address 'hello@example.com', the local part is 'hello'. Applicable only to email templates.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fromEmailName;

  /// The local part of the Reply To email address that will be used for emails. For example, in the address 'hello@example.com', the local part is 'hello'. Applicable only to email templates.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? replyToEmailName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreviewTemplateRequest &&
          other.subject == subject &&
          other.body == body &&
          other.fromEmailName == fromEmailName &&
          other.replyToEmailName == replyToEmailName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (subject == null ? 0 : subject!.hashCode) +
      (body == null ? 0 : body!.hashCode) +
      (fromEmailName == null ? 0 : fromEmailName!.hashCode) +
      (replyToEmailName == null ? 0 : replyToEmailName!.hashCode);

  @override
  String toString() =>
      'PreviewTemplateRequest[subject=$subject, body=$body, fromEmailName=$fromEmailName, replyToEmailName=$replyToEmailName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.fromEmailName != null) {
      json[r'from_email_name'] = this.fromEmailName;
    } else {
      json[r'from_email_name'] = null;
    }
    if (this.replyToEmailName != null) {
      json[r'reply_to_email_name'] = this.replyToEmailName;
    } else {
      json[r'reply_to_email_name'] = null;
    }
    return json;
  }

  /// Returns a new [PreviewTemplateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PreviewTemplateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PreviewTemplateRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PreviewTemplateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PreviewTemplateRequest(
        subject: mapValueOfType<String>(json, r'subject'),
        body: mapValueOfType<String>(json, r'body'),
        fromEmailName: mapValueOfType<String>(json, r'from_email_name'),
        replyToEmailName: mapValueOfType<String>(json, r'reply_to_email_name'),
      );
    }
    return null;
  }

  static List<PreviewTemplateRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PreviewTemplateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PreviewTemplateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PreviewTemplateRequest> mapFromJson(dynamic json) {
    final map = <String, PreviewTemplateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewTemplateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PreviewTemplateRequest-objects as value to a dart map
  static Map<String, List<PreviewTemplateRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PreviewTemplateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PreviewTemplateRequest.listFromJson(
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
