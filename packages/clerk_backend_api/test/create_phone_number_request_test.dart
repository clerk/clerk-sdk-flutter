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

// tests for CreatePhoneNumberRequest
void main() {
  // final instance = CreatePhoneNumberRequest();

  group('test CreatePhoneNumberRequest', () {
    // The ID representing the user
    // String userId
    test('to test the property `userId`', () async {
      // TODO
    });

    // The new phone number. Must adhere to the E.164 standard for phone number format.
    // String phoneNumber
    test('to test the property `phoneNumber`', () async {
      // TODO
    });

    // When created, the phone number will be marked as verified.
    // bool verified
    test('to test the property `verified`', () async {
      // TODO
    });

    // Create this phone number as the primary phone number for the user. Default: false, unless it is the first phone number.
    // bool primary
    test('to test the property `primary`', () async {
      // TODO
    });

    // Create this phone number as reserved for multi-factor authentication. The phone number must also be verified. If there are no other reserved second factors, the phone number will be set as the default second factor.
    // bool reservedForSecondFactor
    test('to test the property `reservedForSecondFactor`', () async {
      // TODO
    });
  });
}
