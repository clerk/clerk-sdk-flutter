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

/// tests for BillingApi
void main() {
  // final instance = BillingApi();

  group('tests for BillingApi', () {
    // Cancel a subscription item
    //
    // Cancel a specific subscription item. The subscription item can be canceled immediately or at the end of the current billing period.
    //
    //Future<CommerceSubscriptionItem> cancelCommerceSubscriptionItem(String subscriptionItemId, { bool endNow }) async
    test('test cancelCommerceSubscriptionItem', () async {
      // TODO
    });

    // Create a custom billing price
    //
    // Creates a custom price for a billing plan. Custom prices allow you to offer different pricing to specific customers while maintaining the same plan structure.
    //
    //Future<BillingPriceResponse> createBillingPrice(CreateBillingPriceRequest createBillingPriceRequest) async
    test('test createBillingPrice', () async {
      // TODO
    });

    // Create a price transition for a subscription item
    //
    // Creates a price transition for the specified subscription item. This may create an upcoming subscription item or activate immediately depending on plan and payer rules.
    //
    //Future<CommercePriceTransitionResponse> createBillingPriceTransition(String subscriptionItemId, PriceTransitionRequest priceTransitionRequest) async
    test('test createBillingPriceTransition', () async {
      // TODO
    });

    // Extend free trial for a subscription item
    //
    // Extends the free trial period for a specific subscription item to the specified timestamp. The subscription item must be currently in a free trial period, and the plan must support free trials. The timestamp must be in the future and not more than 365 days from the end of the current trial period This operation is idempotent - repeated requests with the same timestamp will not change the trial period.
    //
    //Future<SchemasCommerceSubscriptionItem> extendBillingSubscriptionItemFreeTrial(String subscriptionItemId, ExtendFreeTrialRequest extendFreeTrialRequest) async
    test('test extendBillingSubscriptionItemFreeTrial', () async {
      // TODO
    });

    // List all billing prices
    //
    // Returns a list of all prices for the instance. The prices are returned sorted by amount ascending, then by creation date descending. This includes both default and custom prices. Pagination is supported.
    //
    //Future<PaginatedBillingPriceResponse> getBillingPriceList({ bool paginated, int limit, int offset, String planId }) async
    test('test getBillingPriceList', () async {
      // TODO
    });

    // Retrieve a billing statement
    //
    // Retrieves the details of a billing statement.
    //
    //Future<BillingStatement> getBillingStatement(String statementID) async
    test('test getBillingStatement', () async {
      // TODO
    });

    // List all billing statements
    //
    // Returns a list of all billing statements for the instance. The statements are returned sorted by creation date, with the newest statements appearing first. Pagination is supported.
    //
    //Future<PaginatedBillingStatementResponse> getBillingStatementList({ bool paginated, int limit, int offset }) async
    test('test getBillingStatementList', () async {
      // TODO
    });

    // List payment attempts for a billing statement
    //
    // Returns a list of all payment attempts for a specific billing statement. The payment attempts are returned sorted by creation date, with the newest payment attempts appearing first. Pagination is supported.
    //
    //Future<PaginatedBillingPaymentAttemptResponse> getBillingStatementPaymentAttempts(String statementID, { bool paginated, int limit, int offset }) async
    test('test getBillingStatementPaymentAttempts', () async {
      // TODO
    });

    // List all billing plans
    //
    // Returns a list of all billing plans for the instance. The plans are returned sorted by creation date, with the newest plans appearing first. This includes both free and paid plans. Pagination is supported.
    //
    //Future<PaginatedCommercePlanResponse> getCommercePlanList({ bool paginated, int limit, int offset, String payerType }) async
    test('test getCommercePlanList', () async {
      // TODO
    });

    // List all subscription items
    //
    // Returns a list of all subscription items for the instance. The subscription items are returned sorted by creation date, with the newest appearing first. This includes subscriptions for both users and organizations. Pagination is supported.
    //
    //Future<PaginatedCommerceSubscriptionItemResponse> getCommerceSubscriptionItemList({ bool paginated, int limit, int offset, String status, String payerType, String planId, bool includeFree, String query }) async
    test('test getCommerceSubscriptionItemList', () async {
      // TODO
    });

    // Retrieve an organization's billing subscription
    //
    // Retrieves the billing subscription for the specified organization. This includes subscription details, active plans, billing information, and payment status. The subscription contains subscription items which represent the individual plans the organization is subscribed to.
    //
    //Future<CommerceSubscription> getOrganizationBillingSubscription_0(String organizationId) async
    test('test getOrganizationBillingSubscription_0', () async {
      // TODO
    });

    // Retrieve a user's billing subscription
    //
    // Retrieves the billing subscription for the specified user. This includes subscription details, active plans, billing information, and payment status. The subscription contains subscription items which represent the individual plans the user is subscribed to.
    //
    //Future<CommerceSubscription> getUserBillingSubscription_0(String userId) async
    test('test getUserBillingSubscription_0', () async {
      // TODO
    });
  });
}
