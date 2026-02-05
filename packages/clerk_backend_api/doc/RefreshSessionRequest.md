# openapi.model.RefreshSessionRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**expiredToken** | **String** | The JWT that is sent via the `__session` cookie from your frontend. Note: this JWT must be associated with the supplied session ID. | 
**refreshToken** | **String** | The refresh token from the `__refresh` cookie set via FAPI's handshake flow. | 
**requestOrigin** | **String** | The origin of the request. | 
**requestHeaders** | [**Map<String, Object>**](Object.md) | The headers of the request. | [optional] [default to const {}]
**format** | **String** | The format of the response. | [optional] [default to 'token']
**requestOriginatingIp** | **String** | The IP address of the request. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


