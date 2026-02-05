# openapi.model.BillingPriceResponse

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** | Unique identifier for the price. | 
**planId** | **String** | Unique identifier for the associated plan. | 
**instanceId** | **String** | Unique identifier for the instance. | 
**currency** | **String** | The currency code (e.g., \"USD\"). | 
**currencySymbol** | **String** | The currency symbol (e.g., \"$\"). | 
**amount** | **int** | The amount in cents for the price. | 
**annualMonthlyAmount** | **int** | The monthly amount in cents when billed annually. | 
**fee** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | 
**annualMonthlyFee** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | 
**description** | **String** | The description of the price. | [optional] 
**createdAt** | **int** | Unix timestamp (milliseconds) of creation. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


