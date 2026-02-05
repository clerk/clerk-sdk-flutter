//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateBulkWaitlistEntriesRequestInner {
  /// Returns a new [CreateBulkWaitlistEntriesRequestInner] instance.
  CreateBulkWaitlistEntriesRequestInner({
    required this.emailAddress,
    this.notify = true,
  });

  /// The email address to add to the waitlist
  String emailAddress;

  /// Optional flag which denotes whether a confirmation email should be sent to the given email address. Defaults to `true`.
  bool? notify;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateBulkWaitlistEntriesRequestInner &&
          other.emailAddress == emailAddress &&
          other.notify == notify;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (emailAddress.hashCode) + (notify == null ? 0 : notify!.hashCode);

  @override
  String toString() =>
      'CreateBulkWaitlistEntriesRequestInner[emailAddress=$emailAddress, notify=$notify]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'email_address'] = this.emailAddress;
    if (this.notify != null) {
      json[r'notify'] = this.notify;
    } else {
      json[r'notify'] = null;
    }
    return json;
  }

  /// Returns a new [CreateBulkWaitlistEntriesRequestInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateBulkWaitlistEntriesRequestInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateBulkWaitlistEntriesRequestInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateBulkWaitlistEntriesRequestInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateBulkWaitlistEntriesRequestInner(
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        notify: mapValueOfType<bool>(json, r'notify') ?? true,
      );
    }
    return null;
  }

  static List<CreateBulkWaitlistEntriesRequestInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateBulkWaitlistEntriesRequestInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBulkWaitlistEntriesRequestInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateBulkWaitlistEntriesRequestInner> mapFromJson(
      dynamic json) {
    final map = <String, CreateBulkWaitlistEntriesRequestInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            CreateBulkWaitlistEntriesRequestInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateBulkWaitlistEntriesRequestInner-objects as value to a dart map
  static Map<String, List<CreateBulkWaitlistEntriesRequestInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateBulkWaitlistEntriesRequestInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateBulkWaitlistEntriesRequestInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'email_address',
  };
}
