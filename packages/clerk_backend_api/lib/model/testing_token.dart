//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TestingToken {
  /// Returns a new [TestingToken] instance.
  TestingToken({
    required this.object,
    required this.token,
    required this.expiresAt,
  });

  TestingTokenObjectEnum object;

  /// The actual token. This value is meant to be passed in the `__clerk_testing_token` query parameter with requests to the Frontend API.
  String token;

  /// Unix timestamp of the token's expiration time.
  int expiresAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestingToken &&
          other.object == object &&
          other.token == token &&
          other.expiresAt == expiresAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (token.hashCode) + (expiresAt.hashCode);

  @override
  String toString() =>
      'TestingToken[object=$object, token=$token, expiresAt=$expiresAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'token'] = this.token;
    json[r'expires_at'] = this.expiresAt;
    return json;
  }

  /// Returns a new [TestingToken] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestingToken? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "TestingToken[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "TestingToken[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TestingToken(
        object: TestingTokenObjectEnum.fromJson(json[r'object'])!,
        token: mapValueOfType<String>(json, r'token')!,
        expiresAt: mapValueOfType<int>(json, r'expires_at')!,
      );
    }
    return null;
  }

  static List<TestingToken> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TestingToken>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestingToken.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestingToken> mapFromJson(dynamic json) {
    final map = <String, TestingToken>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestingToken.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestingToken-objects as value to a dart map
  static Map<String, List<TestingToken>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<TestingToken>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestingToken.listFromJson(
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
    'token',
    'expires_at',
  };
}

class TestingTokenObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const TestingTokenObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const testingToken = TestingTokenObjectEnum._(r'testing_token');

  /// List of all possible values in this [enum][TestingTokenObjectEnum].
  static const values = <TestingTokenObjectEnum>[
    testingToken,
  ];

  static TestingTokenObjectEnum? fromJson(dynamic value) =>
      TestingTokenObjectEnumTypeTransformer().decode(value);

  static List<TestingTokenObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TestingTokenObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestingTokenObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TestingTokenObjectEnum] to String,
/// and [decode] dynamic data back to [TestingTokenObjectEnum].
class TestingTokenObjectEnumTypeTransformer {
  factory TestingTokenObjectEnumTypeTransformer() =>
      _instance ??= const TestingTokenObjectEnumTypeTransformer._();

  const TestingTokenObjectEnumTypeTransformer._();

  String encode(TestingTokenObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a TestingTokenObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TestingTokenObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'testing_token':
          return TestingTokenObjectEnum.testingToken;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TestingTokenObjectEnumTypeTransformer] instance.
  static TestingTokenObjectEnumTypeTransformer? _instance;
}
