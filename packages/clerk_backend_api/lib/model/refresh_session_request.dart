//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RefreshSessionRequest {
  /// Returns a new [RefreshSessionRequest] instance.
  RefreshSessionRequest({
    required this.expiredToken,
    required this.refreshToken,
    required this.requestOrigin,
    this.requestHeaders = const {},
    this.format = const RefreshSessionRequestFormatEnum._('token'),
    this.requestOriginatingIp,
  });

  /// The JWT that is sent via the `__session` cookie from your frontend. Note: this JWT must be associated with the supplied session ID.
  String expiredToken;

  /// The refresh token from the `__refresh` cookie set via FAPI's handshake flow.
  String refreshToken;

  /// The origin of the request.
  String requestOrigin;

  /// The headers of the request.
  Map<String, Object>? requestHeaders;

  /// The format of the response.
  RefreshSessionRequestFormatEnum? format;

  /// The IP address of the request.
  String? requestOriginatingIp;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RefreshSessionRequest &&
          other.expiredToken == expiredToken &&
          other.refreshToken == refreshToken &&
          other.requestOrigin == requestOrigin &&
          _deepEquality.equals(other.requestHeaders, requestHeaders) &&
          other.format == format &&
          other.requestOriginatingIp == requestOriginatingIp;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (expiredToken.hashCode) +
      (refreshToken.hashCode) +
      (requestOrigin.hashCode) +
      (requestHeaders == null ? 0 : requestHeaders!.hashCode) +
      (format == null ? 0 : format!.hashCode) +
      (requestOriginatingIp == null ? 0 : requestOriginatingIp!.hashCode);

  @override
  String toString() =>
      'RefreshSessionRequest[expiredToken=$expiredToken, refreshToken=$refreshToken, requestOrigin=$requestOrigin, requestHeaders=$requestHeaders, format=$format, requestOriginatingIp=$requestOriginatingIp]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'expired_token'] = this.expiredToken;
    json[r'refresh_token'] = this.refreshToken;
    json[r'request_origin'] = this.requestOrigin;
    if (this.requestHeaders != null) {
      json[r'request_headers'] = this.requestHeaders;
    } else {
      json[r'request_headers'] = null;
    }
    if (this.format != null) {
      json[r'format'] = this.format;
    } else {
      json[r'format'] = null;
    }
    if (this.requestOriginatingIp != null) {
      json[r'request_originating_ip'] = this.requestOriginatingIp;
    } else {
      json[r'request_originating_ip'] = null;
    }
    return json;
  }

  /// Returns a new [RefreshSessionRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RefreshSessionRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RefreshSessionRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RefreshSessionRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RefreshSessionRequest(
        expiredToken: mapValueOfType<String>(json, r'expired_token')!,
        refreshToken: mapValueOfType<String>(json, r'refresh_token')!,
        requestOrigin: mapValueOfType<String>(json, r'request_origin')!,
        requestHeaders:
            mapCastOfType<String, Object>(json, r'request_headers') ?? const {},
        format: RefreshSessionRequestFormatEnum.fromJson(json[r'format']) ??
            RefreshSessionRequestFormatEnum.token,
        requestOriginatingIp:
            mapValueOfType<String>(json, r'request_originating_ip'),
      );
    }
    return null;
  }

  static List<RefreshSessionRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RefreshSessionRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RefreshSessionRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RefreshSessionRequest> mapFromJson(dynamic json) {
    final map = <String, RefreshSessionRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RefreshSessionRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RefreshSessionRequest-objects as value to a dart map
  static Map<String, List<RefreshSessionRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RefreshSessionRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RefreshSessionRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'expired_token',
    'refresh_token',
    'request_origin',
  };
}

/// The format of the response.
class RefreshSessionRequestFormatEnum {
  /// Instantiate a new enum with the provided [value].
  const RefreshSessionRequestFormatEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const token = RefreshSessionRequestFormatEnum._(r'token');
  static const cookie = RefreshSessionRequestFormatEnum._(r'cookie');

  /// List of all possible values in this [enum][RefreshSessionRequestFormatEnum].
  static const values = <RefreshSessionRequestFormatEnum>[
    token,
    cookie,
  ];

  static RefreshSessionRequestFormatEnum? fromJson(dynamic value) =>
      RefreshSessionRequestFormatEnumTypeTransformer().decode(value);

  static List<RefreshSessionRequestFormatEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RefreshSessionRequestFormatEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RefreshSessionRequestFormatEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RefreshSessionRequestFormatEnum] to String,
/// and [decode] dynamic data back to [RefreshSessionRequestFormatEnum].
class RefreshSessionRequestFormatEnumTypeTransformer {
  factory RefreshSessionRequestFormatEnumTypeTransformer() =>
      _instance ??= const RefreshSessionRequestFormatEnumTypeTransformer._();

  const RefreshSessionRequestFormatEnumTypeTransformer._();

  String encode(RefreshSessionRequestFormatEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RefreshSessionRequestFormatEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RefreshSessionRequestFormatEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'token':
          return RefreshSessionRequestFormatEnum.token;
        case r'cookie':
          return RefreshSessionRequestFormatEnum.cookie;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RefreshSessionRequestFormatEnumTypeTransformer] instance.
  static RefreshSessionRequestFormatEnumTypeTransformer? _instance;
}
