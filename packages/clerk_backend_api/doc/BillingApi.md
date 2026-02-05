# openapi.api.BillingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.clerk.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelCommerceSubscriptionItem**](BillingApi.md#cancelcommercesubscriptionitem) | **DELETE** /billing/subscription_items/{subscription_item_id} | Cancel a subscription item
[**createBillingPrice**](BillingApi.md#createbillingprice) | **POST** /billing/prices | Create a custom billing price
[**createBillingPriceTransition**](BillingApi.md#createbillingpricetransition) | **POST** /billing/subscription_items/{subscription_item_id}/price_transition | Create a price transition for a subscription item
[**extendBillingSubscriptionItemFreeTrial**](BillingApi.md#extendbillingsubscriptionitemfreetrial) | **POST** /billing/subscription_items/{subscription_item_id}/extend_free_trial | Extend free trial for a subscription item
[**getBillingPriceList**](BillingApi.md#getbillingpricelist) | **GET** /billing/prices | List all billing prices
[**getBillingStatement**](BillingApi.md#getbillingstatement) | **GET** /billing/statements/{statementID} | Retrieve a billing statement
[**getBillingStatementList**](BillingApi.md#getbillingstatementlist) | **GET** /billing/statements | List all billing statements
[**getBillingStatementPaymentAttempts**](BillingApi.md#getbillingstatementpaymentattempts) | **GET** /billing/statements/{statementID}/payment_attempts | List payment attempts for a billing statement
[**getCommercePlanList**](BillingApi.md#getcommerceplanlist) | **GET** /billing/plans | List all billing plans
[**getCommerceSubscriptionItemList**](BillingApi.md#getcommercesubscriptionitemlist) | **GET** /billing/subscription_items | List all subscription items
[**getOrganizationBillingSubscription_0**](BillingApi.md#getorganizationbillingsubscription_0) | **GET** /organizations/{organization_id}/billing/subscription | Retrieve an organization's billing subscription
[**getUserBillingSubscription_0**](BillingApi.md#getuserbillingsubscription_0) | **GET** /users/{user_id}/billing/subscription | Retrieve a user's billing subscription


# **cancelCommerceSubscriptionItem**
> CommerceSubscriptionItem cancelCommerceSubscriptionItem(subscriptionItemId, endNow)

Cancel a subscription item

Cancel a specific subscription item. The subscription item can be canceled immediately or at the end of the current billing period.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final subscriptionItemId = subscriptionItemId_example; // String | The ID of the subscription item to cancel
final endNow = true; // bool | Whether to cancel the subscription immediately (true) or at the end of the current billing period (false, default)

try {
    final result = api_instance.cancelCommerceSubscriptionItem(subscriptionItemId, endNow);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->cancelCommerceSubscriptionItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscriptionItemId** | **String**| The ID of the subscription item to cancel | 
 **endNow** | **bool**| Whether to cancel the subscription immediately (true) or at the end of the current billing period (false, default) | [optional] [default to false]

### Return type

[**CommerceSubscriptionItem**](CommerceSubscriptionItem.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createBillingPrice**
> BillingPriceResponse createBillingPrice(createBillingPriceRequest)

Create a custom billing price

Creates a custom price for a billing plan. Custom prices allow you to offer different pricing to specific customers while maintaining the same plan structure.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final createBillingPriceRequest = CreateBillingPriceRequest(); // CreateBillingPriceRequest | Parameters for creating a custom price

try {
    final result = api_instance.createBillingPrice(createBillingPriceRequest);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->createBillingPrice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createBillingPriceRequest** | [**CreateBillingPriceRequest**](CreateBillingPriceRequest.md)| Parameters for creating a custom price | 

### Return type

[**BillingPriceResponse**](BillingPriceResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createBillingPriceTransition**
> CommercePriceTransitionResponse createBillingPriceTransition(subscriptionItemId, priceTransitionRequest)

Create a price transition for a subscription item

Creates a price transition for the specified subscription item. This may create an upcoming subscription item or activate immediately depending on plan and payer rules.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final subscriptionItemId = subscriptionItemId_example; // String | The ID of the subscription item to transition
final priceTransitionRequest = PriceTransitionRequest(); // PriceTransitionRequest | Parameters for the price transition

try {
    final result = api_instance.createBillingPriceTransition(subscriptionItemId, priceTransitionRequest);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->createBillingPriceTransition: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscriptionItemId** | **String**| The ID of the subscription item to transition | 
 **priceTransitionRequest** | [**PriceTransitionRequest**](PriceTransitionRequest.md)| Parameters for the price transition | 

### Return type

[**CommercePriceTransitionResponse**](CommercePriceTransitionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **extendBillingSubscriptionItemFreeTrial**
> SchemasCommerceSubscriptionItem extendBillingSubscriptionItemFreeTrial(subscriptionItemId, extendFreeTrialRequest)

Extend free trial for a subscription item

Extends the free trial period for a specific subscription item to the specified timestamp. The subscription item must be currently in a free trial period, and the plan must support free trials. The timestamp must be in the future and not more than 365 days from the end of the current trial period This operation is idempotent - repeated requests with the same timestamp will not change the trial period.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final subscriptionItemId = subscriptionItemId_example; // String | The ID of the subscription item to extend the free trial for
final extendFreeTrialRequest = ExtendFreeTrialRequest(); // ExtendFreeTrialRequest | Parameters for extending the free trial

try {
    final result = api_instance.extendBillingSubscriptionItemFreeTrial(subscriptionItemId, extendFreeTrialRequest);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->extendBillingSubscriptionItemFreeTrial: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscriptionItemId** | **String**| The ID of the subscription item to extend the free trial for | 
 **extendFreeTrialRequest** | [**ExtendFreeTrialRequest**](ExtendFreeTrialRequest.md)| Parameters for extending the free trial | 

### Return type

[**SchemasCommerceSubscriptionItem**](SchemasCommerceSubscriptionItem.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBillingPriceList**
> PaginatedBillingPriceResponse getBillingPriceList(paginated, limit, offset, planId)

List all billing prices

Returns a list of all prices for the instance. The prices are returned sorted by amount ascending, then by creation date descending. This includes both default and custom prices. Pagination is supported.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
final planId = planId_example; // String | Filter prices by plan ID

try {
    final result = api_instance.getBillingPriceList(paginated, limit, offset, planId);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->getBillingPriceList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]
 **planId** | **String**| Filter prices by plan ID | [optional] 

### Return type

[**PaginatedBillingPriceResponse**](PaginatedBillingPriceResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBillingStatement**
> BillingStatement getBillingStatement(statementID)

Retrieve a billing statement

Retrieves the details of a billing statement.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final statementID = statementID_example; // String | The ID of the statement to retrieve.

try {
    final result = api_instance.getBillingStatement(statementID);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->getBillingStatement: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **statementID** | **String**| The ID of the statement to retrieve. | 

### Return type

[**BillingStatement**](BillingStatement.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBillingStatementList**
> PaginatedBillingStatementResponse getBillingStatementList(paginated, limit, offset)

List all billing statements

Returns a list of all billing statements for the instance. The statements are returned sorted by creation date, with the newest statements appearing first. Pagination is supported.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.getBillingStatementList(paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->getBillingStatementList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**PaginatedBillingStatementResponse**](PaginatedBillingStatementResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBillingStatementPaymentAttempts**
> PaginatedBillingPaymentAttemptResponse getBillingStatementPaymentAttempts(statementID, paginated, limit, offset)

List payment attempts for a billing statement

Returns a list of all payment attempts for a specific billing statement. The payment attempts are returned sorted by creation date, with the newest payment attempts appearing first. Pagination is supported.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final statementID = statementID_example; // String | The ID of the statement to retrieve payment attempts for.
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.

try {
    final result = api_instance.getBillingStatementPaymentAttempts(statementID, paginated, limit, offset);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->getBillingStatementPaymentAttempts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **statementID** | **String**| The ID of the statement to retrieve payment attempts for. | 
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]

### Return type

[**PaginatedBillingPaymentAttemptResponse**](PaginatedBillingPaymentAttemptResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCommercePlanList**
> PaginatedCommercePlanResponse getCommercePlanList(paginated, limit, offset, payerType)

List all billing plans

Returns a list of all billing plans for the instance. The plans are returned sorted by creation date, with the newest plans appearing first. This includes both free and paid plans. Pagination is supported.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
final payerType = payerType_example; // String | Filter plans by payer type

try {
    final result = api_instance.getCommercePlanList(paginated, limit, offset, payerType);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->getCommercePlanList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]
 **payerType** | **String**| Filter plans by payer type | [optional] 

### Return type

[**PaginatedCommercePlanResponse**](PaginatedCommercePlanResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCommerceSubscriptionItemList**
> PaginatedCommerceSubscriptionItemResponse getCommerceSubscriptionItemList(paginated, limit, offset, status, payerType, planId, includeFree, query)

List all subscription items

Returns a list of all subscription items for the instance. The subscription items are returned sorted by creation date, with the newest appearing first. This includes subscriptions for both users and organizations. Pagination is supported.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final paginated = true; // bool | Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
final limit = 56; // int | Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
final offset = 56; // int | Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
final status = status_example; // String | Filter subscription items by status
final payerType = payerType_example; // String | Filter subscription items by payer type
final planId = planId_example; // String | Filter subscription items by plan ID
final includeFree = true; // bool | Whether to include free plan subscription items
final query = query_example; // String | Search query to filter subscription items

try {
    final result = api_instance.getCommerceSubscriptionItemList(paginated, limit, offset, status, payerType, planId, includeFree, query);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->getCommerceSubscriptionItemList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginated** | **bool**| Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated. | [optional] 
 **limit** | **int**| Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`. | [optional] [default to 10]
 **offset** | **int**| Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`. | [optional] [default to 0]
 **status** | **String**| Filter subscription items by status | [optional] 
 **payerType** | **String**| Filter subscription items by payer type | [optional] 
 **planId** | **String**| Filter subscription items by plan ID | [optional] 
 **includeFree** | **bool**| Whether to include free plan subscription items | [optional] [default to false]
 **query** | **String**| Search query to filter subscription items | [optional] 

### Return type

[**PaginatedCommerceSubscriptionItemResponse**](PaginatedCommerceSubscriptionItemResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizationBillingSubscription_0**
> CommerceSubscription getOrganizationBillingSubscription_0(organizationId)

Retrieve an organization's billing subscription

Retrieves the billing subscription for the specified organization. This includes subscription details, active plans, billing information, and payment status. The subscription contains subscription items which represent the individual plans the organization is subscribed to.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final organizationId = organizationId_example; // String | The ID of the organization whose subscription to retrieve

try {
    final result = api_instance.getOrganizationBillingSubscription_0(organizationId);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->getOrganizationBillingSubscription_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **String**| The ID of the organization whose subscription to retrieve | 

### Return type

[**CommerceSubscription**](CommerceSubscription.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserBillingSubscription_0**
> CommerceSubscription getUserBillingSubscription_0(userId)

Retrieve a user's billing subscription

Retrieves the billing subscription for the specified user. This includes subscription details, active plans, billing information, and payment status. The subscription contains subscription items which represent the individual plans the user is subscribed to.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BillingApi();
final userId = userId_example; // String | The ID of the user whose subscription to retrieve

try {
    final result = api_instance.getUserBillingSubscription_0(userId);
    print(result);
} catch (e) {
    print('Exception when calling BillingApi->getUserBillingSubscription_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| The ID of the user whose subscription to retrieve | 

### Return type

[**CommerceSubscription**](CommerceSubscription.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

