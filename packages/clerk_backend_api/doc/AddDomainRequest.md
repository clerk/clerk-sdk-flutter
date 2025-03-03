# clerk_backend_api.model.AddDomainRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The new domain name. Can contain the port for development instances. | 
**isSatellite** | **bool** | Marks the new domain as satellite. Only `true` is accepted at the moment. | 
**proxyUrl** | **String** | The full URL of the proxy which will forward requests to the Clerk Frontend API for this domain. Applicable only to production instances. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


