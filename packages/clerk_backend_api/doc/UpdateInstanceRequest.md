# clerk_backend_api.model.UpdateInstanceRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**testMode** | **bool** | Toggles test mode for this instance, allowing the use of test email addresses and phone numbers. Defaults to true for development instances. | [optional] 
**hibp** | **bool** | Whether the instance should be using the HIBP service to check passwords for breaches | [optional] 
**enhancedEmailDeliverability** | **bool** | The \"enhanced_email_deliverability\" feature will send emails from \"verifications@clerk.dev\" instead of your domain. This can be helpful if you do not have a high domain reputation. | [optional] 
**supportEmail** | **String** |  | [optional] 
**clerkJsVersion** | **String** |  | [optional] 
**developmentOrigin** | **String** |  | [optional] 
**allowedOrigins** | **List<String>** | For browser-like stacks such as browser extensions, Electron, or Capacitor.js the instance allowed origins need to be updated with the request origin value. For Chrome extensions popup, background, or service worker pages the origin is chrome-extension://extension_uiid. For Electron apps the default origin is http://localhost:3000. For Capacitor, the origin is capacitor://localhost. | [optional] [default to const []]
**cookielessDev** | **bool** | Whether the instance should operate in cookieless development mode (i.e. without third-party cookies). Deprecated: Please use `url_based_session_syncing` instead. | [optional] 
**urlBasedSessionSyncing** | **bool** | Whether the instance should use URL-based session syncing in development mode (i.e. without third-party cookies). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


