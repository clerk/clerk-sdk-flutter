# clerk_backend_api.model.Domain

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**object** | **String** |  | 
**id** | **String** |  | 
**name** | **String** |  | 
**isSatellite** | **bool** |  | 
**frontendApiUrl** | **String** |  | 
**accountsPortalUrl** | **String** | Null for satellite domains.  | [optional] 
**proxyUrl** | **String** |  | [optional] 
**developmentOrigin** | **String** |  | 
**cnameTargets** | [**List<CNameTarget>**](CNameTarget.md) |  | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


