//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpsertTemplateRequest {
  /// Returns a new [UpsertTemplateRequest] instance.
  UpsertTemplateRequest({
    this.name,
    this.subject,
    this.markup,
    this.body,
    this.deliveredByClerk,
    this.fromEmailName,
    this.replyToEmailName,
  });

  /// The user-friendly name of the template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The email subject. Applicable only to email templates.
  String? subject;

  /// The editor markup used to generate the body of the template
  String? markup;

  /// The template body before variable interpolation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? body;

  /// Whether Clerk should deliver emails or SMS messages based on the current template
  bool? deliveredByClerk;

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
      other is UpsertTemplateRequest &&
          other.name == name &&
          other.subject == subject &&
          other.markup == markup &&
          other.body == body &&
          other.deliveredByClerk == deliveredByClerk &&
          other.fromEmailName == fromEmailName &&
          other.replyToEmailName == replyToEmailName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name == null ? 0 : name!.hashCode) +
      (subject == null ? 0 : subject!.hashCode) +
      (markup == null ? 0 : markup!.hashCode) +
      (body == null ? 0 : body!.hashCode) +
      (deliveredByClerk == null ? 0 : deliveredByClerk!.hashCode) +
      (fromEmailName == null ? 0 : fromEmailName!.hashCode) +
      (replyToEmailName == null ? 0 : replyToEmailName!.hashCode);

  @override
  String toString() =>
      'UpsertTemplateRequest[name=$name, subject=$subject, markup=$markup, body=$body, deliveredByClerk=$deliveredByClerk, fromEmailName=$fromEmailName, replyToEmailName=$replyToEmailName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    if (this.markup != null) {
      json[r'markup'] = this.markup;
    } else {
      json[r'markup'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.deliveredByClerk != null) {
      json[r'delivered_by_clerk'] = this.deliveredByClerk;
    } else {
      json[r'delivered_by_clerk'] = null;
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

  /// Returns a new [UpsertTemplateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpsertTemplateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpsertTemplateRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpsertTemplateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpsertTemplateRequest(
        name: mapValueOfType<String>(json, r'name'),
        subject: mapValueOfType<String>(json, r'subject'),
        markup: mapValueOfType<String>(json, r'markup'),
        body: mapValueOfType<String>(json, r'body'),
        deliveredByClerk: mapValueOfType<bool>(json, r'delivered_by_clerk'),
        fromEmailName: mapValueOfType<String>(json, r'from_email_name'),
        replyToEmailName: mapValueOfType<String>(json, r'reply_to_email_name'),
      );
    }
    return null;
  }

  static List<UpsertTemplateRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpsertTemplateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpsertTemplateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpsertTemplateRequest> mapFromJson(dynamic json) {
    final map = <String, UpsertTemplateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpsertTemplateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpsertTemplateRequest-objects as value to a dart map
  static Map<String, List<UpsertTemplateRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpsertTemplateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpsertTemplateRequest.listFromJson(
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
