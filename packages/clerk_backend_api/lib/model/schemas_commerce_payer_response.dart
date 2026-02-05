//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SchemasCommercePayerResponse {
  /// Returns a new [SchemasCommercePayerResponse] instance.
  SchemasCommercePayerResponse({
    required this.object,
    required this.id,
    required this.instanceId,
    this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.organizationId,
    this.organizationName,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  /// String representing the object's type. Objects of the same type share the same value.
  SchemasCommercePayerResponseObjectEnum object;

  /// Unique identifier for the payer.
  String id;

  /// Unique identifier for the Clerk instance.
  String instanceId;

  /// User ID for user-type payers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

  /// First name of the payer.
  String firstName;

  /// Last name of the payer.
  String lastName;

  /// Email address of the payer.
  String email;

  /// Organization ID for org-type payers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? organizationId;

  /// Organization name for org-type payers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? organizationName;

  /// URL of the payer's image/avatar.
  String imageUrl;

  /// Unix timestamp (in milliseconds) when the payer was created.
  int createdAt;

  /// Unix timestamp (in milliseconds) when the payer was last updated.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemasCommercePayerResponse &&
          other.object == object &&
          other.id == id &&
          other.instanceId == instanceId &&
          other.userId == userId &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.email == email &&
          other.organizationId == organizationId &&
          other.organizationName == organizationName &&
          other.imageUrl == imageUrl &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (instanceId.hashCode) +
      (userId == null ? 0 : userId!.hashCode) +
      (firstName.hashCode) +
      (lastName.hashCode) +
      (email.hashCode) +
      (organizationId == null ? 0 : organizationId!.hashCode) +
      (organizationName == null ? 0 : organizationName!.hashCode) +
      (imageUrl.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'SchemasCommercePayerResponse[object=$object, id=$id, instanceId=$instanceId, userId=$userId, firstName=$firstName, lastName=$lastName, email=$email, organizationId=$organizationId, organizationName=$organizationName, imageUrl=$imageUrl, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'instance_id'] = this.instanceId;
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    json[r'first_name'] = this.firstName;
    json[r'last_name'] = this.lastName;
    json[r'email'] = this.email;
    if (this.organizationId != null) {
      json[r'organization_id'] = this.organizationId;
    } else {
      json[r'organization_id'] = null;
    }
    if (this.organizationName != null) {
      json[r'organization_name'] = this.organizationName;
    } else {
      json[r'organization_name'] = null;
    }
    json[r'image_url'] = this.imageUrl;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [SchemasCommercePayerResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SchemasCommercePayerResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SchemasCommercePayerResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SchemasCommercePayerResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SchemasCommercePayerResponse(
        object:
            SchemasCommercePayerResponseObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        instanceId: mapValueOfType<String>(json, r'instance_id')!,
        userId: mapValueOfType<String>(json, r'user_id'),
        firstName: mapValueOfType<String>(json, r'first_name')!,
        lastName: mapValueOfType<String>(json, r'last_name')!,
        email: mapValueOfType<String>(json, r'email')!,
        organizationId: mapValueOfType<String>(json, r'organization_id'),
        organizationName: mapValueOfType<String>(json, r'organization_name'),
        imageUrl: mapValueOfType<String>(json, r'image_url')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<SchemasCommercePayerResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasCommercePayerResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasCommercePayerResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SchemasCommercePayerResponse> mapFromJson(dynamic json) {
    final map = <String, SchemasCommercePayerResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SchemasCommercePayerResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SchemasCommercePayerResponse-objects as value to a dart map
  static Map<String, List<SchemasCommercePayerResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SchemasCommercePayerResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SchemasCommercePayerResponse.listFromJson(
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
    'id',
    'instance_id',
    'first_name',
    'last_name',
    'email',
    'image_url',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value.
class SchemasCommercePayerResponseObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SchemasCommercePayerResponseObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const commercePayer =
      SchemasCommercePayerResponseObjectEnum._(r'commerce_payer');

  /// List of all possible values in this [enum][SchemasCommercePayerResponseObjectEnum].
  static const values = <SchemasCommercePayerResponseObjectEnum>[
    commercePayer,
  ];

  static SchemasCommercePayerResponseObjectEnum? fromJson(dynamic value) =>
      SchemasCommercePayerResponseObjectEnumTypeTransformer().decode(value);

  static List<SchemasCommercePayerResponseObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SchemasCommercePayerResponseObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SchemasCommercePayerResponseObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SchemasCommercePayerResponseObjectEnum] to String,
/// and [decode] dynamic data back to [SchemasCommercePayerResponseObjectEnum].
class SchemasCommercePayerResponseObjectEnumTypeTransformer {
  factory SchemasCommercePayerResponseObjectEnumTypeTransformer() =>
      _instance ??=
          const SchemasCommercePayerResponseObjectEnumTypeTransformer._();

  const SchemasCommercePayerResponseObjectEnumTypeTransformer._();

  String encode(SchemasCommercePayerResponseObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SchemasCommercePayerResponseObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SchemasCommercePayerResponseObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'commerce_payer':
          return SchemasCommercePayerResponseObjectEnum.commercePayer;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SchemasCommercePayerResponseObjectEnumTypeTransformer] instance.
  static SchemasCommercePayerResponseObjectEnumTypeTransformer? _instance;
}
