# openapi.model.CommerceSubscriptionItem

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** | Unique identifier for the subscription item. | 
**instanceId** | **String** | Unique identifier for the Clerk instance. | 
**status** | **String** | Current status of the subscription item. | 
**credit** | [**CommerceSubscriptionCreditResponse**](CommerceSubscriptionCreditResponse.md) |  | [optional] 
**planId** | **String** | Unique identifier for the associated plan. | 
**priceId** | **String** | Unique identifier for the associated price | [optional] 
**plan** | [**CommercePlan**](CommercePlan.md) | The associated plan. | [optional] 
**planPeriod** | **String** | The billing period for this subscription item. | 
**paymentMethod** | [**CommercePaymentMethodResponse**](CommercePaymentMethodResponse.md) |  | [optional] 
**lifetimePaid** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | [optional] 
**nextPayment** | [**CommerceSubscriptionItemNextPaymentResponse**](CommerceSubscriptionItemNextPaymentResponse.md) | Information about the next payment. | [optional] 
**payerId** | **String** | Unique identifier for the payer. | 
**payer** | [**CommercePayerResponse**](CommercePayerResponse.md) |  | [optional] 
**isFreeTrial** | **bool** | Whether this subscription item includes a free trial. | 
**periodStart** | **int** | Unix timestamp (in milliseconds) when the current period started. | 
**periodEnd** | **int** | Unix timestamp (in milliseconds) when the current period ends. | 
**prorationDate** | [**DateTime**](DateTime.md) | The day the subscription item was prorated from. Only available in some responses. | [optional] 
**canceledAt** | **int** | Unix timestamp (in milliseconds) when the subscription item was canceled. | 
**pastDueAt** | **int** | Unix timestamp (in milliseconds) when the subscription item became past due. | 
**endedAt** | **int** | Unix timestamp (in milliseconds) when the subscription item ended. | 
**createdAt** | **int** | Unix timestamp (in milliseconds) when the subscription item was created. | [optional] 
**updatedAt** | **int** | Unix timestamp (in milliseconds) when the subscription item was last updated. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


