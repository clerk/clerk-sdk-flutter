//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BillingApi {
  BillingApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Cancel a subscription item
  ///
  /// Cancel a specific subscription item. The subscription item can be canceled immediately or at the end of the current billing period.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] subscriptionItemId (required):
  ///   The ID of the subscription item to cancel
  ///
  /// * [bool] endNow:
  ///   Whether to cancel the subscription immediately (true) or at the end of the current billing period (false, default)
  Future<http.Response> cancelCommerceSubscriptionItemWithHttpInfo(
    String subscriptionItemId, {
    bool? endNow,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/billing/subscription_items/{subscription_item_id}'
        .replaceAll('{subscription_item_id}', subscriptionItemId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (endNow != null) {
      queryParams.addAll(_queryParams('', 'end_now', endNow));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Cancel a subscription item
  ///
  /// Cancel a specific subscription item. The subscription item can be canceled immediately or at the end of the current billing period.
  ///
  /// Parameters:
  ///
  /// * [String] subscriptionItemId (required):
  ///   The ID of the subscription item to cancel
  ///
  /// * [bool] endNow:
  ///   Whether to cancel the subscription immediately (true) or at the end of the current billing period (false, default)
  Future<CommerceSubscriptionItem?> cancelCommerceSubscriptionItem(
    String subscriptionItemId, {
    bool? endNow,
  }) async {
    final response = await cancelCommerceSubscriptionItemWithHttpInfo(
      subscriptionItemId,
      endNow: endNow,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'CommerceSubscriptionItem',
      ) as CommerceSubscriptionItem;
    }
    return null;
  }

  /// Create a custom billing price
  ///
  /// Creates a custom price for a billing plan. Custom prices allow you to offer different pricing to specific customers while maintaining the same plan structure.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateBillingPriceRequest] createBillingPriceRequest (required):
  ///   Parameters for creating a custom price
  Future<http.Response> createBillingPriceWithHttpInfo(
    CreateBillingPriceRequest createBillingPriceRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/billing/prices';

    // ignore: prefer_final_locals
    Object? postBody = createBillingPriceRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create a custom billing price
  ///
  /// Creates a custom price for a billing plan. Custom prices allow you to offer different pricing to specific customers while maintaining the same plan structure.
  ///
  /// Parameters:
  ///
  /// * [CreateBillingPriceRequest] createBillingPriceRequest (required):
  ///   Parameters for creating a custom price
  Future<BillingPriceResponse?> createBillingPrice(
    CreateBillingPriceRequest createBillingPriceRequest,
  ) async {
    final response = await createBillingPriceWithHttpInfo(
      createBillingPriceRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'BillingPriceResponse',
      ) as BillingPriceResponse;
    }
    return null;
  }

  /// Create a price transition for a subscription item
  ///
  /// Creates a price transition for the specified subscription item. This may create an upcoming subscription item or activate immediately depending on plan and payer rules.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] subscriptionItemId (required):
  ///   The ID of the subscription item to transition
  ///
  /// * [PriceTransitionRequest] priceTransitionRequest (required):
  ///   Parameters for the price transition
  Future<http.Response> createBillingPriceTransitionWithHttpInfo(
    String subscriptionItemId,
    PriceTransitionRequest priceTransitionRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/billing/subscription_items/{subscription_item_id}/price_transition'
            .replaceAll('{subscription_item_id}', subscriptionItemId);

    // ignore: prefer_final_locals
    Object? postBody = priceTransitionRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create a price transition for a subscription item
  ///
  /// Creates a price transition for the specified subscription item. This may create an upcoming subscription item or activate immediately depending on plan and payer rules.
  ///
  /// Parameters:
  ///
  /// * [String] subscriptionItemId (required):
  ///   The ID of the subscription item to transition
  ///
  /// * [PriceTransitionRequest] priceTransitionRequest (required):
  ///   Parameters for the price transition
  Future<CommercePriceTransitionResponse?> createBillingPriceTransition(
    String subscriptionItemId,
    PriceTransitionRequest priceTransitionRequest,
  ) async {
    final response = await createBillingPriceTransitionWithHttpInfo(
      subscriptionItemId,
      priceTransitionRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'CommercePriceTransitionResponse',
      ) as CommercePriceTransitionResponse;
    }
    return null;
  }

  /// Extend free trial for a subscription item
  ///
  /// Extends the free trial period for a specific subscription item to the specified timestamp. The subscription item must be currently in a free trial period, and the plan must support free trials. The timestamp must be in the future and not more than 365 days from the end of the current trial period This operation is idempotent - repeated requests with the same timestamp will not change the trial period.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] subscriptionItemId (required):
  ///   The ID of the subscription item to extend the free trial for
  ///
  /// * [ExtendFreeTrialRequest] extendFreeTrialRequest (required):
  ///   Parameters for extending the free trial
  Future<http.Response> extendBillingSubscriptionItemFreeTrialWithHttpInfo(
    String subscriptionItemId,
    ExtendFreeTrialRequest extendFreeTrialRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/billing/subscription_items/{subscription_item_id}/extend_free_trial'
            .replaceAll('{subscription_item_id}', subscriptionItemId);

    // ignore: prefer_final_locals
    Object? postBody = extendFreeTrialRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Extend free trial for a subscription item
  ///
  /// Extends the free trial period for a specific subscription item to the specified timestamp. The subscription item must be currently in a free trial period, and the plan must support free trials. The timestamp must be in the future and not more than 365 days from the end of the current trial period This operation is idempotent - repeated requests with the same timestamp will not change the trial period.
  ///
  /// Parameters:
  ///
  /// * [String] subscriptionItemId (required):
  ///   The ID of the subscription item to extend the free trial for
  ///
  /// * [ExtendFreeTrialRequest] extendFreeTrialRequest (required):
  ///   Parameters for extending the free trial
  Future<SchemasCommerceSubscriptionItem?>
      extendBillingSubscriptionItemFreeTrial(
    String subscriptionItemId,
    ExtendFreeTrialRequest extendFreeTrialRequest,
  ) async {
    final response = await extendBillingSubscriptionItemFreeTrialWithHttpInfo(
      subscriptionItemId,
      extendFreeTrialRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'SchemasCommerceSubscriptionItem',
      ) as SchemasCommerceSubscriptionItem;
    }
    return null;
  }

  /// List all billing prices
  ///
  /// Returns a list of all prices for the instance. The prices are returned sorted by amount ascending, then by creation date descending. This includes both default and custom prices. Pagination is supported.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] planId:
  ///   Filter prices by plan ID
  Future<http.Response> getBillingPriceListWithHttpInfo({
    bool? paginated,
    int? limit,
    int? offset,
    String? planId,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/billing/prices';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (paginated != null) {
      queryParams.addAll(_queryParams('', 'paginated', paginated));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (planId != null) {
      queryParams.addAll(_queryParams('', 'plan_id', planId));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all billing prices
  ///
  /// Returns a list of all prices for the instance. The prices are returned sorted by amount ascending, then by creation date descending. This includes both default and custom prices. Pagination is supported.
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] planId:
  ///   Filter prices by plan ID
  Future<PaginatedBillingPriceResponse?> getBillingPriceList({
    bool? paginated,
    int? limit,
    int? offset,
    String? planId,
  }) async {
    final response = await getBillingPriceListWithHttpInfo(
      paginated: paginated,
      limit: limit,
      offset: offset,
      planId: planId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'PaginatedBillingPriceResponse',
      ) as PaginatedBillingPriceResponse;
    }
    return null;
  }

  /// Retrieve a billing statement
  ///
  /// Retrieves the details of a billing statement.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] statementID (required):
  ///   The ID of the statement to retrieve.
  Future<http.Response> getBillingStatementWithHttpInfo(
    String statementID,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/billing/statements/{statementID}'
        .replaceAll('{statementID}', statementID);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve a billing statement
  ///
  /// Retrieves the details of a billing statement.
  ///
  /// Parameters:
  ///
  /// * [String] statementID (required):
  ///   The ID of the statement to retrieve.
  Future<BillingStatement?> getBillingStatement(
    String statementID,
  ) async {
    final response = await getBillingStatementWithHttpInfo(
      statementID,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'BillingStatement',
      ) as BillingStatement;
    }
    return null;
  }

  /// List all billing statements
  ///
  /// Returns a list of all billing statements for the instance. The statements are returned sorted by creation date, with the newest statements appearing first. Pagination is supported.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> getBillingStatementListWithHttpInfo({
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/billing/statements';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (paginated != null) {
      queryParams.addAll(_queryParams('', 'paginated', paginated));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all billing statements
  ///
  /// Returns a list of all billing statements for the instance. The statements are returned sorted by creation date, with the newest statements appearing first. Pagination is supported.
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<PaginatedBillingStatementResponse?> getBillingStatementList({
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    final response = await getBillingStatementListWithHttpInfo(
      paginated: paginated,
      limit: limit,
      offset: offset,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'PaginatedBillingStatementResponse',
      ) as PaginatedBillingStatementResponse;
    }
    return null;
  }

  /// List payment attempts for a billing statement
  ///
  /// Returns a list of all payment attempts for a specific billing statement. The payment attempts are returned sorted by creation date, with the newest payment attempts appearing first. Pagination is supported.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] statementID (required):
  ///   The ID of the statement to retrieve payment attempts for.
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> getBillingStatementPaymentAttemptsWithHttpInfo(
    String statementID, {
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/billing/statements/{statementID}/payment_attempts'
        .replaceAll('{statementID}', statementID);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (paginated != null) {
      queryParams.addAll(_queryParams('', 'paginated', paginated));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List payment attempts for a billing statement
  ///
  /// Returns a list of all payment attempts for a specific billing statement. The payment attempts are returned sorted by creation date, with the newest payment attempts appearing first. Pagination is supported.
  ///
  /// Parameters:
  ///
  /// * [String] statementID (required):
  ///   The ID of the statement to retrieve payment attempts for.
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<PaginatedBillingPaymentAttemptResponse?>
      getBillingStatementPaymentAttempts(
    String statementID, {
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    final response = await getBillingStatementPaymentAttemptsWithHttpInfo(
      statementID,
      paginated: paginated,
      limit: limit,
      offset: offset,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'PaginatedBillingPaymentAttemptResponse',
      ) as PaginatedBillingPaymentAttemptResponse;
    }
    return null;
  }

  /// List all billing plans
  ///
  /// Returns a list of all billing plans for the instance. The plans are returned sorted by creation date, with the newest plans appearing first. This includes both free and paid plans. Pagination is supported.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] payerType:
  ///   Filter plans by payer type
  Future<http.Response> getCommercePlanListWithHttpInfo({
    bool? paginated,
    int? limit,
    int? offset,
    String? payerType,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/billing/plans';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (paginated != null) {
      queryParams.addAll(_queryParams('', 'paginated', paginated));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (payerType != null) {
      queryParams.addAll(_queryParams('', 'payer_type', payerType));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all billing plans
  ///
  /// Returns a list of all billing plans for the instance. The plans are returned sorted by creation date, with the newest plans appearing first. This includes both free and paid plans. Pagination is supported.
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] payerType:
  ///   Filter plans by payer type
  Future<PaginatedCommercePlanResponse?> getCommercePlanList({
    bool? paginated,
    int? limit,
    int? offset,
    String? payerType,
  }) async {
    final response = await getCommercePlanListWithHttpInfo(
      paginated: paginated,
      limit: limit,
      offset: offset,
      payerType: payerType,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'PaginatedCommercePlanResponse',
      ) as PaginatedCommercePlanResponse;
    }
    return null;
  }

  /// List all subscription items
  ///
  /// Returns a list of all subscription items for the instance. The subscription items are returned sorted by creation date, with the newest appearing first. This includes subscriptions for both users and organizations. Pagination is supported.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] status:
  ///   Filter subscription items by status
  ///
  /// * [String] payerType:
  ///   Filter subscription items by payer type
  ///
  /// * [String] planId:
  ///   Filter subscription items by plan ID
  ///
  /// * [bool] includeFree:
  ///   Whether to include free plan subscription items
  ///
  /// * [String] query:
  ///   Search query to filter subscription items
  Future<http.Response> getCommerceSubscriptionItemListWithHttpInfo({
    bool? paginated,
    int? limit,
    int? offset,
    String? status,
    String? payerType,
    String? planId,
    bool? includeFree,
    String? query,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/billing/subscription_items';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (paginated != null) {
      queryParams.addAll(_queryParams('', 'paginated', paginated));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (payerType != null) {
      queryParams.addAll(_queryParams('', 'payer_type', payerType));
    }
    if (planId != null) {
      queryParams.addAll(_queryParams('', 'plan_id', planId));
    }
    if (includeFree != null) {
      queryParams.addAll(_queryParams('', 'include_free', includeFree));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all subscription items
  ///
  /// Returns a list of all subscription items for the instance. The subscription items are returned sorted by creation date, with the newest appearing first. This includes subscriptions for both users and organizations. Pagination is supported.
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] status:
  ///   Filter subscription items by status
  ///
  /// * [String] payerType:
  ///   Filter subscription items by payer type
  ///
  /// * [String] planId:
  ///   Filter subscription items by plan ID
  ///
  /// * [bool] includeFree:
  ///   Whether to include free plan subscription items
  ///
  /// * [String] query:
  ///   Search query to filter subscription items
  Future<PaginatedCommerceSubscriptionItemResponse?>
      getCommerceSubscriptionItemList({
    bool? paginated,
    int? limit,
    int? offset,
    String? status,
    String? payerType,
    String? planId,
    bool? includeFree,
    String? query,
  }) async {
    final response = await getCommerceSubscriptionItemListWithHttpInfo(
      paginated: paginated,
      limit: limit,
      offset: offset,
      status: status,
      payerType: payerType,
      planId: planId,
      includeFree: includeFree,
      query: query,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'PaginatedCommerceSubscriptionItemResponse',
      ) as PaginatedCommerceSubscriptionItemResponse;
    }
    return null;
  }

  /// Retrieve an organization's billing subscription
  ///
  /// Retrieves the billing subscription for the specified organization. This includes subscription details, active plans, billing information, and payment status. The subscription contains subscription items which represent the individual plans the organization is subscribed to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization whose subscription to retrieve
  Future<http.Response> getOrganizationBillingSubscriptionWithHttpInfo(
    String organizationId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/billing/subscription'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve an organization's billing subscription
  ///
  /// Retrieves the billing subscription for the specified organization. This includes subscription details, active plans, billing information, and payment status. The subscription contains subscription items which represent the individual plans the organization is subscribed to.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization whose subscription to retrieve
  Future<CommerceSubscription?> getOrganizationBillingSubscription(
    String organizationId,
  ) async {
    final response = await getOrganizationBillingSubscriptionWithHttpInfo(
      organizationId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'CommerceSubscription',
      ) as CommerceSubscription;
    }
    return null;
  }

  /// Retrieve a user's billing subscription
  ///
  /// Retrieves the billing subscription for the specified user. This includes subscription details, active plans, billing information, and payment status. The subscription contains subscription items which represent the individual plans the user is subscribed to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose subscription to retrieve
  Future<http.Response> getUserBillingSubscriptionWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/billing/subscription'
        .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve a user's billing subscription
  ///
  /// Retrieves the billing subscription for the specified user. This includes subscription details, active plans, billing information, and payment status. The subscription contains subscription items which represent the individual plans the user is subscribed to.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose subscription to retrieve
  Future<CommerceSubscription?> getUserBillingSubscription(
    String userId,
  ) async {
    final response = await getUserBillingSubscriptionWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'CommerceSubscription',
      ) as CommerceSubscription;
    }
    return null;
  }
}
