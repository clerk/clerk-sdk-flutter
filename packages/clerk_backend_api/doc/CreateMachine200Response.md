# openapi.model.CreateMachine200Response

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** | Unique identifier for the machine. | 
**name** | **String** | The name of the machine. | 
**instanceId** | **String** | The ID of the instance this machine belongs to. | 
**createdAt** | **int** | Unix timestamp of creation. | 
**updatedAt** | **int** | Unix timestamp of last update. | 
**defaultTokenTtl** | **int** | The default time-to-live (TTL) in seconds for tokens created by this machine. | [optional] [default to 3600]
**scopedMachines** | [**List<MachineWithoutScopedMachines>**](MachineWithoutScopedMachines.md) | Array of machines this machine has access to. | [default to const []]
**secretKey** | **String** | The secret key for the machine, only returned upon creation. | [readonly] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


