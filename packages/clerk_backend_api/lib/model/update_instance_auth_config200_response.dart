//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateInstanceAuthConfig200Response {
  /// Returns a new [UpdateInstanceAuthConfig200Response] instance.
  UpdateInstanceAuthConfig200Response({
    this.object,
    this.id,
    this.restrictedToAllowlist,
    this.fromEmailAddress,
    this.progressiveSignUp,
    this.enhancedEmailDeliverability,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  UpdateInstanceAuthConfig200ResponseObjectEnum? object;

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
  bool? restrictedToAllowlist;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fromEmailAddress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? progressiveSignUp;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enhancedEmailDeliverability;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateInstanceAuthConfig200Response &&
          other.object == object &&
          other.id == id &&
          other.restrictedToAllowlist == restrictedToAllowlist &&
          other.fromEmailAddress == fromEmailAddress &&
          other.progressiveSignUp == progressiveSignUp &&
          other.enhancedEmailDeliverability == enhancedEmailDeliverability;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object == null ? 0 : object!.hashCode) +
      (id == null ? 0 : id!.hashCode) +
      (restrictedToAllowlist == null ? 0 : restrictedToAllowlist!.hashCode) +
      (fromEmailAddress == null ? 0 : fromEmailAddress!.hashCode) +
      (progressiveSignUp == null ? 0 : progressiveSignUp!.hashCode) +
      (enhancedEmailDeliverability == null
          ? 0
          : enhancedEmailDeliverability!.hashCode);

  @override
  String toString() =>
      'UpdateInstanceAuthConfig200Response[object=$object, id=$id, restrictedToAllowlist=$restrictedToAllowlist, fromEmailAddress=$fromEmailAddress, progressiveSignUp=$progressiveSignUp, enhancedEmailDeliverability=$enhancedEmailDeliverability]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.restrictedToAllowlist != null) {
      json[r'restricted_to_allowlist'] = this.restrictedToAllowlist;
    } else {
      json[r'restricted_to_allowlist'] = null;
    }
    if (this.fromEmailAddress != null) {
      json[r'from_email_address'] = this.fromEmailAddress;
    } else {
      json[r'from_email_address'] = null;
    }
    if (this.progressiveSignUp != null) {
      json[r'progressive_sign_up'] = this.progressiveSignUp;
    } else {
      json[r'progressive_sign_up'] = null;
    }
    if (this.enhancedEmailDeliverability != null) {
      json[r'enhanced_email_deliverability'] = this.enhancedEmailDeliverability;
    } else {
      json[r'enhanced_email_deliverability'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateInstanceAuthConfig200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateInstanceAuthConfig200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateInstanceAuthConfig200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateInstanceAuthConfig200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateInstanceAuthConfig200Response(
        object: UpdateInstanceAuthConfig200ResponseObjectEnum.fromJson(
            json[r'object']),
        id: mapValueOfType<String>(json, r'id'),
        restrictedToAllowlist:
            mapValueOfType<bool>(json, r'restricted_to_allowlist'),
        fromEmailAddress: mapValueOfType<String>(json, r'from_email_address'),
        progressiveSignUp: mapValueOfType<bool>(json, r'progressive_sign_up'),
        enhancedEmailDeliverability:
            mapValueOfType<bool>(json, r'enhanced_email_deliverability'),
      );
    }
    return null;
  }

  static List<UpdateInstanceAuthConfig200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateInstanceAuthConfig200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateInstanceAuthConfig200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateInstanceAuthConfig200Response> mapFromJson(
      dynamic json) {
    final map = <String, UpdateInstanceAuthConfig200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateInstanceAuthConfig200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateInstanceAuthConfig200Response-objects as value to a dart map
  static Map<String, List<UpdateInstanceAuthConfig200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateInstanceAuthConfig200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateInstanceAuthConfig200Response.listFromJson(
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

/// String representing the object's type. Objects of the same type share the same value.
class UpdateInstanceAuthConfig200ResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const UpdateInstanceAuthConfig200ResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const instanceSettings =
      UpdateInstanceAuthConfig200ResponseObjectEnum._(r'instance_settings');

  /// List of all possible values in this [enum][UpdateInstanceAuthConfig200ResponseObjectEnum].
  static const values = <UpdateInstanceAuthConfig200ResponseObjectEnum>[
    instanceSettings,
  ];

  static UpdateInstanceAuthConfig200ResponseObjectEnum? fromJson(
          dynamic value) =>
      UpdateInstanceAuthConfig200ResponseObjectEnumTypeTransformer()
          .decode(value);

  static List<UpdateInstanceAuthConfig200ResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateInstanceAuthConfig200ResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            UpdateInstanceAuthConfig200ResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdateInstanceAuthConfig200ResponseObjectEnum] to String,
/// and [decode] dynamic data back to [UpdateInstanceAuthConfig200ResponseObjectEnum].
class UpdateInstanceAuthConfig200ResponseObjectEnumTypeTransformer {
  factory UpdateInstanceAuthConfig200ResponseObjectEnumTypeTransformer() =>
      _instance ??=
          const UpdateInstanceAuthConfig200ResponseObjectEnumTypeTransformer
              ._();

  const UpdateInstanceAuthConfig200ResponseObjectEnumTypeTransformer._();

  String encode(UpdateInstanceAuthConfig200ResponseObjectEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a UpdateInstanceAuthConfig200ResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateInstanceAuthConfig200ResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'instance_settings':
          return UpdateInstanceAuthConfig200ResponseObjectEnum.instanceSettings;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UpdateInstanceAuthConfig200ResponseObjectEnumTypeTransformer] instance.
  static UpdateInstanceAuthConfig200ResponseObjectEnumTypeTransformer?
      _instance;
}
