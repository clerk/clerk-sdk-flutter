# openapi.model.CreateBillingPriceRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**planId** | **String** | The ID of the plan this price belongs to. | 
**currency** | **String** | The currency code (e.g., \"USD\"). Defaults to USD. | [optional] [default to 'USD']
**amount** | **int** | The amount in cents for the price. Must be at least $1 (100 cents). | 
**annualMonthlyAmount** | **int** | The monthly amount in cents when billed annually. Optional. | [optional] 
**description** | **String** | An optional description for this custom price. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


