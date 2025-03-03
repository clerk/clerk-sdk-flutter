//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignUpVerifications {
  /// Returns a new [SignUpVerifications] instance.
  SignUpVerifications({
    required this.emailAddress,
    required this.phoneNumber,
    required this.web3Wallet,
    required this.externalAccount,
  });

  SignUpVerification? emailAddress;

  SignUpVerification? phoneNumber;

  SignUpVerification? web3Wallet;

  Object? externalAccount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignUpVerifications &&
          other.emailAddress == emailAddress &&
          other.phoneNumber == phoneNumber &&
          other.web3Wallet == web3Wallet &&
          other.externalAccount == externalAccount;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (emailAddress == null ? 0 : emailAddress!.hashCode) +
      (phoneNumber == null ? 0 : phoneNumber!.hashCode) +
      (web3Wallet == null ? 0 : web3Wallet!.hashCode) +
      (externalAccount == null ? 0 : externalAccount!.hashCode);

  @override
  String toString() =>
      'SignUpVerifications[emailAddress=$emailAddress, phoneNumber=$phoneNumber, web3Wallet=$web3Wallet, externalAccount=$externalAccount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.emailAddress != null) {
      json[r'email_address'] = this.emailAddress;
    } else {
      json[r'email_address'] = null;
    }
    if (this.phoneNumber != null) {
      json[r'phone_number'] = this.phoneNumber;
    } else {
      json[r'phone_number'] = null;
    }
    if (this.web3Wallet != null) {
      json[r'web3_wallet'] = this.web3Wallet;
    } else {
      json[r'web3_wallet'] = null;
    }
    if (this.externalAccount != null) {
      json[r'external_account'] = this.externalAccount;
    } else {
      json[r'external_account'] = null;
    }
    return json;
  }

  /// Returns a new [SignUpVerifications] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SignUpVerifications? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SignUpVerifications[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SignUpVerifications[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SignUpVerifications(
        emailAddress: SignUpVerification.fromJson(json[r'email_address']),
        phoneNumber: SignUpVerification.fromJson(json[r'phone_number']),
        web3Wallet: SignUpVerification.fromJson(json[r'web3_wallet']),
        externalAccount: mapValueOfType<Object>(json, r'external_account'),
      );
    }
    return null;
  }

  static List<SignUpVerifications> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SignUpVerifications>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignUpVerifications.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SignUpVerifications> mapFromJson(dynamic json) {
    final map = <String, SignUpVerifications>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SignUpVerifications.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SignUpVerifications-objects as value to a dart map
  static Map<String, List<SignUpVerifications>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SignUpVerifications>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SignUpVerifications.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'email_address',
    'phone_number',
    'web3_wallet',
    'external_account',
  };
}
