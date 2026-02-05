# openapi.model.BillingPaymentAttempt

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** | Unique identifier for the payment attempt. | 
**paymentId** | **String** | Unique identifier for the associated payment. | 
**instanceId** | **String** | The ID of the instance this payment attempt belongs to. | 
**chargeType** | **String** | Type of charge for this payment attempt. | 
**payeeId** | **String** | Unique identifier for the payee. | 
**payee** | [**Object**](.md) | The payee associated with this payment attempt. | 
**payerId** | **String** | Unique identifier for the payer. | 
**payer** | [**CommercePayerResponse**](CommercePayerResponse.md) |  | 
**subscriptionItemId** | **String** | Unique identifier for the associated subscription item. | [optional] 
**subscriptionItem** | [**Object**](.md) | The subscription item associated with this payment attempt. | [optional] 
**amount** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | 
**paymentMethodId** | **String** | Unique identifier for the payment method. | 
**paymentMethod** | [**CommercePaymentMethodResponse**](CommercePaymentMethodResponse.md) |  | 
**statementId** | **String** | Unique identifier for the associated statement. | 
**gatewayExternalId** | **String** | External identifier from the payment gateway. | 
**gatewayExternalUrl** | **String** | External URL from the payment gateway. | 
**status** | **String** | The current status of the payment attempt. | 
**paidAt** | **int** | Unix timestamp (in milliseconds) when the payment was completed. | 
**failedAt** | **int** | Unix timestamp (in milliseconds) when the payment failed to be processed. | 
**createdAt** | **int** | Unix timestamp (in milliseconds) when the payment attempt was created. | 
**updatedAt** | **int** | Unix timestamp (in milliseconds) when the payment attempt was last updated. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


