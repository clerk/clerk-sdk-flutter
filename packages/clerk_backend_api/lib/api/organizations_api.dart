//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationsApi {
  OrganizationsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create an organization
  ///
  /// Creates a new organization with the given name for an instance. You can specify an optional slug for the new organization. If provided, the organization slug can contain only lowercase alphanumeric characters (letters and digits) and the dash \"-\". Organization slugs must be unique for the instance. You can provide additional metadata for the organization and set any custom attribute you want. Organizations support private and public metadata. Private metadata can only be accessed from the Backend API. Public metadata can be accessed from the Backend API, and are read-only from the Frontend API. The `created_by` user will see this as their [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don't explicitly set a different organization as active before then.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateOrganizationRequest] createOrganizationRequest:
  Future<http.Response> createOrganizationWithHttpInfo({
    CreateOrganizationRequest? createOrganizationRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations';

    // ignore: prefer_final_locals
    Object? postBody = createOrganizationRequest;

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

  /// Create an organization
  ///
  /// Creates a new organization with the given name for an instance. You can specify an optional slug for the new organization. If provided, the organization slug can contain only lowercase alphanumeric characters (letters and digits) and the dash \"-\". Organization slugs must be unique for the instance. You can provide additional metadata for the organization and set any custom attribute you want. Organizations support private and public metadata. Private metadata can only be accessed from the Backend API. Public metadata can be accessed from the Backend API, and are read-only from the Frontend API. The `created_by` user will see this as their [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don't explicitly set a different organization as active before then.
  ///
  /// Parameters:
  ///
  /// * [CreateOrganizationRequest] createOrganizationRequest:
  Future<Organization?> createOrganization({
    CreateOrganizationRequest? createOrganizationRequest,
  }) async {
    final response = await createOrganizationWithHttpInfo(
      createOrganizationRequest: createOrganizationRequest,
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
        'Organization',
      ) as Organization;
    }
    return null;
  }

  /// Delete an organization
  ///
  /// Deletes the given organization. Please note that deleting an organization will also delete all memberships and invitations. This is not reversible.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization to delete
  Future<http.Response> deleteOrganizationWithHttpInfo(
    String organizationId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}'
        .replaceAll('{organization_id}', organizationId);

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

  /// Delete an organization
  ///
  /// Deletes the given organization. Please note that deleting an organization will also delete all memberships and invitations. This is not reversible.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization to delete
  Future<DeletedObject?> deleteOrganization(
    String organizationId,
  ) async {
    final response = await deleteOrganizationWithHttpInfo(
      organizationId,
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

  /// Delete the organization's logo.
  ///
  /// Delete the organization's logo.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization for which the logo will be deleted.
  Future<http.Response> deleteOrganizationLogoWithHttpInfo(
    String organizationId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/logo'
        .replaceAll('{organization_id}', organizationId);

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

  /// Delete the organization's logo.
  ///
  /// Delete the organization's logo.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization for which the logo will be deleted.
  Future<Organization?> deleteOrganizationLogo(
    String organizationId,
  ) async {
    final response = await deleteOrganizationLogoWithHttpInfo(
      organizationId,
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
        'Organization',
      ) as Organization;
    }
    return null;
  }

  /// Retrieve an organization by ID or slug
  ///
  /// Fetches the organization whose ID or slug matches the provided `id_or_slug` URL query parameter.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID or slug of the organization
  ///
  /// * [bool] includeMembersCount:
  ///   Flag to denote whether or not the organization's members count should be included in the response.
  ///
  /// * [bool] includeMissingMemberWithElevatedPermissions:
  ///   Flag to denote whether or not to include a member with elevated permissions who is not currently a member of the organization.
  Future<http.Response> getOrganizationWithHttpInfo(
    String organizationId, {
    bool? includeMembersCount,
    bool? includeMissingMemberWithElevatedPermissions,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (includeMembersCount != null) {
      queryParams.addAll(
          _queryParams('', 'include_members_count', includeMembersCount));
    }
    if (includeMissingMemberWithElevatedPermissions != null) {
      queryParams.addAll(_queryParams(
          '',
          'include_missing_member_with_elevated_permissions',
          includeMissingMemberWithElevatedPermissions));
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

  /// Retrieve an organization by ID or slug
  ///
  /// Fetches the organization whose ID or slug matches the provided `id_or_slug` URL query parameter.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID or slug of the organization
  ///
  /// * [bool] includeMembersCount:
  ///   Flag to denote whether or not the organization's members count should be included in the response.
  ///
  /// * [bool] includeMissingMemberWithElevatedPermissions:
  ///   Flag to denote whether or not to include a member with elevated permissions who is not currently a member of the organization.
  Future<Organization?> getOrganization(
    String organizationId, {
    bool? includeMembersCount,
    bool? includeMissingMemberWithElevatedPermissions,
  }) async {
    final response = await getOrganizationWithHttpInfo(
      organizationId,
      includeMembersCount: includeMembersCount,
      includeMissingMemberWithElevatedPermissions:
          includeMissingMemberWithElevatedPermissions,
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
        'Organization',
      ) as Organization;
    }
    return null;
  }

  /// Get a list of organizations for an instance
  ///
  /// This request returns the list of organizations for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The organizations are ordered by descending creation date. Most recent organizations will be returned first.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [bool] includeMembersCount:
  ///   Flag to denote whether the member counts of each organization should be included in the response or not.
  ///
  /// * [bool] includeMissingMemberWithElevatedPermissions:
  ///   Flag to denote whether or not to include a member with elevated permissions who is not currently a member of the organization.
  ///
  /// * [String] query:
  ///   Returns organizations with ID, name, or slug that match the given query. Uses exact match for organization ID and partial match for name and slug.
  ///
  /// * [List<String>] userId:
  ///   Returns organizations with the user ids specified. Any user ids not found are ignored. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set.
  ///
  /// * [List<String>] organizationId:
  ///   Returns organizations with the organization ids specified. Any organization ids not found are ignored. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids. Example: ?organization_id=+org_1&organization_id=-org_2
  ///
  /// * [String] orderBy:
  ///   Allows to return organizations in a particular order. At the moment, you can order the returned organizations either by their `name`, `created_at` or `members_count`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organizations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> listOrganizationsWithHttpInfo({
    bool? includeMembersCount,
    bool? includeMissingMemberWithElevatedPermissions,
    String? query,
    List<String>? userId,
    List<String>? organizationId,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (includeMembersCount != null) {
      queryParams.addAll(
          _queryParams('', 'include_members_count', includeMembersCount));
    }
    if (includeMissingMemberWithElevatedPermissions != null) {
      queryParams.addAll(_queryParams(
          '',
          'include_missing_member_with_elevated_permissions',
          includeMissingMemberWithElevatedPermissions));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (userId != null) {
      queryParams.addAll(_queryParams('multi', 'user_id', userId));
    }
    if (organizationId != null) {
      queryParams
          .addAll(_queryParams('multi', 'organization_id', organizationId));
    }
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

  /// Get a list of organizations for an instance
  ///
  /// This request returns the list of organizations for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The organizations are ordered by descending creation date. Most recent organizations will be returned first.
  ///
  /// Parameters:
  ///
  /// * [bool] includeMembersCount:
  ///   Flag to denote whether the member counts of each organization should be included in the response or not.
  ///
  /// * [bool] includeMissingMemberWithElevatedPermissions:
  ///   Flag to denote whether or not to include a member with elevated permissions who is not currently a member of the organization.
  ///
  /// * [String] query:
  ///   Returns organizations with ID, name, or slug that match the given query. Uses exact match for organization ID and partial match for name and slug.
  ///
  /// * [List<String>] userId:
  ///   Returns organizations with the user ids specified. Any user ids not found are ignored. For each user id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set.
  ///
  /// * [List<String>] organizationId:
  ///   Returns organizations with the organization ids specified. Any organization ids not found are ignored. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids. Example: ?organization_id=+org_1&organization_id=-org_2
  ///
  /// * [String] orderBy:
  ///   Allows to return organizations in a particular order. At the moment, you can order the returned organizations either by their `name`, `created_at` or `members_count`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organizations to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<Organizations?> listOrganizations({
    bool? includeMembersCount,
    bool? includeMissingMemberWithElevatedPermissions,
    String? query,
    List<String>? userId,
    List<String>? organizationId,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final response = await listOrganizationsWithHttpInfo(
      includeMembersCount: includeMembersCount,
      includeMissingMemberWithElevatedPermissions:
          includeMissingMemberWithElevatedPermissions,
      query: query,
      userId: userId,
      organizationId: organizationId,
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
        'Organizations',
      ) as Organizations;
    }
    return null;
  }

  /// Merge and update metadata for an organization
  ///
  /// Update organization metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep meaning that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to `null`.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization for which metadata will be merged or updated
  ///
  /// * [MergeOrganizationMetadataRequest] mergeOrganizationMetadataRequest (required):
  Future<http.Response> mergeOrganizationMetadataWithHttpInfo(
    String organizationId,
    MergeOrganizationMetadataRequest mergeOrganizationMetadataRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/metadata'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody = mergeOrganizationMetadataRequest;

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

  /// Merge and update metadata for an organization
  ///
  /// Update organization metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep meaning that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to `null`.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization for which metadata will be merged or updated
  ///
  /// * [MergeOrganizationMetadataRequest] mergeOrganizationMetadataRequest (required):
  Future<Organization?> mergeOrganizationMetadata(
    String organizationId,
    MergeOrganizationMetadataRequest mergeOrganizationMetadataRequest,
  ) async {
    final response = await mergeOrganizationMetadataWithHttpInfo(
      organizationId,
      mergeOrganizationMetadataRequest,
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
        'Organization',
      ) as Organization;
    }
    return null;
  }

  /// Update an organization
  ///
  /// Updates an existing organization
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization to update
  ///
  /// * [UpdateOrganizationRequest] updateOrganizationRequest (required):
  Future<http.Response> updateOrganizationWithHttpInfo(
    String organizationId,
    UpdateOrganizationRequest updateOrganizationRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody = updateOrganizationRequest;

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

  /// Update an organization
  ///
  /// Updates an existing organization
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization to update
  ///
  /// * [UpdateOrganizationRequest] updateOrganizationRequest (required):
  Future<Organization?> updateOrganization(
    String organizationId,
    UpdateOrganizationRequest updateOrganizationRequest,
  ) async {
    final response = await updateOrganizationWithHttpInfo(
      organizationId,
      updateOrganizationRequest,
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
        'Organization',
      ) as Organization;
    }
    return null;
  }

  /// Upload a logo for the organization
  ///
  /// Set or replace an organization's logo, by uploading an image file. This endpoint uses the `multipart/form-data` request content type and accepts a file of image type. The file size cannot exceed 10MB. Only the following file content types are supported: `image/jpeg`, `image/png`, `image/gif`, `image/webp`, `image/x-icon`, `image/vnd.microsoft.icon`.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization for which to upload a logo
  ///
  /// * [MultipartFile] file (required):
  ///
  /// * [String] uploaderUserId:
  ///   The ID of the user that will be credited with the image upload.
  Future<http.Response> uploadOrganizationLogoWithHttpInfo(
    String organizationId,
    http.MultipartFile file, {
    String? uploaderUserId,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/logo'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    final mp = http.MultipartRequest('PUT', Uri.parse(path));
    if (uploaderUserId != null) {
      mp.fields[r'uploader_user_id'] = parameterToString(uploaderUserId);
    }
    mp.fields[r'file'] = file.field;
    mp.files.add(file);
    postBody = mp;

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Upload a logo for the organization
  ///
  /// Set or replace an organization's logo, by uploading an image file. This endpoint uses the `multipart/form-data` request content type and accepts a file of image type. The file size cannot exceed 10MB. Only the following file content types are supported: `image/jpeg`, `image/png`, `image/gif`, `image/webp`, `image/x-icon`, `image/vnd.microsoft.icon`.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization for which to upload a logo
  ///
  /// * [MultipartFile] file (required):
  ///
  /// * [String] uploaderUserId:
  ///   The ID of the user that will be credited with the image upload.
  Future<OrganizationWithLogo?> uploadOrganizationLogo(
    String organizationId,
    http.MultipartFile file, {
    String? uploaderUserId,
  }) async {
    final response = await uploadOrganizationLogoWithHttpInfo(
      organizationId,
      file,
      uploaderUserId: uploaderUserId,
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
        'OrganizationWithLogo',
      ) as OrganizationWithLogo;
    }
    return null;
  }
}
