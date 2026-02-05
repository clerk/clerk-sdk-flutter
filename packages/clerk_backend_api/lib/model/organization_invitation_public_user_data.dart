//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationInvitationPublicUserData {
  /// Returns a new [OrganizationInvitationPublicUserData] instance.
  OrganizationInvitationPublicUserData({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.hasImage,
    required this.identifier,
  });

  String userId;

  String? firstName;

  String? lastName;

  String imageUrl;

  bool hasImage;

  String identifier;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationInvitationPublicUserData &&
          other.userId == userId &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.imageUrl == imageUrl &&
          other.hasImage == hasImage &&
          other.identifier == identifier;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId.hashCode) +
      (firstName == null ? 0 : firstName!.hashCode) +
      (lastName == null ? 0 : lastName!.hashCode) +
      (imageUrl.hashCode) +
      (hasImage.hashCode) +
      (identifier.hashCode);

  @override
  String toString() =>
      'OrganizationInvitationPublicUserData[userId=$userId, firstName=$firstName, lastName=$lastName, imageUrl=$imageUrl, hasImage=$hasImage, identifier=$identifier]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'user_id'] = this.userId;
    if (this.firstName != null) {
      json[r'first_name'] = this.firstName;
    } else {
      json[r'first_name'] = null;
    }
    if (this.lastName != null) {
      json[r'last_name'] = this.lastName;
    } else {
      json[r'last_name'] = null;
    }
    json[r'image_url'] = this.imageUrl;
    json[r'has_image'] = this.hasImage;
    json[r'identifier'] = this.identifier;
    return json;
  }

  /// Returns a new [OrganizationInvitationPublicUserData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrganizationInvitationPublicUserData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OrganizationInvitationPublicUserData[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OrganizationInvitationPublicUserData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrganizationInvitationPublicUserData(
        userId: mapValueOfType<String>(json, r'user_id')!,
        firstName: mapValueOfType<String>(json, r'first_name'),
        lastName: mapValueOfType<String>(json, r'last_name'),
        imageUrl: mapValueOfType<String>(json, r'image_url')!,
        hasImage: mapValueOfType<bool>(json, r'has_image')!,
        identifier: mapValueOfType<String>(json, r'identifier')!,
      );
    }
    return null;
  }

  static List<OrganizationInvitationPublicUserData> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationInvitationPublicUserData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationInvitationPublicUserData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrganizationInvitationPublicUserData> mapFromJson(
      dynamic json) {
    final map = <String, OrganizationInvitationPublicUserData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            OrganizationInvitationPublicUserData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrganizationInvitationPublicUserData-objects as value to a dart map
  static Map<String, List<OrganizationInvitationPublicUserData>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OrganizationInvitationPublicUserData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrganizationInvitationPublicUserData.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'user_id',
    'first_name',
    'last_name',
    'image_url',
    'has_image',
    'identifier',
  };
}
