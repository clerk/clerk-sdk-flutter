//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationInvitationsApi {
  OrganizationInvitationsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create and send an organization invitation
  ///
  /// Creates a new organization invitation and sends an email to the provided `email_address` with a link to accept the invitation and join the organization. You can specify the `role` for the invited organization member.  New organization invitations get a \"pending\" status until they are revoked by an organization administrator or accepted by the invitee.  The request body supports passing an optional `redirect_url` parameter. When the invited user clicks the link to accept the invitation, they will be redirected to the URL provided. Use this parameter to implement a custom invitation acceptance flow.  You can specify the ID of the user that will send the invitation with the `inviter_user_id` parameter. That user must be a member with administrator privileges in the organization. Only \"admin\" members can create organization invitations.  You can optionally provide public and private metadata for the organization invitation. The public metadata are visible by both the Frontend and the Backend whereas the private ones only by the Backend. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization for which to send the invitation
  ///
  /// * [CreateOrganizationInvitationRequest] createOrganizationInvitationRequest:
  Future<http.Response> createOrganizationInvitationWithHttpInfo(
    String organizationId, {
    CreateOrganizationInvitationRequest? createOrganizationInvitationRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/invitations'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody = createOrganizationInvitationRequest;

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

  /// Create and send an organization invitation
  ///
  /// Creates a new organization invitation and sends an email to the provided `email_address` with a link to accept the invitation and join the organization. You can specify the `role` for the invited organization member.  New organization invitations get a \"pending\" status until they are revoked by an organization administrator or accepted by the invitee.  The request body supports passing an optional `redirect_url` parameter. When the invited user clicks the link to accept the invitation, they will be redirected to the URL provided. Use this parameter to implement a custom invitation acceptance flow.  You can specify the ID of the user that will send the invitation with the `inviter_user_id` parameter. That user must be a member with administrator privileges in the organization. Only \"admin\" members can create organization invitations.  You can optionally provide public and private metadata for the organization invitation. The public metadata are visible by both the Frontend and the Backend whereas the private ones only by the Backend. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization for which to send the invitation
  ///
  /// * [CreateOrganizationInvitationRequest] createOrganizationInvitationRequest:
  Future<OrganizationInvitation?> createOrganizationInvitation(
    String organizationId, {
    CreateOrganizationInvitationRequest? createOrganizationInvitationRequest,
  }) async {
    final response = await createOrganizationInvitationWithHttpInfo(
      organizationId,
      createOrganizationInvitationRequest: createOrganizationInvitationRequest,
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
        'OrganizationInvitation',
      ) as OrganizationInvitation;
    }
    return null;
  }

  /// Bulk create and send organization invitations
  ///
  /// Creates new organization invitations in bulk and sends out emails to the provided email addresses with a link to accept the invitation and join the organization. You can specify a different `role` for each invited organization member. New organization invitations get a \"pending\" status until they are revoked by an organization administrator or accepted by the invitee. The request body supports passing an optional `redirect_url` parameter for each invitation. When the invited user clicks the link to accept the invitation, they will be redirected to the provided URL. Use this parameter to implement a custom invitation acceptance flow. You can specify the ID of the user that will send the invitation with the `inviter_user_id` parameter. Each invitation can have a different inviter user. Inviter users must be members with administrator privileges in the organization. Only \"admin\" members can create organization invitations. You can optionally provide public and private metadata for each organization invitation. The public metadata are visible by both the Frontend and the Backend, whereas the private metadata are only visible by the Backend. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [List<CreateOrganizationInvitationRequest>] createOrganizationInvitationRequest (required):
  Future<http.Response> createOrganizationInvitationBulkWithHttpInfo(
    String organizationId,
    List<CreateOrganizationInvitationRequest>
        createOrganizationInvitationRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/invitations/bulk'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody = createOrganizationInvitationRequest;

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

  /// Bulk create and send organization invitations
  ///
  /// Creates new organization invitations in bulk and sends out emails to the provided email addresses with a link to accept the invitation and join the organization. You can specify a different `role` for each invited organization member. New organization invitations get a \"pending\" status until they are revoked by an organization administrator or accepted by the invitee. The request body supports passing an optional `redirect_url` parameter for each invitation. When the invited user clicks the link to accept the invitation, they will be redirected to the provided URL. Use this parameter to implement a custom invitation acceptance flow. You can specify the ID of the user that will send the invitation with the `inviter_user_id` parameter. Each invitation can have a different inviter user. Inviter users must be members with administrator privileges in the organization. Only \"admin\" members can create organization invitations. You can optionally provide public and private metadata for each organization invitation. The public metadata are visible by both the Frontend and the Backend, whereas the private metadata are only visible by the Backend. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [List<CreateOrganizationInvitationRequest>] createOrganizationInvitationRequest (required):
  Future<OrganizationInvitations?> createOrganizationInvitationBulk(
    String organizationId,
    List<CreateOrganizationInvitationRequest>
        createOrganizationInvitationRequest,
  ) async {
    final response = await createOrganizationInvitationBulkWithHttpInfo(
      organizationId,
      createOrganizationInvitationRequest,
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
        'OrganizationInvitations',
      ) as OrganizationInvitations;
    }
    return null;
  }

  /// Retrieve an organization invitation by ID
  ///
  /// Use this request to get an existing organization invitation by ID.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] invitationId (required):
  ///   The organization invitation ID.
  Future<http.Response> getOrganizationInvitationWithHttpInfo(
    String organizationId,
    String invitationId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/invitations/{invitation_id}'
        .replaceAll('{organization_id}', organizationId)
        .replaceAll('{invitation_id}', invitationId);

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

  /// Retrieve an organization invitation by ID
  ///
  /// Use this request to get an existing organization invitation by ID.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] invitationId (required):
  ///   The organization invitation ID.
  Future<OrganizationInvitation?> getOrganizationInvitation(
    String organizationId,
    String invitationId,
  ) async {
    final response = await getOrganizationInvitationWithHttpInfo(
      organizationId,
      invitationId,
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
        'OrganizationInvitation',
      ) as OrganizationInvitation;
    }
    return null;
  }

  /// Get a list of organization invitations for the current instance
  ///
  /// This request returns the list of organization invitations for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. You can filter them by providing the 'status' query parameter, that accepts multiple values. You can change the order by providing the 'order' query parameter, that accepts multiple values. You can filter by the invited user email address providing the `query` query parameter. The organization invitations are ordered by descending creation date by default.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] orderBy:
  ///   Allows to return organization invitations in a particular order. At the moment, you can order the returned organization invitations either by their `created_at` or `email_address`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organization invitations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [String] status:
  ///   Filter organization invitations based on their status
  ///
  /// * [String] query:
  ///   Filter organization invitations based on their `email_address`
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> listInstanceOrganizationInvitationsWithHttpInfo({
    String? orderBy,
    String? status,
    String? query,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_invitations';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'order_by', orderBy));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
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

  /// Get a list of organization invitations for the current instance
  ///
  /// This request returns the list of organization invitations for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. You can filter them by providing the 'status' query parameter, that accepts multiple values. You can change the order by providing the 'order' query parameter, that accepts multiple values. You can filter by the invited user email address providing the `query` query parameter. The organization invitations are ordered by descending creation date by default.
  ///
  /// Parameters:
  ///
  /// * [String] orderBy:
  ///   Allows to return organization invitations in a particular order. At the moment, you can order the returned organization invitations either by their `created_at` or `email_address`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organization invitations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [String] status:
  ///   Filter organization invitations based on their status
  ///
  /// * [String] query:
  ///   Filter organization invitations based on their `email_address`
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<OrganizationInvitationsWithPublicOrganizationData?>
      listInstanceOrganizationInvitations({
    String? orderBy,
    String? status,
    String? query,
    int? limit,
    int? offset,
  }) async {
    final response = await listInstanceOrganizationInvitationsWithHttpInfo(
      orderBy: orderBy,
      status: status,
      query: query,
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
        'OrganizationInvitationsWithPublicOrganizationData',
      ) as OrganizationInvitationsWithPublicOrganizationData;
    }
    return null;
  }

  /// Get a list of organization invitations
  ///
  /// This request returns the list of organization invitations. Results can be paginated using the optional `limit` and `offset` query parameters. You can filter them by providing the 'status' query parameter, that accepts multiple values. The organization invitations are ordered by descending creation date. Most recent invitations will be returned first. Any invitations created as a result of an Organization Domain are not included in the results.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] status:
  ///   Filter organization invitations based on their status
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> listOrganizationInvitationsWithHttpInfo(
    String organizationId, {
    String? status,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/invitations'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
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

  /// Get a list of organization invitations
  ///
  /// This request returns the list of organization invitations. Results can be paginated using the optional `limit` and `offset` query parameters. You can filter them by providing the 'status' query parameter, that accepts multiple values. The organization invitations are ordered by descending creation date. Most recent invitations will be returned first. Any invitations created as a result of an Organization Domain are not included in the results.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] status:
  ///   Filter organization invitations based on their status
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<OrganizationInvitations?> listOrganizationInvitations(
    String organizationId, {
    String? status,
    int? limit,
    int? offset,
  }) async {
    final response = await listOrganizationInvitationsWithHttpInfo(
      organizationId,
      status: status,
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
        'OrganizationInvitations',
      ) as OrganizationInvitations;
    }
    return null;
  }

  /// Get a list of pending organization invitations
  ///
  /// This request returns the list of organization invitations with \"pending\" status. These are the organization invitations that can still be used to join the organization, but have not been accepted by the invited user yet. Results can be paginated using the optional `limit` and `offset` query parameters. The organization invitations are ordered by descending creation date. Most recent invitations will be returned first. Any invitations created as a result of an Organization Domain are not included in the results.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> listPendingOrganizationInvitationsWithHttpInfo(
    String organizationId, {
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/invitations/pending'
        .replaceAll('{organization_id}', organizationId);

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

  /// Get a list of pending organization invitations
  ///
  /// This request returns the list of organization invitations with \"pending\" status. These are the organization invitations that can still be used to join the organization, but have not been accepted by the invited user yet. Results can be paginated using the optional `limit` and `offset` query parameters. The organization invitations are ordered by descending creation date. Most recent invitations will be returned first. Any invitations created as a result of an Organization Domain are not included in the results.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<OrganizationInvitations?> listPendingOrganizationInvitations(
    String organizationId, {
    int? limit,
    int? offset,
  }) async {
    final response = await listPendingOrganizationInvitationsWithHttpInfo(
      organizationId,
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
        'OrganizationInvitations',
      ) as OrganizationInvitations;
    }
    return null;
  }

  /// Revoke a pending organization invitation
  ///
  /// Use this request to revoke a previously issued organization invitation. Revoking an organization invitation makes it invalid; the invited user will no longer be able to join the organization with the revoked invitation. Only organization invitations with \"pending\" status can be revoked. The request accepts the `requesting_user_id` parameter to specify the user which revokes the invitation. Only users with \"admin\" role can revoke invitations.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] invitationId (required):
  ///   The organization invitation ID.
  ///
  /// * [RevokeOrganizationInvitationRequest] revokeOrganizationInvitationRequest:
  Future<http.Response> revokeOrganizationInvitationWithHttpInfo(
    String organizationId,
    String invitationId, {
    RevokeOrganizationInvitationRequest? revokeOrganizationInvitationRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/organizations/{organization_id}/invitations/{invitation_id}/revoke'
            .replaceAll('{organization_id}', organizationId)
            .replaceAll('{invitation_id}', invitationId);

    // ignore: prefer_final_locals
    Object? postBody = revokeOrganizationInvitationRequest;

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

  /// Revoke a pending organization invitation
  ///
  /// Use this request to revoke a previously issued organization invitation. Revoking an organization invitation makes it invalid; the invited user will no longer be able to join the organization with the revoked invitation. Only organization invitations with \"pending\" status can be revoked. The request accepts the `requesting_user_id` parameter to specify the user which revokes the invitation. Only users with \"admin\" role can revoke invitations.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] invitationId (required):
  ///   The organization invitation ID.
  ///
  /// * [RevokeOrganizationInvitationRequest] revokeOrganizationInvitationRequest:
  Future<OrganizationInvitation?> revokeOrganizationInvitation(
    String organizationId,
    String invitationId, {
    RevokeOrganizationInvitationRequest? revokeOrganizationInvitationRequest,
  }) async {
    final response = await revokeOrganizationInvitationWithHttpInfo(
      organizationId,
      invitationId,
      revokeOrganizationInvitationRequest: revokeOrganizationInvitationRequest,
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
        'OrganizationInvitation',
      ) as OrganizationInvitation;
    }
    return null;
  }
}
