# openapi.model.CommerceSubscription

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** | Unique identifier for the commerce subscription. | 
**instanceId** | **String** | The ID of the instance this subscription belongs to. | 
**status** | **String** | The current status of the subscription. | 
**payerId** | **String** | The ID of the payer for this subscription. | 
**createdAt** | **int** | Unix timestamp (milliseconds) of creation. | 
**updatedAt** | **int** | Unix timestamp (milliseconds) of last update. | 
**activeAt** | **int** | Unix timestamp (milliseconds) when the subscription became active. | 
**pastDueAt** | **int** | Unix timestamp (milliseconds) when the subscription became past due. | 
**subscriptionItems** | [**List<CommerceSubscriptionItem>**](CommerceSubscriptionItem.md) | Array of subscription items in this subscription. | [default to const []]
**nextPayment** | [**CommerceSubscriptionNextPayment**](CommerceSubscriptionNextPayment.md) |  | [optional] 
**eligibleForFreeTrial** | **bool** | Whether the payer is eligible for a free trial. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


