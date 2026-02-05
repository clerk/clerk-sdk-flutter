//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

// tests for SchemasCommerceSubscriptionItem
void main() {
  // final instance = SchemasCommerceSubscriptionItem();

  group('test SchemasCommerceSubscriptionItem', () {
    // String representing the object's type. Objects of the same type share the same value.
    // String object
    test('to test the property `object`', () async {
      // TODO
    });

    // Unique identifier for the subscription item.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Unique identifier for the Clerk instance.
    // String instanceId
    test('to test the property `instanceId`', () async {
      // TODO
    });

    // Current status of the subscription item.
    // String status
    test('to test the property `status`', () async {
      // TODO
    });

    // Credit information (only available in PaymentAttempt events).
    // CommerceSubscriptionCreditResponse credit
    test('to test the property `credit`', () async {
      // TODO
    });

    // Unique identifier for the associated plan.
    // String planId
    test('to test the property `planId`', () async {
      // TODO
    });

    // Unique identifier for the associated price
    // String priceId
    test('to test the property `priceId`', () async {
      // TODO
    });

    // The associated commerce plan.
    // SchemasCommercePlan plan
    test('to test the property `plan`', () async {
      // TODO
    });

    // The billing period for this subscription.
    // String planPeriod
    test('to test the property `planPeriod`', () async {
      // TODO
    });

    // Unique identifier for the payment source.
    // String paymentSourceId
    test('to test the property `paymentSourceId`', () async {
      // TODO
    });

    // The payment source associated with this subscription.
    // CommercePaymentSourceResponse paymentSource
    test('to test the property `paymentSource`', () async {
      // TODO
    });

    // Total amount paid over the lifetime of this subscription.
    // CommerceMoneyResponse lifetimePaid
    test('to test the property `lifetimePaid`', () async {
      // TODO
    });

    // Current amount for this subscription.
    // CommerceMoneyResponse amount
    test('to test the property `amount`', () async {
      // TODO
    });

    // Information about the next invoice.
    // CommerceSubscriptionItemNextPaymentResponse nextInvoice
    test('to test the property `nextInvoice`', () async {
      // TODO
    });

    // Information about the next payment.
    // CommerceSubscriptionItemNextPaymentResponse nextPayment
    test('to test the property `nextPayment`', () async {
      // TODO
    });

    // Unique identifier for the payer.
    // String payerId
    test('to test the property `payerId`', () async {
      // TODO
    });

    // The payer associated with this subscription.
    // SchemasCommercePayerResponse payer
    test('to test the property `payer`', () async {
      // TODO
    });

    // Whether this subscription is currently on a free trial.
    // bool isFreeTrial
    test('to test the property `isFreeTrial`', () async {
      // TODO
    });

    // Unix timestamp (in milliseconds) when the current period started.
    // int periodStart
    test('to test the property `periodStart`', () async {
      // TODO
    });

    // Unix timestamp (in milliseconds) when the current period ends.
    // int periodEnd
    test('to test the property `periodEnd`', () async {
      // TODO
    });

    // Date used for proration calculations.
    // String prorationDate
    test('to test the property `prorationDate`', () async {
      // TODO
    });

    // Unix timestamp (in milliseconds) when the subscription was canceled.
    // int canceledAt
    test('to test the property `canceledAt`', () async {
      // TODO
    });

    // Unix timestamp (in milliseconds) when the subscription became past due.
    // int pastDueAt
    test('to test the property `pastDueAt`', () async {
      // TODO
    });

    // Unix timestamp (in milliseconds) when the subscription ended.
    // int endedAt
    test('to test the property `endedAt`', () async {
      // TODO
    });

    // Unix timestamp (in milliseconds) when the subscription was created.
    // int createdAt
    test('to test the property `createdAt`', () async {
      // TODO
    });

    // Unix timestamp (in milliseconds) when the subscription was last updated.
    // int updatedAt
    test('to test the property `updatedAt`', () async {
      // TODO
    });
  });
}
