//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

// tests for UpdateInstanceAuthConfigRequest
void main() {
  // final instance = UpdateInstanceAuthConfigRequest();

  group('test UpdateInstanceAuthConfigRequest', () {
    // Whether sign up is restricted to email addresses, phone numbers and usernames that are on the allowlist.
    // bool restrictedToAllowlist (default value: false)
    test('to test the property `restrictedToAllowlist`', () async {
      // TODO
    });

    // The local part of the email address from which authentication-related emails (e.g. OTP code, magic links) will be sent. Only alphanumeric values are allowed. Note that this value should contain only the local part of the address (e.g. `foo` for `foo@example.com`).
    // String fromEmailAddress
    test('to test the property `fromEmailAddress`', () async {
      // TODO
    });

    // Enable the Progressive Sign Up algorithm. Refer to the [docs](https://clerk.com/docs/upgrade-guides/progressive-sign-up) for more info.
    // bool progressiveSignUp
    test('to test the property `progressiveSignUp`', () async {
      // TODO
    });

    // The \"enhanced_email_deliverability\" feature will send emails from \"verifications@clerk.dev\" instead of your domain. This can be helpful if you do not have a high domain reputation.
    // bool enhancedEmailDeliverability
    test('to test the property `enhancedEmailDeliverability`', () async {
      // TODO
    });

    // Toggles test mode for this instance, allowing the use of test email addresses and phone numbers. Defaults to true for development instances.
    // bool testMode
    test('to test the property `testMode`', () async {
      // TODO
    });
  });
}
