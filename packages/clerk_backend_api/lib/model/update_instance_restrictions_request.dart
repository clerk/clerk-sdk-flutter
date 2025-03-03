//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateInstanceRestrictionsRequest {
  /// Returns a new [UpdateInstanceRestrictionsRequest] instance.
  UpdateInstanceRestrictionsRequest({
    this.allowlist,
    this.blocklist,
    this.blockEmailSubaddresses,
    this.blockDisposableEmailDomains,
    this.ignoreDotsForGmailAddresses,
  });

  bool? allowlist;

  bool? blocklist;

  bool? blockEmailSubaddresses;

  bool? blockDisposableEmailDomains;

  bool? ignoreDotsForGmailAddresses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateInstanceRestrictionsRequest &&
          other.allowlist == allowlist &&
          other.blocklist == blocklist &&
          other.blockEmailSubaddresses == blockEmailSubaddresses &&
          other.blockDisposableEmailDomains == blockDisposableEmailDomains &&
          other.ignoreDotsForGmailAddresses == ignoreDotsForGmailAddresses;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (allowlist == null ? 0 : allowlist!.hashCode) +
      (blocklist == null ? 0 : blocklist!.hashCode) +
      (blockEmailSubaddresses == null ? 0 : blockEmailSubaddresses!.hashCode) +
      (blockDisposableEmailDomains == null
          ? 0
          : blockDisposableEmailDomains!.hashCode) +
      (ignoreDotsForGmailAddresses == null
          ? 0
          : ignoreDotsForGmailAddresses!.hashCode);

  @override
  String toString() =>
      'UpdateInstanceRestrictionsRequest[allowlist=$allowlist, blocklist=$blocklist, blockEmailSubaddresses=$blockEmailSubaddresses, blockDisposableEmailDomains=$blockDisposableEmailDomains, ignoreDotsForGmailAddresses=$ignoreDotsForGmailAddresses]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.allowlist != null) {
      json[r'allowlist'] = this.allowlist;
    } else {
      json[r'allowlist'] = null;
    }
    if (this.blocklist != null) {
      json[r'blocklist'] = this.blocklist;
    } else {
      json[r'blocklist'] = null;
    }
    if (this.blockEmailSubaddresses != null) {
      json[r'block_email_subaddresses'] = this.blockEmailSubaddresses;
    } else {
      json[r'block_email_subaddresses'] = null;
    }
    if (this.blockDisposableEmailDomains != null) {
      json[r'block_disposable_email_domains'] =
          this.blockDisposableEmailDomains;
    } else {
      json[r'block_disposable_email_domains'] = null;
    }
    if (this.ignoreDotsForGmailAddresses != null) {
      json[r'ignore_dots_for_gmail_addresses'] =
          this.ignoreDotsForGmailAddresses;
    } else {
      json[r'ignore_dots_for_gmail_addresses'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateInstanceRestrictionsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateInstanceRestrictionsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateInstanceRestrictionsRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateInstanceRestrictionsRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateInstanceRestrictionsRequest(
        allowlist: mapValueOfType<bool>(json, r'allowlist'),
        blocklist: mapValueOfType<bool>(json, r'blocklist'),
        blockEmailSubaddresses:
            mapValueOfType<bool>(json, r'block_email_subaddresses'),
        blockDisposableEmailDomains:
            mapValueOfType<bool>(json, r'block_disposable_email_domains'),
        ignoreDotsForGmailAddresses:
            mapValueOfType<bool>(json, r'ignore_dots_for_gmail_addresses'),
      );
    }
    return null;
  }

  static List<UpdateInstanceRestrictionsRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateInstanceRestrictionsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateInstanceRestrictionsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateInstanceRestrictionsRequest> mapFromJson(
      dynamic json) {
    final map = <String, UpdateInstanceRestrictionsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateInstanceRestrictionsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateInstanceRestrictionsRequest-objects as value to a dart map
  static Map<String, List<UpdateInstanceRestrictionsRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateInstanceRestrictionsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateInstanceRestrictionsRequest.listFromJson(
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
