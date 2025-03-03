//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationInvitationPublicOrganizationData {
  /// Returns a new [OrganizationInvitationPublicOrganizationData] instance.
  OrganizationInvitationPublicOrganizationData({
    required this.id,
    required this.name,
    required this.slug,
    this.imageUrl,
    required this.hasImage,
  });

  String id;

  String name;

  String slug;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imageUrl;

  bool hasImage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationInvitationPublicOrganizationData &&
          other.id == id &&
          other.name == name &&
          other.slug == slug &&
          other.imageUrl == imageUrl &&
          other.hasImage == hasImage;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (name.hashCode) +
      (slug.hashCode) +
      (imageUrl == null ? 0 : imageUrl!.hashCode) +
      (hasImage.hashCode);

  @override
  String toString() =>
      'OrganizationInvitationPublicOrganizationData[id=$id, name=$name, slug=$slug, imageUrl=$imageUrl, hasImage=$hasImage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'slug'] = this.slug;
    if (this.imageUrl != null) {
      json[r'image_url'] = this.imageUrl;
    } else {
      json[r'image_url'] = null;
    }
    json[r'has_image'] = this.hasImage;
    return json;
  }

  /// Returns a new [OrganizationInvitationPublicOrganizationData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrganizationInvitationPublicOrganizationData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OrganizationInvitationPublicOrganizationData[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OrganizationInvitationPublicOrganizationData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrganizationInvitationPublicOrganizationData(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        slug: mapValueOfType<String>(json, r'slug')!,
        imageUrl: mapValueOfType<String>(json, r'image_url'),
        hasImage: mapValueOfType<bool>(json, r'has_image')!,
      );
    }
    return null;
  }

  static List<OrganizationInvitationPublicOrganizationData> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationInvitationPublicOrganizationData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            OrganizationInvitationPublicOrganizationData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrganizationInvitationPublicOrganizationData> mapFromJson(
      dynamic json) {
    final map = <String, OrganizationInvitationPublicOrganizationData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            OrganizationInvitationPublicOrganizationData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrganizationInvitationPublicOrganizationData-objects as value to a dart map
  static Map<String, List<OrganizationInvitationPublicOrganizationData>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OrganizationInvitationPublicOrganizationData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            OrganizationInvitationPublicOrganizationData.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'slug',
    'has_image',
  };
}
