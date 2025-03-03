//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UsersApi {
  UsersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Ban a user
  ///
  /// Marks the given user as banned, which means that all their sessions are revoked and they are not allowed to sign in again.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to ban
  Future<http.Response> banUserWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/ban'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Ban a user
  ///
  /// Marks the given user as banned, which means that all their sessions are revoked and they are not allowed to sign in again.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to ban
  Future<User?> banUser(
    String userId,
  ) async {
    final response = await banUserWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// Create a new user
  ///
  /// Creates a new user. Your user management settings determine how you should setup your user model.  Any email address and phone number created using this method will be marked as verified.  Note: If you are performing a migration, check out our guide on [zero downtime migrations](https://clerk.com/docs/deployments/migrate-overview).  A rate limit rule of 20 requests per 10 seconds is applied to this endpoint.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateUserRequest] createUserRequest (required):
  Future<http.Response> createUserWithHttpInfo(
    CreateUserRequest createUserRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users';

    // ignore: prefer_final_locals
    Object? postBody = createUserRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create a new user
  ///
  /// Creates a new user. Your user management settings determine how you should setup your user model.  Any email address and phone number created using this method will be marked as verified.  Note: If you are performing a migration, check out our guide on [zero downtime migrations](https://clerk.com/docs/deployments/migrate-overview).  A rate limit rule of 20 requests per 10 seconds is applied to this endpoint.
  ///
  /// Parameters:
  ///
  /// * [CreateUserRequest] createUserRequest (required):
  Future<User?> createUser(
    CreateUserRequest createUserRequest,
  ) async {
    final response = await createUserWithHttpInfo(
      createUserRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// Disable all user's Backup codes
  ///
  /// Disable all of a user's backup codes.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose backup codes are to be deleted.
  Future<http.Response> deleteBackupCodeWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/users/{user_id}/backup_code'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Disable all user's Backup codes
  ///
  /// Disable all of a user's backup codes.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose backup codes are to be deleted.
  Future<DisableMFA200Response?> deleteBackupCode(
    String userId,
  ) async {
    final response = await deleteBackupCodeWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'DisableMFA200Response',
      ) as DisableMFA200Response;
    }
    return null;
  }

  /// Delete External Account
  ///
  /// Delete an external account by ID.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user's external account
  ///
  /// * [String] externalAccountId (required):
  ///   The ID of the external account to delete
  Future<http.Response> deleteExternalAccountWithHttpInfo(
    String userId,
    String externalAccountId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/external_accounts/{external_account_id}'
        .replaceAll('{user_id}', userId)
        .replaceAll('{external_account_id}', externalAccountId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete External Account
  ///
  /// Delete an external account by ID.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user's external account
  ///
  /// * [String] externalAccountId (required):
  ///   The ID of the external account to delete
  Future<DeletedObject?> deleteExternalAccount(
    String userId,
    String externalAccountId,
  ) async {
    final response = await deleteExternalAccountWithHttpInfo(
      userId,
      externalAccountId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'DeletedObject',
      ) as DeletedObject;
    }
    return null;
  }

  /// Delete all the user's TOTPs
  ///
  /// Deletes all of the user's TOTPs.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose TOTPs are to be deleted
  Future<http.Response> deleteTOTPWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/totp'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete all the user's TOTPs
  ///
  /// Deletes all of the user's TOTPs.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose TOTPs are to be deleted
  Future<DisableMFA200Response?> deleteTOTP(
    String userId,
  ) async {
    final response = await deleteTOTPWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'DisableMFA200Response',
      ) as DisableMFA200Response;
    }
    return null;
  }

  /// Delete a user
  ///
  /// Delete the specified user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to delete
  Future<http.Response> deleteUserWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete a user
  ///
  /// Delete the specified user
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to delete
  Future<DeletedObject?> deleteUser(
    String userId,
  ) async {
    final response = await deleteUserWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'DeletedObject',
      ) as DeletedObject;
    }
    return null;
  }

  /// Delete user profile image
  ///
  /// Delete a user's profile image
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to delete the profile image for
  Future<http.Response> deleteUserProfileImageWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/users/{user_id}/profile_image'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete user profile image
  ///
  /// Delete a user's profile image
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to delete the profile image for
  Future<User?> deleteUserProfileImage(
    String userId,
  ) async {
    final response = await deleteUserProfileImageWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// Disable a user's MFA methods
  ///
  /// Disable all of a user's MFA methods (e.g. OTP sent via SMS, TOTP on their authenticator app) at once.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose MFA methods are to be disabled
  Future<http.Response> disableMFAWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/mfa'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Disable a user's MFA methods
  ///
  /// Disable all of a user's MFA methods (e.g. OTP sent via SMS, TOTP on their authenticator app) at once.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose MFA methods are to be disabled
  Future<DisableMFA200Response?> disableMFA(
    String userId,
  ) async {
    final response = await disableMFAWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'DisableMFA200Response',
      ) as DisableMFA200Response;
    }
    return null;
  }

  /// Retrieve the OAuth access token of a user
  ///
  /// Fetch the corresponding OAuth access token for a user that has previously authenticated with a particular OAuth provider. For OAuth 2.0, if the access token has expired and we have a corresponding refresh token, the access token will be refreshed transparently the new one will be returned.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user for which to retrieve the OAuth access token
  ///
  /// * [String] provider (required):
  ///   The ID of the OAuth provider (e.g. `oauth_google`)
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> getOAuthAccessTokenWithHttpInfo(
    String userId,
    String provider, {
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/oauth_access_tokens/{provider}'
        .replaceAll('{user_id}', userId)
        .replaceAll('{provider}', provider);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (paginated != null) {
      queryParams.addAll(_queryParams('', 'paginated', paginated));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve the OAuth access token of a user
  ///
  /// Fetch the corresponding OAuth access token for a user that has previously authenticated with a particular OAuth provider. For OAuth 2.0, if the access token has expired and we have a corresponding refresh token, the access token will be refreshed transparently the new one will be returned.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user for which to retrieve the OAuth access token
  ///
  /// * [String] provider (required):
  ///   The ID of the OAuth provider (e.g. `oauth_google`)
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<List<GetOAuthAccessToken200ResponseInner>?> getOAuthAccessToken(
    String userId,
    String provider, {
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    final response = await getOAuthAccessTokenWithHttpInfo(
      userId,
      provider,
      paginated: paginated,
      limit: limit,
      offset: offset,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(
                  responseBody, 'List<GetOAuthAccessToken200ResponseInner>')
              as List)
          .cast<GetOAuthAccessToken200ResponseInner>()
          .toList(growable: false);
    }
    return null;
  }

  /// Retrieve a user
  ///
  /// Retrieve the details of a user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to retrieve
  Future<http.Response> getUserWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve a user
  ///
  /// Retrieve the details of a user
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to retrieve
  Future<User?> getUser(
    String userId,
  ) async {
    final response = await getUserWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// List all users
  ///
  /// Returns a list of all users. The users are returned sorted by creation date, with the newest users appearing first.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] emailAddress:
  ///   Returns users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored.
  ///
  /// * [List<String>] phoneNumber:
  ///   Returns users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored.
  ///
  /// * [List<String>] externalId:
  ///   Returns users with the specified external ids. For each external id, the `+` and `-` can be prepended to the id, which denote whether the respective external id should be included or excluded from the result set. Accepts up to 100 external ids. Any external ids not found are ignored.
  ///
  /// * [List<String>] username:
  ///   Returns users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored.
  ///
  /// * [List<String>] web3Wallet:
  ///   Returns users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored.
  ///
  /// * [List<String>] userId:
  ///   Returns users with the user ids specified. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective user id should be included or excluded from the result set. Accepts up to 100 user ids. Any user ids not found are ignored.
  ///
  /// * [List<String>] organizationId:
  ///   Returns users that have memberships to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids.
  ///
  /// * [String] query:
  ///   Returns users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well.
  ///
  /// * [String] emailAddressQuery:
  ///   Returns users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`.
  ///
  /// * [String] phoneNumberQuery:
  ///   Returns users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`.
  ///
  /// * [String] usernameQuery:
  ///   Returns users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`.
  ///
  /// * [String] nameQuery:
  ///   Returns users with names that match the given query, via case-insensitive partial match.
  ///
  /// * [bool] banned:
  ///   Returns users which are either banned (`banned=true`) or not banned (`banned=false`).
  ///
  /// * [int] lastActiveAtBefore:
  ///   Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23.
  ///
  /// * [int] lastActiveAtAfter:
  ///   Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23.
  ///
  /// * [int] lastActiveAtSince:
  ///   Returns users that had session activity since the given date. Example: use 1700690400000 to retrieve users that had session activity from 2023-11-23 until the current day. Deprecated in favor of `last_active_at_after`.
  ///
  /// * [int] createdAtBefore:
  ///   Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29.
  ///
  /// * [int] createdAtAfter:
  ///   Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] orderBy:
  ///   Allows to return users in a particular order. At the moment, you can order the returned users by their `created_at`,`updated_at`,`email_address`,`web3wallet`,`first_name`,`last_name`,`phone_number`,`username`,`last_active_at`,`last_sign_in_at`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want users to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. We only support one `order_by` parameter, and if multiple `order_by` parameters are provided, we will only keep the first one. For example, if you pass `order_by=username&order_by=created_at`, we will consider only the first `order_by` parameter, which is `username`. The `created_at` parameter will be ignored in this case.
  Future<http.Response> getUserListWithHttpInfo({
    List<String>? emailAddress,
    List<String>? phoneNumber,
    List<String>? externalId,
    List<String>? username,
    List<String>? web3Wallet,
    List<String>? userId,
    List<String>? organizationId,
    String? query,
    String? emailAddressQuery,
    String? phoneNumberQuery,
    String? usernameQuery,
    String? nameQuery,
    bool? banned,
    int? lastActiveAtBefore,
    int? lastActiveAtAfter,
    int? lastActiveAtSince,
    int? createdAtBefore,
    int? createdAtAfter,
    int? limit,
    int? offset,
    String? orderBy,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/users';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (emailAddress != null) {
      queryParams.addAll(_queryParams('multi', 'email_address', emailAddress));
    }
    if (phoneNumber != null) {
      queryParams.addAll(_queryParams('multi', 'phone_number', phoneNumber));
    }
    if (externalId != null) {
      queryParams.addAll(_queryParams('multi', 'external_id', externalId));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('multi', 'username', username));
    }
    if (web3Wallet != null) {
      queryParams.addAll(_queryParams('multi', 'web3_wallet', web3Wallet));
    }
    if (userId != null) {
      queryParams.addAll(_queryParams('multi', 'user_id', userId));
    }
    if (organizationId != null) {
      queryParams
          .addAll(_queryParams('multi', 'organization_id', organizationId));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (emailAddressQuery != null) {
      queryParams
          .addAll(_queryParams('', 'email_address_query', emailAddressQuery));
    }
    if (phoneNumberQuery != null) {
      queryParams
          .addAll(_queryParams('', 'phone_number_query', phoneNumberQuery));
    }
    if (usernameQuery != null) {
      queryParams.addAll(_queryParams('', 'username_query', usernameQuery));
    }
    if (nameQuery != null) {
      queryParams.addAll(_queryParams('', 'name_query', nameQuery));
    }
    if (banned != null) {
      queryParams.addAll(_queryParams('', 'banned', banned));
    }
    if (lastActiveAtBefore != null) {
      queryParams.addAll(
          _queryParams('', 'last_active_at_before', lastActiveAtBefore));
    }
    if (lastActiveAtAfter != null) {
      queryParams
          .addAll(_queryParams('', 'last_active_at_after', lastActiveAtAfter));
    }
    if (lastActiveAtSince != null) {
      queryParams
          .addAll(_queryParams('', 'last_active_at_since', lastActiveAtSince));
    }
    if (createdAtBefore != null) {
      queryParams
          .addAll(_queryParams('', 'created_at_before', createdAtBefore));
    }
    if (createdAtAfter != null) {
      queryParams.addAll(_queryParams('', 'created_at_after', createdAtAfter));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'order_by', orderBy));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all users
  ///
  /// Returns a list of all users. The users are returned sorted by creation date, with the newest users appearing first.
  ///
  /// Parameters:
  ///
  /// * [List<String>] emailAddress:
  ///   Returns users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored.
  ///
  /// * [List<String>] phoneNumber:
  ///   Returns users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored.
  ///
  /// * [List<String>] externalId:
  ///   Returns users with the specified external ids. For each external id, the `+` and `-` can be prepended to the id, which denote whether the respective external id should be included or excluded from the result set. Accepts up to 100 external ids. Any external ids not found are ignored.
  ///
  /// * [List<String>] username:
  ///   Returns users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored.
  ///
  /// * [List<String>] web3Wallet:
  ///   Returns users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored.
  ///
  /// * [List<String>] userId:
  ///   Returns users with the user ids specified. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective user id should be included or excluded from the result set. Accepts up to 100 user ids. Any user ids not found are ignored.
  ///
  /// * [List<String>] organizationId:
  ///   Returns users that have memberships to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids.
  ///
  /// * [String] query:
  ///   Returns users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well.
  ///
  /// * [String] emailAddressQuery:
  ///   Returns users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`.
  ///
  /// * [String] phoneNumberQuery:
  ///   Returns users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`.
  ///
  /// * [String] usernameQuery:
  ///   Returns users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`.
  ///
  /// * [String] nameQuery:
  ///   Returns users with names that match the given query, via case-insensitive partial match.
  ///
  /// * [bool] banned:
  ///   Returns users which are either banned (`banned=true`) or not banned (`banned=false`).
  ///
  /// * [int] lastActiveAtBefore:
  ///   Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23.
  ///
  /// * [int] lastActiveAtAfter:
  ///   Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23.
  ///
  /// * [int] lastActiveAtSince:
  ///   Returns users that had session activity since the given date. Example: use 1700690400000 to retrieve users that had session activity from 2023-11-23 until the current day. Deprecated in favor of `last_active_at_after`.
  ///
  /// * [int] createdAtBefore:
  ///   Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29.
  ///
  /// * [int] createdAtAfter:
  ///   Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] orderBy:
  ///   Allows to return users in a particular order. At the moment, you can order the returned users by their `created_at`,`updated_at`,`email_address`,`web3wallet`,`first_name`,`last_name`,`phone_number`,`username`,`last_active_at`,`last_sign_in_at`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want users to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. We only support one `order_by` parameter, and if multiple `order_by` parameters are provided, we will only keep the first one. For example, if you pass `order_by=username&order_by=created_at`, we will consider only the first `order_by` parameter, which is `username`. The `created_at` parameter will be ignored in this case.
  Future<List<User>?> getUserList({
    List<String>? emailAddress,
    List<String>? phoneNumber,
    List<String>? externalId,
    List<String>? username,
    List<String>? web3Wallet,
    List<String>? userId,
    List<String>? organizationId,
    String? query,
    String? emailAddressQuery,
    String? phoneNumberQuery,
    String? usernameQuery,
    String? nameQuery,
    bool? banned,
    int? lastActiveAtBefore,
    int? lastActiveAtAfter,
    int? lastActiveAtSince,
    int? createdAtBefore,
    int? createdAtAfter,
    int? limit,
    int? offset,
    String? orderBy,
  }) async {
    final response = await getUserListWithHttpInfo(
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      externalId: externalId,
      username: username,
      web3Wallet: web3Wallet,
      userId: userId,
      organizationId: organizationId,
      query: query,
      emailAddressQuery: emailAddressQuery,
      phoneNumberQuery: phoneNumberQuery,
      usernameQuery: usernameQuery,
      nameQuery: nameQuery,
      banned: banned,
      lastActiveAtBefore: lastActiveAtBefore,
      lastActiveAtAfter: lastActiveAtAfter,
      lastActiveAtSince: lastActiveAtSince,
      createdAtBefore: createdAtBefore,
      createdAtAfter: createdAtAfter,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<User>')
              as List)
          .cast<User>()
          .toList(growable: false);
    }
    return null;
  }

  /// Count users
  ///
  /// Returns a total count of all users that match the given filtering criteria.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] emailAddress:
  ///   Counts users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored.
  ///
  /// * [List<String>] phoneNumber:
  ///   Counts users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored.
  ///
  /// * [List<String>] externalId:
  ///   Counts users with the specified external ids. Accepts up to 100 external ids. Any external ids not found are ignored.
  ///
  /// * [List<String>] username:
  ///   Counts users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored.
  ///
  /// * [List<String>] web3Wallet:
  ///   Counts users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored.
  ///
  /// * [List<String>] userId:
  ///   Counts users with the user ids specified. Accepts up to 100 user ids. Any user ids not found are ignored.
  ///
  /// * [List<String>] organizationId:
  ///   Returns users that have memberships to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids.
  ///
  /// * [String] query:
  ///   Counts users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well.
  ///
  /// * [String] emailAddressQuery:
  ///   Counts users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`, and will be included in the resulting count.
  ///
  /// * [String] phoneNumberQuery:
  ///   Counts users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`, and will be included in the resulting count.
  ///
  /// * [String] usernameQuery:
  ///   Counts users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`, and will be included in the resulting count.
  ///
  /// * [String] nameQuery:
  ///   Returns users with names that match the given query, via case-insensitive partial match.
  ///
  /// * [bool] banned:
  ///   Counts users which are either banned (`banned=true`) or not banned (`banned=false`).
  ///
  /// * [int] lastActiveAtBefore:
  ///   Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23.
  ///
  /// * [int] lastActiveAtAfter:
  ///   Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23.
  ///
  /// * [int] lastActiveAtSince:
  ///   Returns users that had session activity since the given date. Example: use 1700690400000 to retrieve users that had session activity from 2023-11-23 until the current day. Deprecated in favor of `last_active_at_after`.
  ///
  /// * [int] createdAtBefore:
  ///   Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29.
  ///
  /// * [int] createdAtAfter:
  ///   Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29.
  Future<http.Response> getUsersCountWithHttpInfo({
    List<String>? emailAddress,
    List<String>? phoneNumber,
    List<String>? externalId,
    List<String>? username,
    List<String>? web3Wallet,
    List<String>? userId,
    List<String>? organizationId,
    String? query,
    String? emailAddressQuery,
    String? phoneNumberQuery,
    String? usernameQuery,
    String? nameQuery,
    bool? banned,
    int? lastActiveAtBefore,
    int? lastActiveAtAfter,
    int? lastActiveAtSince,
    int? createdAtBefore,
    int? createdAtAfter,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/users/count';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (emailAddress != null) {
      queryParams.addAll(_queryParams('multi', 'email_address', emailAddress));
    }
    if (phoneNumber != null) {
      queryParams.addAll(_queryParams('multi', 'phone_number', phoneNumber));
    }
    if (externalId != null) {
      queryParams.addAll(_queryParams('multi', 'external_id', externalId));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('multi', 'username', username));
    }
    if (web3Wallet != null) {
      queryParams.addAll(_queryParams('multi', 'web3_wallet', web3Wallet));
    }
    if (userId != null) {
      queryParams.addAll(_queryParams('multi', 'user_id', userId));
    }
    if (organizationId != null) {
      queryParams
          .addAll(_queryParams('multi', 'organization_id', organizationId));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (emailAddressQuery != null) {
      queryParams
          .addAll(_queryParams('', 'email_address_query', emailAddressQuery));
    }
    if (phoneNumberQuery != null) {
      queryParams
          .addAll(_queryParams('', 'phone_number_query', phoneNumberQuery));
    }
    if (usernameQuery != null) {
      queryParams.addAll(_queryParams('', 'username_query', usernameQuery));
    }
    if (nameQuery != null) {
      queryParams.addAll(_queryParams('', 'name_query', nameQuery));
    }
    if (banned != null) {
      queryParams.addAll(_queryParams('', 'banned', banned));
    }
    if (lastActiveAtBefore != null) {
      queryParams.addAll(
          _queryParams('', 'last_active_at_before', lastActiveAtBefore));
    }
    if (lastActiveAtAfter != null) {
      queryParams
          .addAll(_queryParams('', 'last_active_at_after', lastActiveAtAfter));
    }
    if (lastActiveAtSince != null) {
      queryParams
          .addAll(_queryParams('', 'last_active_at_since', lastActiveAtSince));
    }
    if (createdAtBefore != null) {
      queryParams
          .addAll(_queryParams('', 'created_at_before', createdAtBefore));
    }
    if (createdAtAfter != null) {
      queryParams.addAll(_queryParams('', 'created_at_after', createdAtAfter));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Count users
  ///
  /// Returns a total count of all users that match the given filtering criteria.
  ///
  /// Parameters:
  ///
  /// * [List<String>] emailAddress:
  ///   Counts users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored.
  ///
  /// * [List<String>] phoneNumber:
  ///   Counts users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored.
  ///
  /// * [List<String>] externalId:
  ///   Counts users with the specified external ids. Accepts up to 100 external ids. Any external ids not found are ignored.
  ///
  /// * [List<String>] username:
  ///   Counts users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored.
  ///
  /// * [List<String>] web3Wallet:
  ///   Counts users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored.
  ///
  /// * [List<String>] userId:
  ///   Counts users with the user ids specified. Accepts up to 100 user ids. Any user ids not found are ignored.
  ///
  /// * [List<String>] organizationId:
  ///   Returns users that have memberships to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids.
  ///
  /// * [String] query:
  ///   Counts users that match the given query. For possible matches, we check the email addresses, phone numbers, usernames, web3 wallets, user ids, first and last names. The query value doesn't need to match the exact value you are looking for, it is capable of partial matches as well.
  ///
  /// * [String] emailAddressQuery:
  ///   Counts users with emails that match the given query, via case-insensitive partial match. For example, `email_address_query=ello` will match a user with the email `HELLO@example.com`, and will be included in the resulting count.
  ///
  /// * [String] phoneNumberQuery:
  ///   Counts users with phone numbers that match the given query, via case-insensitive partial match. For example, `phone_number_query=555` will match a user with the phone number `+1555xxxxxxx`, and will be included in the resulting count.
  ///
  /// * [String] usernameQuery:
  ///   Counts users with usernames that match the given query, via case-insensitive partial match. For example, `username_query=CoolUser` will match a user with the username `SomeCoolUser`, and will be included in the resulting count.
  ///
  /// * [String] nameQuery:
  ///   Returns users with names that match the given query, via case-insensitive partial match.
  ///
  /// * [bool] banned:
  ///   Counts users which are either banned (`banned=true`) or not banned (`banned=false`).
  ///
  /// * [int] lastActiveAtBefore:
  ///   Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23.
  ///
  /// * [int] lastActiveAtAfter:
  ///   Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23.
  ///
  /// * [int] lastActiveAtSince:
  ///   Returns users that had session activity since the given date. Example: use 1700690400000 to retrieve users that had session activity from 2023-11-23 until the current day. Deprecated in favor of `last_active_at_after`.
  ///
  /// * [int] createdAtBefore:
  ///   Returns users who have been created before the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created before 2024-10-29.
  ///
  /// * [int] createdAtAfter:
  ///   Returns users who have been created after the given date (with millisecond precision). Example: use 1730160000000 to retrieve users who have been created after 2024-10-29.
  Future<TotalCount?> getUsersCount({
    List<String>? emailAddress,
    List<String>? phoneNumber,
    List<String>? externalId,
    List<String>? username,
    List<String>? web3Wallet,
    List<String>? userId,
    List<String>? organizationId,
    String? query,
    String? emailAddressQuery,
    String? phoneNumberQuery,
    String? usernameQuery,
    String? nameQuery,
    bool? banned,
    int? lastActiveAtBefore,
    int? lastActiveAtAfter,
    int? lastActiveAtSince,
    int? createdAtBefore,
    int? createdAtAfter,
  }) async {
    final response = await getUsersCountWithHttpInfo(
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      externalId: externalId,
      username: username,
      web3Wallet: web3Wallet,
      userId: userId,
      organizationId: organizationId,
      query: query,
      emailAddressQuery: emailAddressQuery,
      phoneNumberQuery: phoneNumberQuery,
      usernameQuery: usernameQuery,
      nameQuery: nameQuery,
      banned: banned,
      lastActiveAtBefore: lastActiveAtBefore,
      lastActiveAtAfter: lastActiveAtAfter,
      lastActiveAtSince: lastActiveAtSince,
      createdAtBefore: createdAtBefore,
      createdAtAfter: createdAtAfter,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'TotalCount',
      ) as TotalCount;
    }
    return null;
  }

  /// Lock a user
  ///
  /// Marks the given user as locked, which means they are not allowed to sign in again until the lock expires. Lock duration can be configured in the instance's restrictions settings.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to lock
  Future<http.Response> lockUserWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/lock'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Lock a user
  ///
  /// Marks the given user as locked, which means they are not allowed to sign in again until the lock expires. Lock duration can be configured in the instance's restrictions settings.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to lock
  Future<User?> lockUser(
    String userId,
  ) async {
    final response = await lockUserWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// Set user profile image
  ///
  /// Update a user's profile image
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to update the profile image for
  ///
  /// * [MultipartFile] file:
  Future<http.Response> setUserProfileImageWithHttpInfo(
    String userId, {
    http.MultipartFile? file,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/users/{user_id}/profile_image'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = http.MultipartRequest('POST', Uri.parse(path));
    if (file != null) {
      hasFields = true;
      mp.fields[r'file'] = file.field;
      mp.files.add(file);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Set user profile image
  ///
  /// Update a user's profile image
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to update the profile image for
  ///
  /// * [MultipartFile] file:
  Future<User?> setUserProfileImage(
    String userId, {
    http.MultipartFile? file,
  }) async {
    final response = await setUserProfileImageWithHttpInfo(
      userId,
      file: file,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// Unban a user
  ///
  /// Removes the ban mark from the given user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to unban
  Future<http.Response> unbanUserWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/unban'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Unban a user
  ///
  /// Removes the ban mark from the given user.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to unban
  Future<User?> unbanUser(
    String userId,
  ) async {
    final response = await unbanUserWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// Unlock a user
  ///
  /// Removes the lock from the given user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to unlock
  Future<http.Response> unlockUserWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/unlock'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Unlock a user
  ///
  /// Removes the lock from the given user.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to unlock
  Future<User?> unlockUser(
    String userId,
  ) async {
    final response = await unlockUserWithHttpInfo(
      userId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// Update a user
  ///
  /// Update a user's attributes.  You can set the user's primary contact identifiers (email address and phone numbers) by updating the `primary_email_address_id` and `primary_phone_number_id` attributes respectively. Both IDs should correspond to verified identifications that belong to the user.  You can remove a user's username by setting the username attribute to null or the blank string \"\". This is a destructive action; the identification will be deleted forever. Usernames can be removed only if they are optional in your instance settings and there's at least one other identifier which can be used for authentication.  This endpoint allows changing a user's password. When passing the `password` parameter directly you have two further options. You can ignore the password policy checks for your instance by setting the `skip_password_checks` parameter to `true`. You can also choose to sign the user out of all their active sessions on any device once the password is updated. Just set `sign_out_of_other_sessions` to `true`.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to update
  ///
  /// * [UpdateUserRequest] updateUserRequest (required):
  Future<http.Response> updateUserWithHttpInfo(
    String userId,
    UpdateUserRequest updateUserRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = updateUserRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update a user
  ///
  /// Update a user's attributes.  You can set the user's primary contact identifiers (email address and phone numbers) by updating the `primary_email_address_id` and `primary_phone_number_id` attributes respectively. Both IDs should correspond to verified identifications that belong to the user.  You can remove a user's username by setting the username attribute to null or the blank string \"\". This is a destructive action; the identification will be deleted forever. Usernames can be removed only if they are optional in your instance settings and there's at least one other identifier which can be used for authentication.  This endpoint allows changing a user's password. When passing the `password` parameter directly you have two further options. You can ignore the password policy checks for your instance by setting the `skip_password_checks` parameter to `true`. You can also choose to sign the user out of all their active sessions on any device once the password is updated. Just set `sign_out_of_other_sessions` to `true`.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user to update
  ///
  /// * [UpdateUserRequest] updateUserRequest (required):
  Future<User?> updateUser(
    String userId,
    UpdateUserRequest updateUserRequest,
  ) async {
    final response = await updateUserWithHttpInfo(
      userId,
      updateUserRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// Merge and update a user's metadata
  ///
  /// Update a user's metadata attributes by merging existing values with the provided parameters.  This endpoint behaves differently than the *Update a user* endpoint. Metadata values will not be replaced entirely. Instead, a deep merge will be performed. Deep means that any nested JSON objects will be merged as well.  You can remove metadata keys at any level by setting their value to `null`.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose metadata will be updated and merged
  ///
  /// * [UpdateUserMetadataRequest] updateUserMetadataRequest:
  Future<http.Response> updateUserMetadataWithHttpInfo(
    String userId, {
    UpdateUserMetadataRequest? updateUserMetadataRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/metadata'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = updateUserMetadataRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Merge and update a user's metadata
  ///
  /// Update a user's metadata attributes by merging existing values with the provided parameters.  This endpoint behaves differently than the *Update a user* endpoint. Metadata values will not be replaced entirely. Instead, a deep merge will be performed. Deep means that any nested JSON objects will be merged as well.  You can remove metadata keys at any level by setting their value to `null`.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose metadata will be updated and merged
  ///
  /// * [UpdateUserMetadataRequest] updateUserMetadataRequest:
  Future<User?> updateUserMetadata(
    String userId, {
    UpdateUserMetadataRequest? updateUserMetadataRequest,
  }) async {
    final response = await updateUserMetadataWithHttpInfo(
      userId,
      updateUserMetadataRequest: updateUserMetadataRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'User',
      ) as User;
    }
    return null;
  }

  /// Delete a user passkey
  ///
  /// Delete the passkey identification for a given user and notify them through email.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user that owns the passkey identity
  ///
  /// * [String] passkeyIdentificationId (required):
  ///   The ID of the passkey identity to be deleted
  Future<http.Response> userPasskeyDeleteWithHttpInfo(
    String userId,
    String passkeyIdentificationId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/passkeys/{passkey_identification_id}'
        .replaceAll('{user_id}', userId)
        .replaceAll('{passkey_identification_id}', passkeyIdentificationId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete a user passkey
  ///
  /// Delete the passkey identification for a given user and notify them through email.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user that owns the passkey identity
  ///
  /// * [String] passkeyIdentificationId (required):
  ///   The ID of the passkey identity to be deleted
  Future<DeletedObject?> userPasskeyDelete(
    String userId,
    String passkeyIdentificationId,
  ) async {
    final response = await userPasskeyDeleteWithHttpInfo(
      userId,
      passkeyIdentificationId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'DeletedObject',
      ) as DeletedObject;
    }
    return null;
  }

  /// Delete a user web3 wallet
  ///
  /// Delete the web3 wallet identification for a given user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user that owns the web3 wallet
  ///
  /// * [String] web3WalletIdentificationId (required):
  ///   The ID of the web3 wallet identity to be deleted
  Future<http.Response> userWeb3WalletDeleteWithHttpInfo(
    String userId,
    String web3WalletIdentificationId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/users/{user_id}/web3_wallets/{web3_wallet_identification_id}'
            .replaceAll('{user_id}', userId)
            .replaceAll(
                '{web3_wallet_identification_id}', web3WalletIdentificationId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete a user web3 wallet
  ///
  /// Delete the web3 wallet identification for a given user.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user that owns the web3 wallet
  ///
  /// * [String] web3WalletIdentificationId (required):
  ///   The ID of the web3 wallet identity to be deleted
  Future<DeletedObject?> userWeb3WalletDelete(
    String userId,
    String web3WalletIdentificationId,
  ) async {
    final response = await userWeb3WalletDeleteWithHttpInfo(
      userId,
      web3WalletIdentificationId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'DeletedObject',
      ) as DeletedObject;
    }
    return null;
  }

  /// Retrieve all invitations for a user
  ///
  /// Retrieve a paginated list of the user's organization invitations
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose organization invitations we want to retrieve
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] status:
  ///   Filter organization invitations based on their status
  Future<http.Response> usersGetOrganizationInvitationsWithHttpInfo(
    String userId, {
    int? limit,
    int? offset,
    String? status,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/organization_invitations'
        .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve all invitations for a user
  ///
  /// Retrieve a paginated list of the user's organization invitations
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose organization invitations we want to retrieve
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] status:
  ///   Filter organization invitations based on their status
  Future<OrganizationInvitationsWithPublicOrganizationData?>
      usersGetOrganizationInvitations(
    String userId, {
    int? limit,
    int? offset,
    String? status,
  }) async {
    final response = await usersGetOrganizationInvitationsWithHttpInfo(
      userId,
      limit: limit,
      offset: offset,
      status: status,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'OrganizationInvitationsWithPublicOrganizationData',
      ) as OrganizationInvitationsWithPublicOrganizationData;
    }
    return null;
  }

  /// Retrieve all memberships for a user
  ///
  /// Retrieve a paginated list of the user's organization memberships
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose organization memberships we want to retrieve
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> usersGetOrganizationMembershipsWithHttpInfo(
    String userId, {
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{user_id}/organization_memberships'
        .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve all memberships for a user
  ///
  /// Retrieve a paginated list of the user's organization memberships
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user whose organization memberships we want to retrieve
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<OrganizationMemberships?> usersGetOrganizationMemberships(
    String userId, {
    int? limit,
    int? offset,
  }) async {
    final response = await usersGetOrganizationMembershipsWithHttpInfo(
      userId,
      limit: limit,
      offset: offset,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'OrganizationMemberships',
      ) as OrganizationMemberships;
    }
    return null;
  }

  /// Verify the password of a user
  ///
  /// Check that the user's password matches the supplied input. Useful for custom auth flows and re-verification.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user for whom to verify the password
  ///
  /// * [VerifyPasswordRequest] verifyPasswordRequest:
  Future<http.Response> verifyPasswordWithHttpInfo(
    String userId, {
    VerifyPasswordRequest? verifyPasswordRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/users/{user_id}/verify_password'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = verifyPasswordRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Verify the password of a user
  ///
  /// Check that the user's password matches the supplied input. Useful for custom auth flows and re-verification.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user for whom to verify the password
  ///
  /// * [VerifyPasswordRequest] verifyPasswordRequest:
  Future<VerifyPassword200Response?> verifyPassword(
    String userId, {
    VerifyPasswordRequest? verifyPasswordRequest,
  }) async {
    final response = await verifyPasswordWithHttpInfo(
      userId,
      verifyPasswordRequest: verifyPasswordRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'VerifyPassword200Response',
      ) as VerifyPassword200Response;
    }
    return null;
  }

  /// Verify a TOTP or backup code for a user
  ///
  /// Verify that the provided TOTP or backup code is valid for the user. Verifying a backup code will result it in being consumed (i.e. it will become invalid). Useful for custom auth flows and re-verification.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user for whom to verify the TOTP
  ///
  /// * [VerifyTOTPRequest] verifyTOTPRequest:
  Future<http.Response> verifyTOTPWithHttpInfo(
    String userId, {
    VerifyTOTPRequest? verifyTOTPRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/users/{user_id}/verify_totp'.replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = verifyTOTPRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Verify a TOTP or backup code for a user
  ///
  /// Verify that the provided TOTP or backup code is valid for the user. Verifying a backup code will result it in being consumed (i.e. it will become invalid). Useful for custom auth flows and re-verification.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The ID of the user for whom to verify the TOTP
  ///
  /// * [VerifyTOTPRequest] verifyTOTPRequest:
  Future<VerifyTOTP200Response?> verifyTOTP(
    String userId, {
    VerifyTOTPRequest? verifyTOTPRequest,
  }) async {
    final response = await verifyTOTPWithHttpInfo(
      userId,
      verifyTOTPRequest: verifyTOTPRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'VerifyTOTP200Response',
      ) as VerifyTOTP200Response;
    }
    return null;
  }
}
