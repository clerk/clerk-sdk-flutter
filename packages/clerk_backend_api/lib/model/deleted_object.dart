//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeletedObject {
  /// Returns a new [DeletedObject] instance.
  DeletedObject({
    required this.object,
    this.id,
    this.slug,
    required this.deleted,
  });

  String object;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? slug;

  bool deleted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeletedObject &&
          other.object == object &&
          other.id == id &&
          other.slug == slug &&
          other.deleted == deleted;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id == null ? 0 : id!.hashCode) +
      (slug == null ? 0 : slug!.hashCode) +
      (deleted.hashCode);

  @override
  String toString() =>
      'DeletedObject[object=$object, id=$id, slug=$slug, deleted=$deleted]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.slug != null) {
      json[r'slug'] = this.slug;
    } else {
      json[r'slug'] = null;
    }
    json[r'deleted'] = this.deleted;
    return json;
  }

  /// Returns a new [DeletedObject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeletedObject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "DeletedObject[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "DeletedObject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DeletedObject(
        object: mapValueOfType<String>(json, r'object')!,
        id: mapValueOfType<String>(json, r'id'),
        slug: mapValueOfType<String>(json, r'slug'),
        deleted: mapValueOfType<bool>(json, r'deleted')!,
      );
    }
    return null;
  }

  static List<DeletedObject> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DeletedObject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeletedObject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeletedObject> mapFromJson(dynamic json) {
    final map = <String, DeletedObject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeletedObject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeletedObject-objects as value to a dart map
  static Map<String, List<DeletedObject>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<DeletedObject>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeletedObject.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'object',
    'deleted',
  };
}
