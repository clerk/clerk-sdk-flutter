# openapi.model.UpdateInstanceRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**testMode** | **bool** | Toggles test mode for this instance, allowing the use of test email addresses and phone numbers. Defaults to true for development instances. | [optional] 
**hibp** | **bool** | Whether the instance should be using the HIBP service to check passwords for breaches | [optional] 
**supportEmail** | **String** |  | [optional] 
**clerkJsVersion** | **String** |  | [optional] 
**developmentOrigin** | **String** |  | [optional] 
**allowedOrigins** | **List<String>** | For browser-like stacks such as browser extensions, Electron (not officially supported), or Capacitor.js (not officially supported), the instance allowed origins need to be updated with the request origin value. For Chrome extensions popup, background, or service worker pages, the origin is chrome-extension://extension_uuid. For Electron apps the default origin is http://localhost:3000. For Capacitor, the origin is capacitor://localhost. | [optional] [default to const []]
**cookielessDev** | **bool** | Whether the instance should operate in cookieless development mode (i.e. without third-party cookies). Deprecated: Please use `url_based_session_syncing` instead. | [optional] 
**urlBasedSessionSyncing** | **bool** | Whether the instance should use URL-based session syncing in development mode (i.e. without third-party cookies). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


