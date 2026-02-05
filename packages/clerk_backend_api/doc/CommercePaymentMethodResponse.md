# openapi.model.CommercePaymentMethodResponse

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** | Unique identifier for the payment method. | 
**payerId** | **String** | Unique identifier for the payer. | 
**paymentType** | **String** | The payment method type. | 
**isDefault** | **bool** | Whether this is the default payment method for the payer. | [optional] 
**gateway** | **String** | The payment gateway. | 
**gatewayExternalId** | **String** | External ID in the payment gateway. | 
**gatewayExternalAccountId** | **String** | External account ID in the payment gateway. | 
**last4** | **String** | Last 4 digits of the card (for card payment methods). | 
**status** | **String** | Status of the payment method. | 
**walletType** | **String** | Type of wallet (if applicable). | [optional] 
**cardType** | **String** | Type of card (if applicable). | 
**expiryYear** | **int** | Card expiration year (for card payment methods). | [optional] 
**expiryMonth** | **int** | Card expiration month (for card payment methods). | [optional] 
**createdAt** | **int** | Unix timestamp (in milliseconds) when the payment method was created. | [optional] 
**updatedAt** | **int** | Unix timestamp (in milliseconds) when the payment method was last updated. | [optional] 
**isRemovable** | **bool** | Whether this payment method can be removed. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


