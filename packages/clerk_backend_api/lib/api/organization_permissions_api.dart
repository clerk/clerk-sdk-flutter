//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationPermissionsApi {
  OrganizationPermissionsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a new organization permission
  ///
  /// Creates a new organization permission for the given instance.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateOrganizationPermissionRequest] createOrganizationPermissionRequest (required):
  Future<http.Response> createOrganizationPermissionWithHttpInfo(
    CreateOrganizationPermissionRequest createOrganizationPermissionRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_permissions';

    // ignore: prefer_final_locals
    Object? postBody = createOrganizationPermissionRequest;

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

  /// Create a new organization permission
  ///
  /// Creates a new organization permission for the given instance.
  ///
  /// Parameters:
  ///
  /// * [CreateOrganizationPermissionRequest] createOrganizationPermissionRequest (required):
  Future<Permission?> createOrganizationPermission(
    CreateOrganizationPermissionRequest createOrganizationPermissionRequest,
  ) async {
    final response = await createOrganizationPermissionWithHttpInfo(
      createOrganizationPermissionRequest,
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
        'Permission',
      ) as Permission;
    }
    return null;
  }

  /// Delete an organization permission
  ///
  /// Deletes an organization permission. System permissions cannot be deleted.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to delete
  Future<http.Response> deleteOrganizationPermissionWithHttpInfo(
    String permissionId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_permissions/{permission_id}'
        .replaceAll('{permission_id}', permissionId);

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

  /// Delete an organization permission
  ///
  /// Deletes an organization permission. System permissions cannot be deleted.
  ///
  /// Parameters:
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to delete
  Future<DeletedObject?> deleteOrganizationPermission(
    String permissionId,
  ) async {
    final response = await deleteOrganizationPermissionWithHttpInfo(
      permissionId,
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

  /// Get an organization permission
  ///
  /// Retrieves the details of an organization permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to retrieve
  Future<http.Response> getOrganizationPermissionWithHttpInfo(
    String permissionId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_permissions/{permission_id}'
        .replaceAll('{permission_id}', permissionId);

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

  /// Get an organization permission
  ///
  /// Retrieves the details of an organization permission.
  ///
  /// Parameters:
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to retrieve
  Future<Permission?> getOrganizationPermission(
    String permissionId,
  ) async {
    final response = await getOrganizationPermissionWithHttpInfo(
      permissionId,
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
        'Permission',
      ) as Permission;
    }
    return null;
  }

  /// Get a list of all organization permissions
  ///
  /// Retrieves all organization permissions for the given instance.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   Returns organization permissions with ID, name, or key that match the given query. Uses exact match for permission ID and partial match for name and key.
  ///
  /// * [String] orderBy:
  ///   Allows to return organization permissions in a particular order. At the moment, you can order the returned permissions by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want permissions to be returned in descending order according to their `created_at` property, you can use `-created_at`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> listOrganizationPermissionsWithHttpInfo({
    String? query,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_permissions';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
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

  /// Get a list of all organization permissions
  ///
  /// Retrieves all organization permissions for the given instance.
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   Returns organization permissions with ID, name, or key that match the given query. Uses exact match for permission ID and partial match for name and key.
  ///
  /// * [String] orderBy:
  ///   Allows to return organization permissions in a particular order. At the moment, you can order the returned permissions by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want permissions to be returned in descending order according to their `created_at` property, you can use `-created_at`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<Permissions?> listOrganizationPermissions({
    String? query,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final response = await listOrganizationPermissionsWithHttpInfo(
      query: query,
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
        'Permissions',
      ) as Permissions;
    }
    return null;
  }

  /// Update an organization permission
  ///
  /// Updates the properties of an existing organization permission. System permissions cannot be updated.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to update
  ///
  /// * [UpdateOrganizationPermissionRequest] updateOrganizationPermissionRequest (required):
  Future<http.Response> updateOrganizationPermissionWithHttpInfo(
    String permissionId,
    UpdateOrganizationPermissionRequest updateOrganizationPermissionRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_permissions/{permission_id}'
        .replaceAll('{permission_id}', permissionId);

    // ignore: prefer_final_locals
    Object? postBody = updateOrganizationPermissionRequest;

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

  /// Update an organization permission
  ///
  /// Updates the properties of an existing organization permission. System permissions cannot be updated.
  ///
  /// Parameters:
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to update
  ///
  /// * [UpdateOrganizationPermissionRequest] updateOrganizationPermissionRequest (required):
  Future<Permission?> updateOrganizationPermission(
    String permissionId,
    UpdateOrganizationPermissionRequest updateOrganizationPermissionRequest,
  ) async {
    final response = await updateOrganizationPermissionWithHttpInfo(
      permissionId,
      updateOrganizationPermissionRequest,
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
        'Permission',
      ) as Permission;
    }
    return null;
  }
}
