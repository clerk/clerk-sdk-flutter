//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetApiKeys200ResponseDataInner {
  /// Returns a new [GetApiKeys200ResponseDataInner] instance.
  GetApiKeys200ResponseDataInner({
    required this.object,
    required this.id,
    required this.type,
    required this.subject,
    required this.name,
    this.description,
    required this.claims,
    this.scopes = const [],
    required this.revoked,
    required this.revocationReason,
    required this.expired,
    required this.expiration,
    required this.createdBy,
    required this.lastUsedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  GetApiKeys200ResponseDataInnerObjectEnum object;

  String id;

  String type;

  String subject;

  String name;

  String? description;

  Object? claims;

  List<String> scopes;

  bool revoked;

  String? revocationReason;

  bool expired;

  /// The timestamp for when the API key will expire, in milliseconds
  num? expiration;

  String? createdBy;

  /// The timestamp for when the API key was last used, in milliseconds
  num? lastUsedAt;

  /// The timestamp for when the API key was created, in milliseconds
  num createdAt;

  /// The timestamp for when the API key was last updated, in milliseconds
  num updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetApiKeys200ResponseDataInner &&
          other.object == object &&
          other.id == id &&
          other.type == type &&
          other.subject == subject &&
          other.name == name &&
          other.description == description &&
          other.claims == claims &&
          _deepEquality.equals(other.scopes, scopes) &&
          other.revoked == revoked &&
          other.revocationReason == revocationReason &&
          other.expired == expired &&
          other.expiration == expiration &&
          other.createdBy == createdBy &&
          other.lastUsedAt == lastUsedAt &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (type.hashCode) +
      (subject.hashCode) +
      (name.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (claims == null ? 0 : claims!.hashCode) +
      (scopes.hashCode) +
      (revoked.hashCode) +
      (revocationReason == null ? 0 : revocationReason!.hashCode) +
      (expired.hashCode) +
      (expiration == null ? 0 : expiration!.hashCode) +
      (createdBy == null ? 0 : createdBy!.hashCode) +
      (lastUsedAt == null ? 0 : lastUsedAt!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'GetApiKeys200ResponseDataInner[object=$object, id=$id, type=$type, subject=$subject, name=$name, description=$description, claims=$claims, scopes=$scopes, revoked=$revoked, revocationReason=$revocationReason, expired=$expired, expiration=$expiration, createdBy=$createdBy, lastUsedAt=$lastUsedAt, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'type'] = this.type;
    json[r'subject'] = this.subject;
    json[r'name'] = this.name;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.claims != null) {
      json[r'claims'] = this.claims;
    } else {
      json[r'claims'] = null;
    }
    json[r'scopes'] = this.scopes;
    json[r'revoked'] = this.revoked;
    if (this.revocationReason != null) {
      json[r'revocation_reason'] = this.revocationReason;
    } else {
      json[r'revocation_reason'] = null;
    }
    json[r'expired'] = this.expired;
    if (this.expiration != null) {
      json[r'expiration'] = this.expiration;
    } else {
      json[r'expiration'] = null;
    }
    if (this.createdBy != null) {
      json[r'created_by'] = this.createdBy;
    } else {
      json[r'created_by'] = null;
    }
    if (this.lastUsedAt != null) {
      json[r'last_used_at'] = this.lastUsedAt;
    } else {
      json[r'last_used_at'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [GetApiKeys200ResponseDataInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetApiKeys200ResponseDataInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GetApiKeys200ResponseDataInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GetApiKeys200ResponseDataInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetApiKeys200ResponseDataInner(
        object:
            GetApiKeys200ResponseDataInnerObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        type: mapValueOfType<String>(json, r'type')!,
        subject: mapValueOfType<String>(json, r'subject')!,
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description'),
        claims: mapValueOfType<Object>(json, r'claims'),
        scopes: json[r'scopes'] is Iterable
            ? (json[r'scopes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        revoked: mapValueOfType<bool>(json, r'revoked')!,
        revocationReason: mapValueOfType<String>(json, r'revocation_reason'),
        expired: mapValueOfType<bool>(json, r'expired')!,
        expiration: json[r'expiration'] == null
            ? null
            : num.parse('${json[r'expiration']}'),
        createdBy: mapValueOfType<String>(json, r'created_by'),
        lastUsedAt: json[r'last_used_at'] == null
            ? null
            : num.parse('${json[r'last_used_at']}'),
        createdAt: num.parse('${json[r'created_at']}'),
        updatedAt: num.parse('${json[r'updated_at']}'),
      );
    }
    return null;
  }

  static List<GetApiKeys200ResponseDataInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GetApiKeys200ResponseDataInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetApiKeys200ResponseDataInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetApiKeys200ResponseDataInner> mapFromJson(dynamic json) {
    final map = <String, GetApiKeys200ResponseDataInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetApiKeys200ResponseDataInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetApiKeys200ResponseDataInner-objects as value to a dart map
  static Map<String, List<GetApiKeys200ResponseDataInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GetApiKeys200ResponseDataInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetApiKeys200ResponseDataInner.listFromJson(
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
    'type',
    'subject',
    'name',
    'claims',
    'scopes',
    'revoked',
    'revocation_reason',
    'expired',
    'expiration',
    'created_by',
    'last_used_at',
    'created_at',
    'updated_at',
  };
}

class GetApiKeys200ResponseDataInnerObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const GetApiKeys200ResponseDataInnerObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const apiKey = GetApiKeys200ResponseDataInnerObjectEnum._(r'api_key');

  /// List of all possible values in this [enum][GetApiKeys200ResponseDataInnerObjectEnum].
  static const values = <GetApiKeys200ResponseDataInnerObjectEnum>[
    apiKey,
  ];

  static GetApiKeys200ResponseDataInnerObjectEnum? fromJson(dynamic value) =>
      GetApiKeys200ResponseDataInnerObjectEnumTypeTransformer().decode(value);

  static List<GetApiKeys200ResponseDataInnerObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GetApiKeys200ResponseDataInnerObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetApiKeys200ResponseDataInnerObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetApiKeys200ResponseDataInnerObjectEnum] to String,
/// and [decode] dynamic data back to [GetApiKeys200ResponseDataInnerObjectEnum].
class GetApiKeys200ResponseDataInnerObjectEnumTypeTransformer {
  factory GetApiKeys200ResponseDataInnerObjectEnumTypeTransformer() =>
      _instance ??=
          const GetApiKeys200ResponseDataInnerObjectEnumTypeTransformer._();

  const GetApiKeys200ResponseDataInnerObjectEnumTypeTransformer._();

  String encode(GetApiKeys200ResponseDataInnerObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a GetApiKeys200ResponseDataInnerObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetApiKeys200ResponseDataInnerObjectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'api_key':
          return GetApiKeys200ResponseDataInnerObjectEnum.apiKey;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [GetApiKeys200ResponseDataInnerObjectEnumTypeTransformer] instance.
  static GetApiKeys200ResponseDataInnerObjectEnumTypeTransformer? _instance;
}
