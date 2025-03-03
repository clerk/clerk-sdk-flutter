//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignUpVerification {
  /// Returns a new [SignUpVerification] instance.
  SignUpVerification({
    this.nextAction,
    this.supportedStrategies = const [],
  });

  SignUpVerificationNextActionEnum? nextAction;

  List<String> supportedStrategies;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignUpVerification &&
          other.nextAction == nextAction &&
          _deepEquality.equals(other.supportedStrategies, supportedStrategies);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nextAction == null ? 0 : nextAction!.hashCode) +
      (supportedStrategies.hashCode);

  @override
  String toString() =>
      'SignUpVerification[nextAction=$nextAction, supportedStrategies=$supportedStrategies]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.nextAction != null) {
      json[r'next_action'] = this.nextAction;
    } else {
      json[r'next_action'] = null;
    }
    json[r'supported_strategies'] = this.supportedStrategies;
    return json;
  }

  /// Returns a new [SignUpVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SignUpVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SignUpVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SignUpVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SignUpVerification(
        nextAction:
            SignUpVerificationNextActionEnum.fromJson(json[r'next_action']),
        supportedStrategies: json[r'supported_strategies'] is Iterable
            ? (json[r'supported_strategies'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SignUpVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignUpVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignUpVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SignUpVerification> mapFromJson(dynamic json) {
    final map = <String, SignUpVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SignUpVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SignUpVerification-objects as value to a dart map
  static Map<String, List<SignUpVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SignUpVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SignUpVerification.listFromJson(
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

class SignUpVerificationNextActionEnum {
  /// Instantiate a new enum with the provided [value].
  const SignUpVerificationNextActionEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const needsPrepare =
      SignUpVerificationNextActionEnum._(r'needs_prepare');
  static const needsAttempt =
      SignUpVerificationNextActionEnum._(r'needs_attempt');
  static const empty = SignUpVerificationNextActionEnum._(r'');

  /// List of all possible values in this [enum][SignUpVerificationNextActionEnum].
  static const values = <SignUpVerificationNextActionEnum>[
    needsPrepare,
    needsAttempt,
    empty,
  ];

  static SignUpVerificationNextActionEnum? fromJson(dynamic value) =>
      SignUpVerificationNextActionEnumTypeTransformer().decode(value);

  static List<SignUpVerificationNextActionEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignUpVerificationNextActionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignUpVerificationNextActionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SignUpVerificationNextActionEnum] to String,
/// and [decode] dynamic data back to [SignUpVerificationNextActionEnum].
class SignUpVerificationNextActionEnumTypeTransformer {
  factory SignUpVerificationNextActionEnumTypeTransformer() =>
      _instance ??= const SignUpVerificationNextActionEnumTypeTransformer._();

  const SignUpVerificationNextActionEnumTypeTransformer._();

  String encode(SignUpVerificationNextActionEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SignUpVerificationNextActionEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SignUpVerificationNextActionEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'needs_prepare':
          return SignUpVerificationNextActionEnum.needsPrepare;
        case r'needs_attempt':
          return SignUpVerificationNextActionEnum.needsAttempt;
        case r'':
          return SignUpVerificationNextActionEnum.empty;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SignUpVerificationNextActionEnumTypeTransformer] instance.
  static SignUpVerificationNextActionEnumTypeTransformer? _instance;
}
