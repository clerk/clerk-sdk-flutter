//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationMembershipPublicUserData {
  /// Returns a new [OrganizationMembershipPublicUserData] instance.
  OrganizationMembershipPublicUserData({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.profileImageUrl,
    required this.imageUrl,
    required this.hasImage,
    this.identifier,
  });

  String userId;

  String? firstName;

  String? lastName;

  String? profileImageUrl;

  String imageUrl;

  bool hasImage;

  String? identifier;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationMembershipPublicUserData &&
          other.userId == userId &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.profileImageUrl == profileImageUrl &&
          other.imageUrl == imageUrl &&
          other.hasImage == hasImage &&
          other.identifier == identifier;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId.hashCode) +
      (firstName == null ? 0 : firstName!.hashCode) +
      (lastName == null ? 0 : lastName!.hashCode) +
      (profileImageUrl == null ? 0 : profileImageUrl!.hashCode) +
      (imageUrl.hashCode) +
      (hasImage.hashCode) +
      (identifier == null ? 0 : identifier!.hashCode);

  @override
  String toString() =>
      'OrganizationMembershipPublicUserData[userId=$userId, firstName=$firstName, lastName=$lastName, profileImageUrl=$profileImageUrl, imageUrl=$imageUrl, hasImage=$hasImage, identifier=$identifier]';

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
    if (this.profileImageUrl != null) {
      json[r'profile_image_url'] = this.profileImageUrl;
    } else {
      json[r'profile_image_url'] = null;
    }
    json[r'image_url'] = this.imageUrl;
    json[r'has_image'] = this.hasImage;
    if (this.identifier != null) {
      json[r'identifier'] = this.identifier;
    } else {
      json[r'identifier'] = null;
    }
    return json;
  }

  /// Returns a new [OrganizationMembershipPublicUserData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrganizationMembershipPublicUserData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OrganizationMembershipPublicUserData[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OrganizationMembershipPublicUserData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrganizationMembershipPublicUserData(
        userId: mapValueOfType<String>(json, r'user_id')!,
        firstName: mapValueOfType<String>(json, r'first_name'),
        lastName: mapValueOfType<String>(json, r'last_name'),
        profileImageUrl: mapValueOfType<String>(json, r'profile_image_url'),
        imageUrl: mapValueOfType<String>(json, r'image_url')!,
        hasImage: mapValueOfType<bool>(json, r'has_image')!,
        identifier: mapValueOfType<String>(json, r'identifier'),
      );
    }
    return null;
  }

  static List<OrganizationMembershipPublicUserData> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationMembershipPublicUserData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationMembershipPublicUserData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrganizationMembershipPublicUserData> mapFromJson(
      dynamic json) {
    final map = <String, OrganizationMembershipPublicUserData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            OrganizationMembershipPublicUserData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrganizationMembershipPublicUserData-objects as value to a dart map
  static Map<String, List<OrganizationMembershipPublicUserData>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OrganizationMembershipPublicUserData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrganizationMembershipPublicUserData.listFromJson(
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
    'profile_image_url',
    'image_url',
    'has_image',
  };
}
