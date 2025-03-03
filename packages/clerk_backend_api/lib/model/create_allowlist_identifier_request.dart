//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateAllowlistIdentifierRequest {
  /// Returns a new [CreateAllowlistIdentifierRequest] instance.
  CreateAllowlistIdentifierRequest({
    required this.identifier,
    this.notify = false,
  });

  /// The identifier to be added in the allow-list. This can be an email address, a phone number or a web3 wallet.
  String identifier;

  /// This flag denotes whether the given identifier will receive an invitation to join the application. Note that this only works for email address and phone number identifiers.
  bool notify;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateAllowlistIdentifierRequest &&
          other.identifier == identifier &&
          other.notify == notify;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifier.hashCode) + (notify.hashCode);

  @override
  String toString() =>
      'CreateAllowlistIdentifierRequest[identifier=$identifier, notify=$notify]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'identifier'] = this.identifier;
    json[r'notify'] = this.notify;
    return json;
  }

  /// Returns a new [CreateAllowlistIdentifierRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateAllowlistIdentifierRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateAllowlistIdentifierRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateAllowlistIdentifierRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateAllowlistIdentifierRequest(
        identifier: mapValueOfType<String>(json, r'identifier')!,
        notify: mapValueOfType<bool>(json, r'notify') ?? false,
      );
    }
    return null;
  }

  static List<CreateAllowlistIdentifierRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateAllowlistIdentifierRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateAllowlistIdentifierRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateAllowlistIdentifierRequest> mapFromJson(
      dynamic json) {
    final map = <String, CreateAllowlistIdentifierRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateAllowlistIdentifierRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateAllowlistIdentifierRequest-objects as value to a dart map
  static Map<String, List<CreateAllowlistIdentifierRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateAllowlistIdentifierRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateAllowlistIdentifierRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifier',
  };
}
