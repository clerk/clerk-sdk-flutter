# openapi.model.CommercePlan

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** | Unique identifier for the plan. | 
**name** | **String** | The name of the plan. | 
**fee** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | 
**annualMonthlyFee** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | 
**annualFee** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) |  | 
**description** | **String** | The description of the plan. | 
**productId** | **String** | The ID of the product this plan belongs to. | 
**isDefault** | **bool** | Whether this is the default plan. | 
**isRecurring** | **bool** | Whether this is a recurring plan. | 
**publiclyVisible** | **bool** | Whether this plan is publicly visible. | 
**hasBaseFee** | **bool** | Whether this plan has a base fee. | 
**forPayerType** | **String** | The payer type this plan is designed for. | 
**slug** | **String** | The URL-friendly slug for the plan. | 
**avatarUrl** | **String** | The URL of the plan's avatar image. | 
**features** | [**List<FeatureResponse>**](FeatureResponse.md) | The features included in this plan. | [optional] [default to const []]
**freeTrialEnabled** | **bool** | Whether free trial is enabled for this plan. | 
**freeTrialDays** | **int** | Number of free trial days for this plan. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


