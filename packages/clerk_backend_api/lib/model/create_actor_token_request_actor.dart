//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateActorTokenRequestActor {
  /// Returns a new [CreateActorTokenRequestActor] instance.
  CreateActorTokenRequestActor({
    required this.sub,
  });

  /// The ID of the actor.
  String sub;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateActorTokenRequestActor && other.sub == sub;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (sub.hashCode);

  @override
  String toString() => 'CreateActorTokenRequestActor[sub=$sub]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'sub'] = this.sub;
    return json;
  }

  /// Returns a new [CreateActorTokenRequestActor] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateActorTokenRequestActor? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateActorTokenRequestActor[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateActorTokenRequestActor[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateActorTokenRequestActor(
        sub: mapValueOfType<String>(json, r'sub')!,
      );
    }
    return null;
  }

  static List<CreateActorTokenRequestActor> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateActorTokenRequestActor>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateActorTokenRequestActor.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateActorTokenRequestActor> mapFromJson(dynamic json) {
    final map = <String, CreateActorTokenRequestActor>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateActorTokenRequestActor.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateActorTokenRequestActor-objects as value to a dart map
  static Map<String, List<CreateActorTokenRequestActor>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateActorTokenRequestActor>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateActorTokenRequestActor.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'sub',
  };
}
