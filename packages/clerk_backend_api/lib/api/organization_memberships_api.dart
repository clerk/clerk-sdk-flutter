//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationMembershipsApi {
  OrganizationMembershipsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a new organization membership
  ///
  /// Adds a user as a member to the given organization. Only users in the same instance as the organization can be added as members.  This organization will be the user's [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don't explicitly set a different organization as active before then.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization where the new membership will be created
  ///
  /// * [CreateOrganizationMembershipRequest] createOrganizationMembershipRequest (required):
  Future<http.Response> createOrganizationMembershipWithHttpInfo(
    String organizationId,
    CreateOrganizationMembershipRequest createOrganizationMembershipRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/memberships'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody = createOrganizationMembershipRequest;

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

  /// Create a new organization membership
  ///
  /// Adds a user as a member to the given organization. Only users in the same instance as the organization can be added as members.  This organization will be the user's [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don't explicitly set a different organization as active before then.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization where the new membership will be created
  ///
  /// * [CreateOrganizationMembershipRequest] createOrganizationMembershipRequest (required):
  Future<OrganizationMembership?> createOrganizationMembership(
    String organizationId,
    CreateOrganizationMembershipRequest createOrganizationMembershipRequest,
  ) async {
    final response = await createOrganizationMembershipWithHttpInfo(
      organizationId,
      createOrganizationMembershipRequest,
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
        'OrganizationMembership',
      ) as OrganizationMembership;
    }
    return null;
  }

  /// Remove a member from an organization
  ///
  /// Removes the given membership from the organization
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the membership belongs to
  ///
  /// * [String] userId (required):
  ///   The ID of the user that this membership belongs to
  Future<http.Response> deleteOrganizationMembershipWithHttpInfo(
    String organizationId,
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/memberships/{user_id}'
        .replaceAll('{organization_id}', organizationId)
        .replaceAll('{user_id}', userId);

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

  /// Remove a member from an organization
  ///
  /// Removes the given membership from the organization
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the membership belongs to
  ///
  /// * [String] userId (required):
  ///   The ID of the user that this membership belongs to
  Future<OrganizationMembership?> deleteOrganizationMembership(
    String organizationId,
    String userId,
  ) async {
    final response = await deleteOrganizationMembershipWithHttpInfo(
      organizationId,
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
        'OrganizationMembership',
      ) as OrganizationMembership;
    }
    return null;
  }

  /// Get a list of all organization memberships within an instance.
  ///
  /// Retrieves all organization user memberships for the given instance.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] orderBy:
  ///   Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> instanceGetOrganizationMembershipsWithHttpInfo({
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_memberships';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'order_by', orderBy));
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

  /// Get a list of all organization memberships within an instance.
  ///
  /// Retrieves all organization user memberships for the given instance.
  ///
  /// Parameters:
  ///
  /// * [String] orderBy:
  ///   Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<OrganizationMemberships?> instanceGetOrganizationMemberships({
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final response = await instanceGetOrganizationMembershipsWithHttpInfo(
      orderBy: orderBy,
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

  /// Get a list of all members of an organization
  ///
  /// Retrieves all user memberships for the given organization
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] orderBy:
  ///   Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.\"
  ///
  /// * [List<String>] userId:
  ///   Returns users with the user ids specified. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective user id should be included or excluded from the result set. Accepts up to 100 user ids. Any user ids not found are ignored.
  ///
  /// * [List<String>] emailAddress:
  ///   Returns users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored.
  ///
  /// * [List<String>] phoneNumber:
  ///   Returns users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored.
  ///
  /// * [List<String>] username:
  ///   Returns users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored.
  ///
  /// * [List<String>] web3Wallet:
  ///   Returns users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored.
  ///
  /// * [List<String>] role:
  ///   Returns users with the specified roles. Accepts up to 100 roles. Any roles not found are ignored.
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
  /// * [int] lastActiveAtBefore:
  ///   Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23.
  ///
  /// * [int] lastActiveAtAfter:
  ///   Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23.
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
  Future<http.Response> listOrganizationMembershipsWithHttpInfo(
    String organizationId, {
    String? orderBy,
    List<String>? userId,
    List<String>? emailAddress,
    List<String>? phoneNumber,
    List<String>? username,
    List<String>? web3Wallet,
    List<String>? role,
    String? query,
    String? emailAddressQuery,
    String? phoneNumberQuery,
    String? usernameQuery,
    String? nameQuery,
    int? lastActiveAtBefore,
    int? lastActiveAtAfter,
    int? createdAtBefore,
    int? createdAtAfter,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/memberships'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'order_by', orderBy));
    }
    if (userId != null) {
      queryParams.addAll(_queryParams('multi', 'user_id', userId));
    }
    if (emailAddress != null) {
      queryParams.addAll(_queryParams('multi', 'email_address', emailAddress));
    }
    if (phoneNumber != null) {
      queryParams.addAll(_queryParams('multi', 'phone_number', phoneNumber));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('multi', 'username', username));
    }
    if (web3Wallet != null) {
      queryParams.addAll(_queryParams('multi', 'web3_wallet', web3Wallet));
    }
    if (role != null) {
      queryParams.addAll(_queryParams('multi', 'role', role));
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
    if (lastActiveAtBefore != null) {
      queryParams.addAll(
          _queryParams('', 'last_active_at_before', lastActiveAtBefore));
    }
    if (lastActiveAtAfter != null) {
      queryParams
          .addAll(_queryParams('', 'last_active_at_after', lastActiveAtAfter));
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

  /// Get a list of all members of an organization
  ///
  /// Retrieves all user memberships for the given organization
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] orderBy:
  ///   Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.\"
  ///
  /// * [List<String>] userId:
  ///   Returns users with the user ids specified. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective user id should be included or excluded from the result set. Accepts up to 100 user ids. Any user ids not found are ignored.
  ///
  /// * [List<String>] emailAddress:
  ///   Returns users with the specified email addresses. Accepts up to 100 email addresses. Any email addresses not found are ignored.
  ///
  /// * [List<String>] phoneNumber:
  ///   Returns users with the specified phone numbers. Accepts up to 100 phone numbers. Any phone numbers not found are ignored.
  ///
  /// * [List<String>] username:
  ///   Returns users with the specified usernames. Accepts up to 100 usernames. Any usernames not found are ignored.
  ///
  /// * [List<String>] web3Wallet:
  ///   Returns users with the specified web3 wallet addresses. Accepts up to 100 web3 wallet addresses. Any web3 wallet addressed not found are ignored.
  ///
  /// * [List<String>] role:
  ///   Returns users with the specified roles. Accepts up to 100 roles. Any roles not found are ignored.
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
  /// * [int] lastActiveAtBefore:
  ///   Returns users whose last session activity was before the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was before 2023-11-23.
  ///
  /// * [int] lastActiveAtAfter:
  ///   Returns users whose last session activity was after the given date (with millisecond precision). Example: use 1700690400000 to retrieve users whose last session activity was after 2023-11-23.
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
  Future<OrganizationMemberships?> listOrganizationMemberships(
    String organizationId, {
    String? orderBy,
    List<String>? userId,
    List<String>? emailAddress,
    List<String>? phoneNumber,
    List<String>? username,
    List<String>? web3Wallet,
    List<String>? role,
    String? query,
    String? emailAddressQuery,
    String? phoneNumberQuery,
    String? usernameQuery,
    String? nameQuery,
    int? lastActiveAtBefore,
    int? lastActiveAtAfter,
    int? createdAtBefore,
    int? createdAtAfter,
    int? limit,
    int? offset,
  }) async {
    final response = await listOrganizationMembershipsWithHttpInfo(
      organizationId,
      orderBy: orderBy,
      userId: userId,
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      username: username,
      web3Wallet: web3Wallet,
      role: role,
      query: query,
      emailAddressQuery: emailAddressQuery,
      phoneNumberQuery: phoneNumberQuery,
      usernameQuery: usernameQuery,
      nameQuery: nameQuery,
      lastActiveAtBefore: lastActiveAtBefore,
      lastActiveAtAfter: lastActiveAtAfter,
      createdAtBefore: createdAtBefore,
      createdAtAfter: createdAtAfter,
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

  /// Update an organization membership
  ///
  /// Updates the properties of an existing organization membership
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the membership belongs to
  ///
  /// * [String] userId (required):
  ///   The ID of the user that this membership belongs to
  ///
  /// * [UpdateOrganizationMembershipRequest] updateOrganizationMembershipRequest (required):
  Future<http.Response> updateOrganizationMembershipWithHttpInfo(
    String organizationId,
    String userId,
    UpdateOrganizationMembershipRequest updateOrganizationMembershipRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/memberships/{user_id}'
        .replaceAll('{organization_id}', organizationId)
        .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = updateOrganizationMembershipRequest;

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

  /// Update an organization membership
  ///
  /// Updates the properties of an existing organization membership
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the membership belongs to
  ///
  /// * [String] userId (required):
  ///   The ID of the user that this membership belongs to
  ///
  /// * [UpdateOrganizationMembershipRequest] updateOrganizationMembershipRequest (required):
  Future<OrganizationMembership?> updateOrganizationMembership(
    String organizationId,
    String userId,
    UpdateOrganizationMembershipRequest updateOrganizationMembershipRequest,
  ) async {
    final response = await updateOrganizationMembershipWithHttpInfo(
      organizationId,
      userId,
      updateOrganizationMembershipRequest,
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
        'OrganizationMembership',
      ) as OrganizationMembership;
    }
    return null;
  }

  /// Merge and update organization membership metadata
  ///
  /// Update an organization membership's metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep means that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to `null`.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the membership belongs to
  ///
  /// * [String] userId (required):
  ///   The ID of the user that this membership belongs to
  ///
  /// * [UpdateOrganizationMembershipMetadataRequest] updateOrganizationMembershipMetadataRequest:
  Future<http.Response> updateOrganizationMembershipMetadataWithHttpInfo(
    String organizationId,
    String userId, {
    UpdateOrganizationMembershipMetadataRequest?
        updateOrganizationMembershipMetadataRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/organizations/{organization_id}/memberships/{user_id}/metadata'
            .replaceAll('{organization_id}', organizationId)
            .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = updateOrganizationMembershipMetadataRequest;

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

  /// Merge and update organization membership metadata
  ///
  /// Update an organization membership's metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep means that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to `null`.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the membership belongs to
  ///
  /// * [String] userId (required):
  ///   The ID of the user that this membership belongs to
  ///
  /// * [UpdateOrganizationMembershipMetadataRequest] updateOrganizationMembershipMetadataRequest:
  Future<OrganizationMembership?> updateOrganizationMembershipMetadata(
    String organizationId,
    String userId, {
    UpdateOrganizationMembershipMetadataRequest?
        updateOrganizationMembershipMetadataRequest,
  }) async {
    final response = await updateOrganizationMembershipMetadataWithHttpInfo(
      organizationId,
      userId,
      updateOrganizationMembershipMetadataRequest:
          updateOrganizationMembershipMetadataRequest,
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
        'OrganizationMembership',
      ) as OrganizationMembership;
    }
    return null;
  }
}
