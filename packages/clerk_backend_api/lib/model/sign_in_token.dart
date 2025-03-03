//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignInToken {
  /// Returns a new [SignInToken] instance.
  SignInToken({
    required this.object,
    required this.id,
    required this.status,
    required this.userId,
    this.token,
    this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  SignInTokenObjectEnum object;

  String id;

  SignInTokenStatusEnum status;

  String userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? token;

  String? url;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignInToken &&
          other.object == object &&
          other.id == id &&
          other.status == status &&
          other.userId == userId &&
          other.token == token &&
          other.url == url &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (status.hashCode) +
      (userId.hashCode) +
      (token == null ? 0 : token!.hashCode) +
      (url == null ? 0 : url!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode);

  @override
  String toString() =>
      'SignInToken[object=$object, id=$id, status=$status, userId=$userId, token=$token, url=$url, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'status'] = this.status;
    json[r'user_id'] = this.userId;
    if (this.token != null) {
      json[r'token'] = this.token;
    } else {
      json[r'token'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [SignInToken] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SignInToken? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SignInToken[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SignInToken[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SignInToken(
        object: SignInTokenObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        status: SignInTokenStatusEnum.fromJson(json[r'status'])!,
        userId: mapValueOfType<String>(json, r'user_id')!,
        token: mapValueOfType<String>(json, r'token'),
        url: mapValueOfType<String>(json, r'url'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<SignInToken> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignInToken>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignInToken.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SignInToken> mapFromJson(dynamic json) {
    final map = <String, SignInToken>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SignInToken.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SignInToken-objects as value to a dart map
  static Map<String, List<SignInToken>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SignInToken>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SignInToken.listFromJson(
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
    'status',
    'user_id',
    'created_at',
    'updated_at',
  };
}

class SignInTokenObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const SignInTokenObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const signInToken = SignInTokenObjectEnum._(r'sign_in_token');

  /// List of all possible values in this [enum][SignInTokenObjectEnum].
  static const values = <SignInTokenObjectEnum>[
    signInToken,
  ];

  static SignInTokenObjectEnum? fromJson(dynamic value) =>
      SignInTokenObjectEnumTypeTransformer().decode(value);

  static List<SignInTokenObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignInTokenObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignInTokenObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SignInTokenObjectEnum] to String,
/// and [decode] dynamic data back to [SignInTokenObjectEnum].
class SignInTokenObjectEnumTypeTransformer {
  factory SignInTokenObjectEnumTypeTransformer() =>
      _instance ??= const SignInTokenObjectEnumTypeTransformer._();

  const SignInTokenObjectEnumTypeTransformer._();

  String encode(SignInTokenObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SignInTokenObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SignInTokenObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'sign_in_token':
          return SignInTokenObjectEnum.signInToken;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SignInTokenObjectEnumTypeTransformer] instance.
  static SignInTokenObjectEnumTypeTransformer? _instance;
}

class SignInTokenStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const SignInTokenStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = SignInTokenStatusEnum._(r'pending');
  static const accepted = SignInTokenStatusEnum._(r'accepted');
  static const revoked = SignInTokenStatusEnum._(r'revoked');

  /// List of all possible values in this [enum][SignInTokenStatusEnum].
  static const values = <SignInTokenStatusEnum>[
    pending,
    accepted,
    revoked,
  ];

  static SignInTokenStatusEnum? fromJson(dynamic value) =>
      SignInTokenStatusEnumTypeTransformer().decode(value);

  static List<SignInTokenStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignInTokenStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignInTokenStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SignInTokenStatusEnum] to String,
/// and [decode] dynamic data back to [SignInTokenStatusEnum].
class SignInTokenStatusEnumTypeTransformer {
  factory SignInTokenStatusEnumTypeTransformer() =>
      _instance ??= const SignInTokenStatusEnumTypeTransformer._();

  const SignInTokenStatusEnumTypeTransformer._();

  String encode(SignInTokenStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SignInTokenStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SignInTokenStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'pending':
          return SignInTokenStatusEnum.pending;
        case r'accepted':
          return SignInTokenStatusEnum.accepted;
        case r'revoked':
          return SignInTokenStatusEnum.revoked;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SignInTokenStatusEnumTypeTransformer] instance.
  static SignInTokenStatusEnumTypeTransformer? _instance;
}
