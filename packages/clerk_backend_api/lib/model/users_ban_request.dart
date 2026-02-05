//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UsersBanRequest {
  /// Returns a new [UsersBanRequest] instance.
  UsersBanRequest({
    this.userIds = const [],
  });

  /// Array of user IDs to ban
  List<String> userIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersBanRequest && _deepEquality.equals(other.userIds, userIds);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userIds.hashCode);

  @override
  String toString() => 'UsersBanRequest[userIds=$userIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'user_ids'] = this.userIds;
    return json;
  }

  /// Returns a new [UsersBanRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UsersBanRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UsersBanRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UsersBanRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UsersBanRequest(
        userIds: json[r'user_ids'] is Iterable
            ? (json[r'user_ids'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<UsersBanRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UsersBanRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UsersBanRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UsersBanRequest> mapFromJson(dynamic json) {
    final map = <String, UsersBanRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UsersBanRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UsersBanRequest-objects as value to a dart map
  static Map<String, List<UsersBanRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UsersBanRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UsersBanRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'user_ids',
  };
}
