//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InvitationsApi {
  InvitationsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create multiple invitations
  ///
  /// Use this API operation to create multiple invitations for the provided email addresses. You can choose to send the invitations as emails by setting the `notify` parameter to `true`. There cannot be an existing invitation for any of the email addresses you provide unless you set `ignore_existing` to `true` for specific email addresses. Please note that there must be no existing user for any of the email addresses you provide, and this rule cannot be bypassed.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<CreateBulkInvitationsRequestInner>] createBulkInvitationsRequestInner:
  ///   Required parameters
  Future<http.Response> createBulkInvitationsWithHttpInfo({
    List<CreateBulkInvitationsRequestInner>? createBulkInvitationsRequestInner,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/invitations/bulk';

    // ignore: prefer_final_locals
    Object? postBody = createBulkInvitationsRequestInner;

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

  /// Create multiple invitations
  ///
  /// Use this API operation to create multiple invitations for the provided email addresses. You can choose to send the invitations as emails by setting the `notify` parameter to `true`. There cannot be an existing invitation for any of the email addresses you provide unless you set `ignore_existing` to `true` for specific email addresses. Please note that there must be no existing user for any of the email addresses you provide, and this rule cannot be bypassed.
  ///
  /// Parameters:
  ///
  /// * [List<CreateBulkInvitationsRequestInner>] createBulkInvitationsRequestInner:
  ///   Required parameters
  Future<List<Invitation>?> createBulkInvitations({
    List<CreateBulkInvitationsRequestInner>? createBulkInvitationsRequestInner,
  }) async {
    final response = await createBulkInvitationsWithHttpInfo(
      createBulkInvitationsRequestInner: createBulkInvitationsRequestInner,
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
      return (await apiClient.deserializeAsync(responseBody, 'List<Invitation>')
              as List)
          .cast<Invitation>()
          .toList(growable: false);
    }
    return null;
  }

  /// Create an invitation
  ///
  /// Creates a new invitation for the given email address and sends the invitation email. Keep in mind that you cannot create an invitation if there is already one for the given email address. Also, trying to create an invitation for an email address that already exists in your application will result to an error.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateInvitationRequest] createInvitationRequest:
  ///   Required parameters
  Future<http.Response> createInvitationWithHttpInfo({
    CreateInvitationRequest? createInvitationRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/invitations';

    // ignore: prefer_final_locals
    Object? postBody = createInvitationRequest;

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

  /// Create an invitation
  ///
  /// Creates a new invitation for the given email address and sends the invitation email. Keep in mind that you cannot create an invitation if there is already one for the given email address. Also, trying to create an invitation for an email address that already exists in your application will result to an error.
  ///
  /// Parameters:
  ///
  /// * [CreateInvitationRequest] createInvitationRequest:
  ///   Required parameters
  Future<Invitation?> createInvitation({
    CreateInvitationRequest? createInvitationRequest,
  }) async {
    final response = await createInvitationWithHttpInfo(
      createInvitationRequest: createInvitationRequest,
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
        'Invitation',
      ) as Invitation;
    }
    return null;
  }

  /// List all invitations
  ///
  /// Returns all non-revoked invitations for your application, sorted by creation date
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] status:
  ///   Filter invitations based on their status
  ///
  /// * [String] query:
  ///   Filter invitations based on their `email_address` or `id`
  ///
  /// * [String] orderBy:
  ///   Allows to return organizations in a particular order. At the moment, you can order the returned organizations either by their `name`, `created_at` or `members_count`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organizations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied.
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> listInvitationsWithHttpInfo({
    String? status,
    String? query,
    String? orderBy,
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/invitations';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'order_by', orderBy));
    }
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

  /// List all invitations
  ///
  /// Returns all non-revoked invitations for your application, sorted by creation date
  ///
  /// Parameters:
  ///
  /// * [String] status:
  ///   Filter invitations based on their status
  ///
  /// * [String] query:
  ///   Filter invitations based on their `email_address` or `id`
  ///
  /// * [String] orderBy:
  ///   Allows to return organizations in a particular order. At the moment, you can order the returned organizations either by their `name`, `created_at` or `members_count`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organizations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied.
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<List<Invitation>?> listInvitations({
    String? status,
    String? query,
    String? orderBy,
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    final response = await listInvitationsWithHttpInfo(
      status: status,
      query: query,
      orderBy: orderBy,
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
      return (await apiClient.deserializeAsync(responseBody, 'List<Invitation>')
              as List)
          .cast<Invitation>()
          .toList(growable: false);
    }
    return null;
  }

  /// Revokes an invitation
  ///
  /// Revokes the given invitation. Revoking an invitation will prevent the user from using the invitation link that was sent to them. However, it doesn't prevent the user from signing up if they follow the sign up flow. Only active (i.e. non-revoked) invitations can be revoked.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] invitationId (required):
  ///   The ID of the invitation to be revoked
  Future<http.Response> revokeInvitationWithHttpInfo(
    String invitationId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/invitations/{invitation_id}/revoke'
        .replaceAll('{invitation_id}', invitationId);

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

  /// Revokes an invitation
  ///
  /// Revokes the given invitation. Revoking an invitation will prevent the user from using the invitation link that was sent to them. However, it doesn't prevent the user from signing up if they follow the sign up flow. Only active (i.e. non-revoked) invitations can be revoked.
  ///
  /// Parameters:
  ///
  /// * [String] invitationId (required):
  ///   The ID of the invitation to be revoked
  Future<RevokeInvitation200Response?> revokeInvitation(
    String invitationId,
  ) async {
    final response = await revokeInvitationWithHttpInfo(
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
        'RevokeInvitation200Response',
      ) as RevokeInvitation200Response;
    }
    return null;
  }
}
