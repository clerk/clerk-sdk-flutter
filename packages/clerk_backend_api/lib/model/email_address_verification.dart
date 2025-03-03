//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EmailAddressVerification {
  /// Returns a new [EmailAddressVerification] instance.
  EmailAddressVerification({
    required this.status,
    required this.strategy,
    required this.attempts,
    required this.expireAt,
    this.verifiedAtClient,
    this.error,
  });

  EmailAddressVerificationStatusEnum status;

  EmailAddressVerificationStrategyEnum strategy;

  int? attempts;

  int? expireAt;

  String? verifiedAtClient;

  FromOAuthError? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailAddressVerification &&
          other.status == status &&
          other.strategy == strategy &&
          other.attempts == attempts &&
          other.expireAt == expireAt &&
          other.verifiedAtClient == verifiedAtClient &&
          other.error == error;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (status.hashCode) +
      (strategy.hashCode) +
      (attempts == null ? 0 : attempts!.hashCode) +
      (expireAt == null ? 0 : expireAt!.hashCode) +
      (verifiedAtClient == null ? 0 : verifiedAtClient!.hashCode) +
      (error == null ? 0 : error!.hashCode);

  @override
  String toString() =>
      'EmailAddressVerification[status=$status, strategy=$strategy, attempts=$attempts, expireAt=$expireAt, verifiedAtClient=$verifiedAtClient, error=$error]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'status'] = this.status;
    json[r'strategy'] = this.strategy;
    if (this.attempts != null) {
      json[r'attempts'] = this.attempts;
    } else {
      json[r'attempts'] = null;
    }
    if (this.expireAt != null) {
      json[r'expire_at'] = this.expireAt;
    } else {
      json[r'expire_at'] = null;
    }
    if (this.verifiedAtClient != null) {
      json[r'verified_at_client'] = this.verifiedAtClient;
    } else {
      json[r'verified_at_client'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    return json;
  }

  /// Returns a new [EmailAddressVerification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EmailAddressVerification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "EmailAddressVerification[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "EmailAddressVerification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EmailAddressVerification(
        status: EmailAddressVerificationStatusEnum.fromJson(json[r'status'])!,
        strategy:
            EmailAddressVerificationStrategyEnum.fromJson(json[r'strategy'])!,
        attempts: mapValueOfType<int>(json, r'attempts'),
        expireAt: mapValueOfType<int>(json, r'expire_at'),
        verifiedAtClient: mapValueOfType<String>(json, r'verified_at_client'),
        error: FromOAuthError.fromJson(json[r'error']),
      );
    }
    return null;
  }

  static List<EmailAddressVerification> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EmailAddressVerification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailAddressVerification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EmailAddressVerification> mapFromJson(dynamic json) {
    final map = <String, EmailAddressVerification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EmailAddressVerification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EmailAddressVerification-objects as value to a dart map
  static Map<String, List<EmailAddressVerification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<EmailAddressVerification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EmailAddressVerification.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
    'strategy',
    'attempts',
    'expire_at',
  };
}

class EmailAddressVerificationStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const EmailAddressVerificationStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unverified = EmailAddressVerificationStatusEnum._(r'unverified');
  static const verified = EmailAddressVerificationStatusEnum._(r'verified');
  static const expired = EmailAddressVerificationStatusEnum._(r'expired');

  /// List of all possible values in this [enum][EmailAddressVerificationStatusEnum].
  static const values = <EmailAddressVerificationStatusEnum>[
    unverified,
    verified,
    expired,
  ];

  static EmailAddressVerificationStatusEnum? fromJson(dynamic value) =>
      EmailAddressVerificationStatusEnumTypeTransformer().decode(value);

  static List<EmailAddressVerificationStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EmailAddressVerificationStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailAddressVerificationStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EmailAddressVerificationStatusEnum] to String,
/// and [decode] dynamic data back to [EmailAddressVerificationStatusEnum].
class EmailAddressVerificationStatusEnumTypeTransformer {
  factory EmailAddressVerificationStatusEnumTypeTransformer() =>
      _instance ??= const EmailAddressVerificationStatusEnumTypeTransformer._();

  const EmailAddressVerificationStatusEnumTypeTransformer._();

  String encode(EmailAddressVerificationStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EmailAddressVerificationStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EmailAddressVerificationStatusEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'unverified':
          return EmailAddressVerificationStatusEnum.unverified;
        case r'verified':
          return EmailAddressVerificationStatusEnum.verified;
        case r'expired':
          return EmailAddressVerificationStatusEnum.expired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EmailAddressVerificationStatusEnumTypeTransformer] instance.
  static EmailAddressVerificationStatusEnumTypeTransformer? _instance;
}

class EmailAddressVerificationStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const EmailAddressVerificationStrategyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ticket = EmailAddressVerificationStrategyEnum._(r'ticket');

  /// List of all possible values in this [enum][EmailAddressVerificationStrategyEnum].
  static const values = <EmailAddressVerificationStrategyEnum>[
    ticket,
  ];

  static EmailAddressVerificationStrategyEnum? fromJson(dynamic value) =>
      EmailAddressVerificationStrategyEnumTypeTransformer().decode(value);

  static List<EmailAddressVerificationStrategyEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <EmailAddressVerificationStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailAddressVerificationStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EmailAddressVerificationStrategyEnum] to String,
/// and [decode] dynamic data back to [EmailAddressVerificationStrategyEnum].
class EmailAddressVerificationStrategyEnumTypeTransformer {
  factory EmailAddressVerificationStrategyEnumTypeTransformer() => _instance ??=
      const EmailAddressVerificationStrategyEnumTypeTransformer._();

  const EmailAddressVerificationStrategyEnumTypeTransformer._();

  String encode(EmailAddressVerificationStrategyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EmailAddressVerificationStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EmailAddressVerificationStrategyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ticket':
          return EmailAddressVerificationStrategyEnum.ticket;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EmailAddressVerificationStrategyEnumTypeTransformer] instance.
  static EmailAddressVerificationStrategyEnumTypeTransformer? _instance;
}
