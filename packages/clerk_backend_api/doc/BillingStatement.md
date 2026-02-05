# openapi.model.BillingStatement

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**id** | **String** | Unique identifier for the billing statement. | 
**instanceId** | **String** | The ID of the instance this statement belongs to. | 
**timestamp** | **int** | Unix timestamp (in milliseconds) when the statement was created. | 
**payer** | [**CommercePayerResponse**](CommercePayerResponse.md) |  | 
**status** | **String** | The current status of the statement. | 
**totals** | [**BillingStatementTotals**](BillingStatementTotals.md) |  | 
**groups** | [**List<BillingStatementGroupsInner>**](BillingStatementGroupsInner.md) | Array of statement groups. | [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


