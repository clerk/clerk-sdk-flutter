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

// tests for UpdateInstanceRequest
void main() {
  // final instance = UpdateInstanceRequest();

  group('test UpdateInstanceRequest', () {
    // Toggles test mode for this instance, allowing the use of test email addresses and phone numbers. Defaults to true for development instances.
    // bool testMode
    test('to test the property `testMode`', () async {
      // TODO
    });

    // Whether the instance should be using the HIBP service to check passwords for breaches
    // bool hibp
    test('to test the property `hibp`', () async {
      // TODO
    });

    // The \"enhanced_email_deliverability\" feature will send emails from \"verifications@clerk.dev\" instead of your domain. This can be helpful if you do not have a high domain reputation.
    // bool enhancedEmailDeliverability
    test('to test the property `enhancedEmailDeliverability`', () async {
      // TODO
    });

    // String supportEmail
    test('to test the property `supportEmail`', () async {
      // TODO
    });

    // String clerkJsVersion
    test('to test the property `clerkJsVersion`', () async {
      // TODO
    });

    // String developmentOrigin
    test('to test the property `developmentOrigin`', () async {
      // TODO
    });

    // For browser-like stacks such as browser extensions, Electron, or Capacitor.js the instance allowed origins need to be updated with the request origin value. For Chrome extensions popup, background, or service worker pages the origin is chrome-extension://extension_uiid. For Electron apps the default origin is http://localhost:3000. For Capacitor, the origin is capacitor://localhost.
    // List<String> allowedOrigins (default value: const [])
    test('to test the property `allowedOrigins`', () async {
      // TODO
    });

    // Whether the instance should operate in cookieless development mode (i.e. without third-party cookies). Deprecated: Please use `url_based_session_syncing` instead.
    // bool cookielessDev
    test('to test the property `cookielessDev`', () async {
      // TODO
    });

    // Whether the instance should use URL-based session syncing in development mode (i.e. without third-party cookies).
    // bool urlBasedSessionSyncing
    test('to test the property `urlBasedSessionSyncing`', () async {
      // TODO
    });
  });
}
