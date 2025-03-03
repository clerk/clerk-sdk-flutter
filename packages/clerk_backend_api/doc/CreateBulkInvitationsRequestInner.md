# clerk_backend_api.model.CreateBulkInvitationsRequestInner

## Load the model package
```dart
import 'package:clerk_backend_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**emailAddress** | **String** | The email address the invitation will be sent to | 
**publicMetadata** | [**Map<String, Object>**](Object.md) | Metadata that will be attached to the newly created invitation. The value of this property should be a well-formed JSON object. Once the user accepts the invitation and signs up, these metadata will end up in the user's public metadata. | [optional] [default to const {}]
**redirectUrl** | **String** | The URL where the user is redirected upon visiting the invitation link, where they can accept the invitation. Required if you have implemented a [custom flow for handling application invitations](/docs/custom-flows/invitations). | [optional] 
**notify** | **bool** | Optional flag which denotes whether an email invitation should be sent to the given email address. Defaults to true. | [optional] [default to true]
**ignoreExisting** | **bool** | Whether an invitation should be created if there is already an existing invitation for this email address, or it's claimed by another user. | [optional] [default to false]
**expiresInDays** | **int** | The number of days the invitation will be valid for. By default, the invitation expires after 30 days. | [optional] 
**templateSlug** | **String** | The slug of the email template to use for the invitation email. | [optional] [default to 'invitation']

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


