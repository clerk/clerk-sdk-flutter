# openapi.model.SchemasCommercePlan

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** | Unique identifier for the commerce plan. | 
**name** | **String** | The name of the commerce plan. | 
**fee** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | 
**annualMonthlyFee** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | 
**annualFee** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | 
**amount** | **int** | The amount in cents for the plan. | 
**amountFormatted** | **String** | The formatted amount as a string (e.g., \"$49.99\"). | 
**annualMonthlyAmount** | **int** | The monthly amount in cents when billed annually. | 
**annualMonthlyAmountFormatted** | **String** | The formatted annual monthly amount as a string. | 
**annualAmount** | **int** | The total annual amount in cents. | 
**annualAmountFormatted** | **String** | The formatted annual amount as a string. | 
**currencySymbol** | **String** | The currency symbol (e.g., \"$\"). | 
**currency** | **String** | The currency code (e.g., \"USD\"). | 
**description** | **String** | The description of the commerce plan. | 
**productId** | **String** | The ID of the product this plan belongs to. | 
**isDefault** | **bool** | Whether this is the default plan. | 
**isRecurring** | **bool** | Whether this is a recurring plan. | 
**publiclyVisible** | **bool** | Whether this plan is publicly visible. | 
**hasBaseFee** | **bool** | Whether this plan has a base fee. | 
**payerType** | **List<String>** | The types of payers that can use this plan. | [default to const []]
**forPayerType** | **String** | The payer type this plan is designed for. | 
**slug** | **String** | The URL-friendly slug for the plan. | 
**avatarUrl** | **String** | The URL of the plan's avatar image. | 
**period** | **String** | The billing period for the plan. | [optional] 
**interval** | **int** | The billing interval. | [optional] 
**features** | [**List<SchemasFeatureResponse>**](SchemasFeatureResponse.md) | The features included in this plan. | [default to const []]
**freeTrialEnabled** | **bool** | Whether free trial is enabled for this plan. | [optional] 
**freeTrialDays** | **int** | Number of free trial days for this plan. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


