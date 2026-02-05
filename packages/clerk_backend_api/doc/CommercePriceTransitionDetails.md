# openapi.model.CommercePriceTransitionDetails

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**previousPlan** | [**SchemasCommercePlan**](SchemasCommercePlan.md) |  | 
**previousPrice** | [**BillingPriceResponse**](BillingPriceResponse.md) |  | 
**effectiveAt** | **int** | Unix timestamp (milliseconds) when the new price takes effect. | 
**effectiveMode** | **String** | When the new price takes effect. | 
**nextBillingDate** | **int** | Unix timestamp (milliseconds) for the next billing date. | [optional] 
**chargedImmediately** | **bool** | Whether an immediate charge was made. | 
**immediateCharge** | [**CommerceMoneyResponse**](CommerceMoneyResponse.md) | Amount charged immediately, if any. | [optional] 
**previousSubscriptionItemStatus** | **String** | The status of the previous subscription item after transition. | 
**previousSubscriptionItemId** | **String** | The ID of the previous subscription item. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


