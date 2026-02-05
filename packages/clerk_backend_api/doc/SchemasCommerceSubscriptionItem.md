# openapi.model.SchemasCommerceSubscriptionItem

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
**credit** | [**CommerceSubscriptionCreditResponse**](CommerceSubscriptionCreditResponse.md) | Credit information (only available in PaymentAttempt events). | [optional] 
**planId** | **String** | Unique identifier for the associated plan. | 
**priceId** | **String** | Unique identifier for the associated price | [optional] 
**plan** | [**SchemasCommercePlan**](SchemasCommercePlan.md) | The associated commerce plan. | 
**planPeriod** | **String** | The billing period for this subscription. | 
**paymentSourceId** | **String** | Unique identifier for the payment source. | 
**paymentSource** | [**CommercePaymentSourceResponse**](CommercePaymentSourceResponse.md) | The payment source associated with this subscription. | [optional] 
**lifetimePaid** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) | Total amount paid over the lifetime of this subscription. | [optional] 
**amount** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) | Current amount for this subscription. | [optional] 
**nextInvoice** | [**CommerceSubscriptionItemNextPaymentResponse**](CommerceSubscriptionItemNextPaymentResponse.md) | Information about the next invoice. | [optional] 
**nextPayment** | [**CommerceSubscriptionItemNextPaymentResponse**](CommerceSubscriptionItemNextPaymentResponse.md) | Information about the next payment. | [optional] 
**payerId** | **String** | Unique identifier for the payer. | 
**payer** | [**SchemasCommercePayerResponse**](SchemasCommercePayerResponse.md) | The payer associated with this subscription. | [optional] 
**isFreeTrial** | **bool** | Whether this subscription is currently on a free trial. | 
**periodStart** | **int** | Unix timestamp (in milliseconds) when the current period started. | [optional] 
**periodEnd** | **int** | Unix timestamp (in milliseconds) when the current period ends. | [optional] 
**prorationDate** | **String** | Date used for proration calculations. | 
**canceledAt** | **int** | Unix timestamp (in milliseconds) when the subscription was canceled. | [optional] 
**pastDueAt** | **int** | Unix timestamp (in milliseconds) when the subscription became past due. | [optional] 
**endedAt** | **int** | Unix timestamp (in milliseconds) when the subscription ended. | [optional] 
**createdAt** | **int** | Unix timestamp (in milliseconds) when the subscription was created. | 
**updatedAt** | **int** | Unix timestamp (in milliseconds) when the subscription was last updated. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


