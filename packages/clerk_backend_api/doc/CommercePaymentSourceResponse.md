# openapi.model.CommercePaymentSourceResponse

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** | Unique identifier for the payment source. | 
**payerId** | **String** | Unique identifier for the payer. | 
**paymentMethod** | **String** | The payment method type. | 
**isDefault** | **bool** | Whether this is the default payment source for the payer. | [optional] 
**gateway** | **String** | The payment gateway. | 
**gatewayExternalId** | **String** | External ID in the payment gateway. | 
**gatewayExternalAccountId** | **String** | External account ID in the payment gateway. | [optional] 
**last4** | **String** | Last 4 digits of the card (for card payment sources). | 
**status** | **String** | Status of the payment source. | 
**walletType** | **String** | Type of wallet (if applicable). | 
**cardType** | **String** | Type of card (if applicable). | 
**expiryYear** | **int** | Card expiration year (for card payment sources). | [optional] 
**expiryMonth** | **int** | Card expiration month (for card payment sources). | [optional] 
**createdAt** | **int** | Unix timestamp (in milliseconds) when the payment source was created. | 
**updatedAt** | **int** | Unix timestamp (in milliseconds) when the payment source was last updated. | 
**isRemovable** | **bool** | Whether this payment source can be removed. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


