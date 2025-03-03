# clerk_backend_api.model.UpdateInstanceAuthConfigRequest

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**restrictedToAllowlist** | **bool** | Whether sign up is restricted to email addresses, phone numbers and usernames that are on the allowlist. | [optional] [default to false]
**fromEmailAddress** | **String** | The local part of the email address from which authentication-related emails (e.g. OTP code, magic links) will be sent. Only alphanumeric values are allowed. Note that this value should contain only the local part of the address (e.g. `foo` for `foo@example.com`). | [optional] 
**progressiveSignUp** | **bool** | Enable the Progressive Sign Up algorithm. Refer to the [docs](https://clerk.com/docs/upgrade-guides/progressive-sign-up) for more info. | [optional] 
**enhancedEmailDeliverability** | **bool** | The \"enhanced_email_deliverability\" feature will send emails from \"verifications@clerk.dev\" instead of your domain. This can be helpful if you do not have a high domain reputation. | [optional] 
**testMode** | **bool** | Toggles test mode for this instance, allowing the use of test email addresses and phone numbers. Defaults to true for development instances. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


