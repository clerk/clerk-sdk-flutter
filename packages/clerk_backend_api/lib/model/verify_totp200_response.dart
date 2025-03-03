//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerifyTOTP200Response {
  /// Returns a new [VerifyTOTP200Response] instance.
  VerifyTOTP200Response({
    this.verified,
    this.codeType,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? verified;

  VerifyTOTP200ResponseCodeTypeEnum? codeType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerifyTOTP200Response &&
          other.verified == verified &&
          other.codeType == codeType;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (verified == null ? 0 : verified!.hashCode) +
      (codeType == null ? 0 : codeType!.hashCode);

  @override
  String toString() =>
      'VerifyTOTP200Response[verified=$verified, codeType=$codeType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.verified != null) {
      json[r'verified'] = this.verified;
    } else {
      json[r'verified'] = null;
    }
    if (this.codeType != null) {
      json[r'code_type'] = this.codeType;
    } else {
      json[r'code_type'] = null;
    }
    return json;
  }

  /// Returns a new [VerifyTOTP200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerifyTOTP200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "VerifyTOTP200Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "VerifyTOTP200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerifyTOTP200Response(
        verified: mapValueOfType<bool>(json, r'verified'),
        codeType:
            VerifyTOTP200ResponseCodeTypeEnum.fromJson(json[r'code_type']),
      );
    }
    return null;
  }

  static List<VerifyTOTP200Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerifyTOTP200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyTOTP200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerifyTOTP200Response> mapFromJson(dynamic json) {
    final map = <String, VerifyTOTP200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyTOTP200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerifyTOTP200Response-objects as value to a dart map
  static Map<String, List<VerifyTOTP200Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<VerifyTOTP200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerifyTOTP200Response.listFromJson(
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

class VerifyTOTP200ResponseCodeTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const VerifyTOTP200ResponseCodeTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const totp = VerifyTOTP200ResponseCodeTypeEnum._(r'totp');
  static const backupCode = VerifyTOTP200ResponseCodeTypeEnum._(r'backup_code');

  /// List of all possible values in this [enum][VerifyTOTP200ResponseCodeTypeEnum].
  static const values = <VerifyTOTP200ResponseCodeTypeEnum>[
    totp,
    backupCode,
  ];

  static VerifyTOTP200ResponseCodeTypeEnum? fromJson(dynamic value) =>
      VerifyTOTP200ResponseCodeTypeEnumTypeTransformer().decode(value);

  static List<VerifyTOTP200ResponseCodeTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <VerifyTOTP200ResponseCodeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyTOTP200ResponseCodeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VerifyTOTP200ResponseCodeTypeEnum] to String,
/// and [decode] dynamic data back to [VerifyTOTP200ResponseCodeTypeEnum].
class VerifyTOTP200ResponseCodeTypeEnumTypeTransformer {
  factory VerifyTOTP200ResponseCodeTypeEnumTypeTransformer() =>
      _instance ??= const VerifyTOTP200ResponseCodeTypeEnumTypeTransformer._();

  const VerifyTOTP200ResponseCodeTypeEnumTypeTransformer._();

  String encode(VerifyTOTP200ResponseCodeTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a VerifyTOTP200ResponseCodeTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VerifyTOTP200ResponseCodeTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'totp':
          return VerifyTOTP200ResponseCodeTypeEnum.totp;
        case r'backup_code':
          return VerifyTOTP200ResponseCodeTypeEnum.backupCode;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [VerifyTOTP200ResponseCodeTypeEnumTypeTransformer] instance.
  static VerifyTOTP200ResponseCodeTypeEnumTypeTransformer? _instance;
}
