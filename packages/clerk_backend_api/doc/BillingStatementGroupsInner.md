# openapi.model.BillingStatementGroupsInner

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** | String representing the object's type. Objects of the same type share the same value. | 
**timestamp** | **int** | Unix timestamp (in milliseconds) of the date the group's payment attempts were created | 
**items** | [**List<BillingPaymentAttempt>**](BillingPaymentAttempt.md) | The payment attempts included in the group | [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


