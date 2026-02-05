//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationRolesApi {
  OrganizationRolesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Assign a permission to an organization role
  ///
  /// Assigns a permission to an organization role
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to assign
  Future<http.Response> assignPermissionToOrganizationRoleWithHttpInfo(
    String organizationRoleId,
    String permissionId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/organization_roles/{organization_role_id}/permissions/{permission_id}'
            .replaceAll('{organization_role_id}', organizationRoleId)
            .replaceAll('{permission_id}', permissionId);

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

  /// Assign a permission to an organization role
  ///
  /// Assigns a permission to an organization role
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to assign
  Future<Role?> assignPermissionToOrganizationRole(
    String organizationRoleId,
    String permissionId,
  ) async {
    final response = await assignPermissionToOrganizationRoleWithHttpInfo(
      organizationRoleId,
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
        'Role',
      ) as Role;
    }
    return null;
  }

  /// Create an organization role
  ///
  /// Creates a new organization role with the given name and permissions for an instance. The key must be unique for the instance and start with the 'org:' prefix, followed by lowercase alphanumeric characters and underscores only. You can optionally provide a description for the role and specify whether it should be included in the initial role set. Organization roles support permissions that can be assigned to control access within the organization.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateOrganizationRoleRequest] createOrganizationRoleRequest (required):
  Future<http.Response> createOrganizationRoleWithHttpInfo(
    CreateOrganizationRoleRequest createOrganizationRoleRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_roles';

    // ignore: prefer_final_locals
    Object? postBody = createOrganizationRoleRequest;

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

  /// Create an organization role
  ///
  /// Creates a new organization role with the given name and permissions for an instance. The key must be unique for the instance and start with the 'org:' prefix, followed by lowercase alphanumeric characters and underscores only. You can optionally provide a description for the role and specify whether it should be included in the initial role set. Organization roles support permissions that can be assigned to control access within the organization.
  ///
  /// Parameters:
  ///
  /// * [CreateOrganizationRoleRequest] createOrganizationRoleRequest (required):
  Future<Role?> createOrganizationRole(
    CreateOrganizationRoleRequest createOrganizationRoleRequest,
  ) async {
    final response = await createOrganizationRoleWithHttpInfo(
      createOrganizationRoleRequest,
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
        'Role',
      ) as Role;
    }
    return null;
  }

  /// Delete an organization role
  ///
  /// Deletes the organization role. The role cannot be deleted if it is currently used as the default creator role, domain default role, assigned to any members, or exists in any invitations.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role to delete
  Future<http.Response> deleteOrganizationRoleWithHttpInfo(
    String organizationRoleId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_roles/{organization_role_id}'
        .replaceAll('{organization_role_id}', organizationRoleId);

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

  /// Delete an organization role
  ///
  /// Deletes the organization role. The role cannot be deleted if it is currently used as the default creator role, domain default role, assigned to any members, or exists in any invitations.
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role to delete
  Future<DeletedObject?> deleteOrganizationRole(
    String organizationRoleId,
  ) async {
    final response = await deleteOrganizationRoleWithHttpInfo(
      organizationRoleId,
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

  /// Retrieve an organization role
  ///
  /// Use this request to retrieve an existing organization role by its ID.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role
  Future<http.Response> getOrganizationRoleWithHttpInfo(
    String organizationRoleId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_roles/{organization_role_id}'
        .replaceAll('{organization_role_id}', organizationRoleId);

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

  /// Retrieve an organization role
  ///
  /// Use this request to retrieve an existing organization role by its ID.
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role
  Future<Role?> getOrganizationRole(
    String organizationRoleId,
  ) async {
    final response = await getOrganizationRoleWithHttpInfo(
      organizationRoleId,
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
        'Role',
      ) as Role;
    }
    return null;
  }

  /// Get a list of organization roles
  ///
  /// This request returns the list of organization roles for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. The organization roles are ordered by descending creation date. Most recent roles will be returned first.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   Returns organization roles with ID, name, or key that match the given query. Uses exact match for organization role ID and partial match for name and key.
  ///
  /// * [String] orderBy:
  ///   Allows to return organization roles in a particular order. At the moment, you can order the returned organization roles by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organization roles to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> listOrganizationRolesWithHttpInfo({
    String? query,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_roles';

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

  /// Get a list of organization roles
  ///
  /// This request returns the list of organization roles for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. The organization roles are ordered by descending creation date. Most recent roles will be returned first.
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   Returns organization roles with ID, name, or key that match the given query. Uses exact match for organization role ID and partial match for name and key.
  ///
  /// * [String] orderBy:
  ///   Allows to return organization roles in a particular order. At the moment, you can order the returned organization roles by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want organization roles to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<Roles?> listOrganizationRoles({
    String? query,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final response = await listOrganizationRolesWithHttpInfo(
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
        'Roles',
      ) as Roles;
    }
    return null;
  }

  /// Remove a permission from an organization role
  ///
  /// Removes a permission from an organization role
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to remove
  Future<http.Response> removePermissionFromOrganizationRoleWithHttpInfo(
    String organizationRoleId,
    String permissionId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/organization_roles/{organization_role_id}/permissions/{permission_id}'
            .replaceAll('{organization_role_id}', organizationRoleId)
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

  /// Remove a permission from an organization role
  ///
  /// Removes a permission from an organization role
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role
  ///
  /// * [String] permissionId (required):
  ///   The ID of the permission to remove
  Future<Role?> removePermissionFromOrganizationRole(
    String organizationRoleId,
    String permissionId,
  ) async {
    final response = await removePermissionFromOrganizationRoleWithHttpInfo(
      organizationRoleId,
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
        'Role',
      ) as Role;
    }
    return null;
  }

  /// Update an organization role
  ///
  /// Updates an existing organization role. You can update the name, key, description, and permissions of the role. All parameters are optional - you can update only the fields you want to change. If the role is used as a creator role or domain default role, updating the key will cascade the update to the organization settings.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role to update
  ///
  /// * [UpdateOrganizationRoleRequest] updateOrganizationRoleRequest (required):
  Future<http.Response> updateOrganizationRoleWithHttpInfo(
    String organizationRoleId,
    UpdateOrganizationRoleRequest updateOrganizationRoleRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_roles/{organization_role_id}'
        .replaceAll('{organization_role_id}', organizationRoleId);

    // ignore: prefer_final_locals
    Object? postBody = updateOrganizationRoleRequest;

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

  /// Update an organization role
  ///
  /// Updates an existing organization role. You can update the name, key, description, and permissions of the role. All parameters are optional - you can update only the fields you want to change. If the role is used as a creator role or domain default role, updating the key will cascade the update to the organization settings.
  ///
  /// Parameters:
  ///
  /// * [String] organizationRoleId (required):
  ///   The ID of the organization role to update
  ///
  /// * [UpdateOrganizationRoleRequest] updateOrganizationRoleRequest (required):
  Future<Role?> updateOrganizationRole(
    String organizationRoleId,
    UpdateOrganizationRoleRequest updateOrganizationRoleRequest,
  ) async {
    final response = await updateOrganizationRoleWithHttpInfo(
      organizationRoleId,
      updateOrganizationRoleRequest,
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
        'Role',
      ) as Role;
    }
    return null;
  }
}
