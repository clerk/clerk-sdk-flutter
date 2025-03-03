//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationDomain {
  /// Returns a new [OrganizationDomain] instance.
  OrganizationDomain({
    required this.object,
    required this.id,
    required this.organizationId,
    required this.name,
    required this.enrollmentMode,
    required this.affiliationEmailAddress,
    required this.verification,
    required this.totalPendingInvitations,
    required this.totalPendingSuggestions,
    required this.createdAt,
    required this.updatedAt,
  });

  /// String representing the object's type. Objects of the same type share the same value. Always `organization_domain`
  OrganizationDomainObjectEnum object;

  /// Unique identifier for the organization domain
  String id;

  /// Unique identifier for the organization
  String organizationId;

  /// Name of the organization domain
  String name;

  /// Mode of enrollment for the domain
  OrganizationDomainEnrollmentModeEnum enrollmentMode;

  /// Affiliation email address for the domain, if available.
  String? affiliationEmailAddress;

  OrganizationDomainVerification? verification;

  /// Total number of pending invitations associated with this domain
  int totalPendingInvitations;

  /// Total number of pending suggestions associated with this domain
  int totalPendingSuggestions;

  /// Unix timestamp when the domain was created
  int createdAt;

  /// Unix timestamp of the last update to the domain
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationDomain &&
          other.object == object &&
          other.id == id &&
          other.organizationId == organizationId &&
          other.name == name &&
          other.enrollmentMode == enrollmentMode &&
          other.affiliationEmailAddress == affiliationEmailAddress &&
          other.verification == verification &&
          other.totalPendingInvitations == totalPendingInvitations &&
          other.totalPendingSuggestions == totalPendingSuggestions &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (organizationId.hashCode) +
      (name.hashCode) +
      (enrollmentMode.hashCode) +
      (affiliationEmailAddress == null
          ? 0
          : affiliationEmailAddress!.hashCode) +
      (verification == null ? 0 : verification!.hashCode) +
      (totalPendingInvitations.hashCode) +
      (totalPendingSuggestions.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'OrganizationDomain[object=$object, id=$id, organizationId=$organizationId, name=$name, enrollmentMode=$enrollmentMode, affiliationEmailAddress=$affiliationEmailAddress, verification=$verification, totalPendingInvitations=$totalPendingInvitations, totalPendingSuggestions=$totalPendingSuggestions, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'organization_id'] = this.organizationId;
    json[r'name'] = this.name;
    json[r'enrollment_mode'] = this.enrollmentMode;
    if (this.affiliationEmailAddress != null) {
      json[r'affiliation_email_address'] = this.affiliationEmailAddress;
    } else {
      json[r'affiliation_email_address'] = null;
    }
    if (this.verification != null) {
      json[r'verification'] = this.verification;
    } else {
      json[r'verification'] = null;
    }
    json[r'total_pending_invitations'] = this.totalPendingInvitations;
    json[r'total_pending_suggestions'] = this.totalPendingSuggestions;
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [OrganizationDomain] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrganizationDomain? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "OrganizationDomain[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "OrganizationDomain[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrganizationDomain(
        object: OrganizationDomainObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        organizationId: mapValueOfType<String>(json, r'organization_id')!,
        name: mapValueOfType<String>(json, r'name')!,
        enrollmentMode: OrganizationDomainEnrollmentModeEnum.fromJson(
            json[r'enrollment_mode'])!,
        affiliationEmailAddress:
            mapValueOfType<String>(json, r'affiliation_email_address'),
        verification:
            OrganizationDomainVerification.fromJson(json[r'verification']),
        totalPendingInvitations:
            mapValueOfType<int>(json, r'total_pending_invitations')!,
        totalPendingSuggestions:
            mapValueOfType<int>(json, r'total_pending_suggestions')!,
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<OrganizationDomain> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationDomain>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationDomain.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrganizationDomain> mapFromJson(dynamic json) {
    final map = <String, OrganizationDomain>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrganizationDomain.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrganizationDomain-objects as value to a dart map
  static Map<String, List<OrganizationDomain>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OrganizationDomain>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrganizationDomain.listFromJson(
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
    'organization_id',
    'name',
    'enrollment_mode',
    'affiliation_email_address',
    'verification',
    'total_pending_invitations',
    'total_pending_suggestions',
    'created_at',
    'updated_at',
  };
}

/// String representing the object's type. Objects of the same type share the same value. Always `organization_domain`
class OrganizationDomainObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const OrganizationDomainObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const organizationDomain =
      OrganizationDomainObjectEnum._(r'organization_domain');

  /// List of all possible values in this [enum][OrganizationDomainObjectEnum].
  static const values = <OrganizationDomainObjectEnum>[
    organizationDomain,
  ];

  static OrganizationDomainObjectEnum? fromJson(dynamic value) =>
      OrganizationDomainObjectEnumTypeTransformer().decode(value);

  static List<OrganizationDomainObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationDomainObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationDomainObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrganizationDomainObjectEnum] to String,
/// and [decode] dynamic data back to [OrganizationDomainObjectEnum].
class OrganizationDomainObjectEnumTypeTransformer {
  factory OrganizationDomainObjectEnumTypeTransformer() =>
      _instance ??= const OrganizationDomainObjectEnumTypeTransformer._();

  const OrganizationDomainObjectEnumTypeTransformer._();

  String encode(OrganizationDomainObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OrganizationDomainObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrganizationDomainObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'organization_domain':
          return OrganizationDomainObjectEnum.organizationDomain;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OrganizationDomainObjectEnumTypeTransformer] instance.
  static OrganizationDomainObjectEnumTypeTransformer? _instance;
}

/// Mode of enrollment for the domain
class OrganizationDomainEnrollmentModeEnum {
  /// Instantiate a new enum with the provided [value].
  const OrganizationDomainEnrollmentModeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const manualInvitation =
      OrganizationDomainEnrollmentModeEnum._(r'manual_invitation');
  static const automaticInvitation =
      OrganizationDomainEnrollmentModeEnum._(r'automatic_invitation');
  static const automaticSuggestion =
      OrganizationDomainEnrollmentModeEnum._(r'automatic_suggestion');

  /// List of all possible values in this [enum][OrganizationDomainEnrollmentModeEnum].
  static const values = <OrganizationDomainEnrollmentModeEnum>[
    manualInvitation,
    automaticInvitation,
    automaticSuggestion,
  ];

  static OrganizationDomainEnrollmentModeEnum? fromJson(dynamic value) =>
      OrganizationDomainEnrollmentModeEnumTypeTransformer().decode(value);

  static List<OrganizationDomainEnrollmentModeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OrganizationDomainEnrollmentModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrganizationDomainEnrollmentModeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrganizationDomainEnrollmentModeEnum] to String,
/// and [decode] dynamic data back to [OrganizationDomainEnrollmentModeEnum].
class OrganizationDomainEnrollmentModeEnumTypeTransformer {
  factory OrganizationDomainEnrollmentModeEnumTypeTransformer() => _instance ??=
      const OrganizationDomainEnrollmentModeEnumTypeTransformer._();

  const OrganizationDomainEnrollmentModeEnumTypeTransformer._();

  String encode(OrganizationDomainEnrollmentModeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OrganizationDomainEnrollmentModeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrganizationDomainEnrollmentModeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'manual_invitation':
          return OrganizationDomainEnrollmentModeEnum.manualInvitation;
        case r'automatic_invitation':
          return OrganizationDomainEnrollmentModeEnum.automaticInvitation;
        case r'automatic_suggestion':
          return OrganizationDomainEnrollmentModeEnum.automaticSuggestion;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OrganizationDomainEnrollmentModeEnumTypeTransformer] instance.
  static OrganizationDomainEnrollmentModeEnumTypeTransformer? _instance;
}
