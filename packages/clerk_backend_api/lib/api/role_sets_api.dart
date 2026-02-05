//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RoleSetsApi {
  RoleSetsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add roles to a role set
  ///
  /// Adds one or more roles to an existing role set. You can optionally update the default role or creator role when adding new roles.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set
  ///
  /// * [AddRolesToRoleSetRequest] addRolesToRoleSetRequest (required):
  Future<http.Response> addRolesToRoleSetWithHttpInfo(
    String roleSetKeyOrId,
    AddRolesToRoleSetRequest addRolesToRoleSetRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/role_sets/{role_set_key_or_id}/roles'
        .replaceAll('{role_set_key_or_id}', roleSetKeyOrId);

    // ignore: prefer_final_locals
    Object? postBody = addRolesToRoleSetRequest;

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

  /// Add roles to a role set
  ///
  /// Adds one or more roles to an existing role set. You can optionally update the default role or creator role when adding new roles.
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set
  ///
  /// * [AddRolesToRoleSetRequest] addRolesToRoleSetRequest (required):
  Future<RoleSet?> addRolesToRoleSet(
    String roleSetKeyOrId,
    AddRolesToRoleSetRequest addRolesToRoleSetRequest,
  ) async {
    final response = await addRolesToRoleSetWithHttpInfo(
      roleSetKeyOrId,
      addRolesToRoleSetRequest,
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
        'RoleSet',
      ) as RoleSet;
    }
    return null;
  }

  /// Create a role set
  ///
  /// Creates a new role set with the given name and roles. The key must be unique for the instance and start with the 'role_set:' prefix, followed by lowercase alphanumeric characters and underscores only. You must provide at least one role and specify a default role key and creator role key.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateRoleSetRequest] createRoleSetRequest (required):
  Future<http.Response> createRoleSetWithHttpInfo(
    CreateRoleSetRequest createRoleSetRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/role_sets';

    // ignore: prefer_final_locals
    Object? postBody = createRoleSetRequest;

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

  /// Create a role set
  ///
  /// Creates a new role set with the given name and roles. The key must be unique for the instance and start with the 'role_set:' prefix, followed by lowercase alphanumeric characters and underscores only. You must provide at least one role and specify a default role key and creator role key.
  ///
  /// Parameters:
  ///
  /// * [CreateRoleSetRequest] createRoleSetRequest (required):
  Future<RoleSet?> createRoleSet(
    CreateRoleSetRequest createRoleSetRequest,
  ) async {
    final response = await createRoleSetWithHttpInfo(
      createRoleSetRequest,
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
        'RoleSet',
      ) as RoleSet;
    }
    return null;
  }

  /// Retrieve a role set
  ///
  /// Retrieves an existing role set by its key or ID.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set
  Future<http.Response> getRoleSetWithHttpInfo(
    String roleSetKeyOrId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/role_sets/{role_set_key_or_id}'
        .replaceAll('{role_set_key_or_id}', roleSetKeyOrId);

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

  /// Retrieve a role set
  ///
  /// Retrieves an existing role set by its key or ID.
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set
  Future<RoleSet?> getRoleSet(
    String roleSetKeyOrId,
  ) async {
    final response = await getRoleSetWithHttpInfo(
      roleSetKeyOrId,
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
        'RoleSet',
      ) as RoleSet;
    }
    return null;
  }

  /// Get a list of role sets
  ///
  /// Returns a list of role sets for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. The role sets are ordered by descending creation date by default.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   Returns role sets with ID, name, or key that match the given query. Uses exact match for role set ID and partial match for name and key.
  ///
  /// * [String] orderBy:
  ///   Allows to return role sets in a particular order. At the moment, you can order the returned role sets by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want role sets to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> listRoleSetsWithHttpInfo({
    String? query,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/role_sets';

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

  /// Get a list of role sets
  ///
  /// Returns a list of role sets for the instance. Results can be paginated using the optional `limit` and `offset` query parameters. The role sets are ordered by descending creation date by default.
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   Returns role sets with ID, name, or key that match the given query. Uses exact match for role set ID and partial match for name and key.
  ///
  /// * [String] orderBy:
  ///   Allows to return role sets in a particular order. At the moment, you can order the returned role sets by their `created_at`, `name`, or `key`. In order to specify the direction, you can use the `+/-` symbols prepended in the property to order by. For example, if you want role sets to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<RoleSets?> listRoleSets({
    String? query,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final response = await listRoleSetsWithHttpInfo(
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
        'RoleSets',
      ) as RoleSets;
    }
    return null;
  }

  /// Replace a role in a role set
  ///
  /// Replaces a role in a role set with another role. This atomically removes the source role and reassigns any members to the destination role.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set
  ///
  /// * [ReplaceRoleInRoleSetRequest] replaceRoleInRoleSetRequest (required):
  Future<http.Response> replaceRoleInRoleSetWithHttpInfo(
    String roleSetKeyOrId,
    ReplaceRoleInRoleSetRequest replaceRoleInRoleSetRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/role_sets/{role_set_key_or_id}/roles/replace'
        .replaceAll('{role_set_key_or_id}', roleSetKeyOrId);

    // ignore: prefer_final_locals
    Object? postBody = replaceRoleInRoleSetRequest;

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

  /// Replace a role in a role set
  ///
  /// Replaces a role in a role set with another role. This atomically removes the source role and reassigns any members to the destination role.
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set
  ///
  /// * [ReplaceRoleInRoleSetRequest] replaceRoleInRoleSetRequest (required):
  Future<RoleSet?> replaceRoleInRoleSet(
    String roleSetKeyOrId,
    ReplaceRoleInRoleSetRequest replaceRoleInRoleSetRequest,
  ) async {
    final response = await replaceRoleInRoleSetWithHttpInfo(
      roleSetKeyOrId,
      replaceRoleInRoleSetRequest,
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
        'RoleSet',
      ) as RoleSet;
    }
    return null;
  }

  /// Replace a role set
  ///
  /// Replaces a role set with another role set. This is functionally equivalent to deleting the role set but allows for atomic replacement with migration support. Organizations using this role set will be migrated to the destination role set.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set to replace
  ///
  /// * [ReplaceRoleSetRequest] replaceRoleSetRequest (required):
  Future<http.Response> replaceRoleSetWithHttpInfo(
    String roleSetKeyOrId,
    ReplaceRoleSetRequest replaceRoleSetRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/role_sets/{role_set_key_or_id}/replace'
        .replaceAll('{role_set_key_or_id}', roleSetKeyOrId);

    // ignore: prefer_final_locals
    Object? postBody = replaceRoleSetRequest;

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

  /// Replace a role set
  ///
  /// Replaces a role set with another role set. This is functionally equivalent to deleting the role set but allows for atomic replacement with migration support. Organizations using this role set will be migrated to the destination role set.
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set to replace
  ///
  /// * [ReplaceRoleSetRequest] replaceRoleSetRequest (required):
  Future<DeletedObject?> replaceRoleSet(
    String roleSetKeyOrId,
    ReplaceRoleSetRequest replaceRoleSetRequest,
  ) async {
    final response = await replaceRoleSetWithHttpInfo(
      roleSetKeyOrId,
      replaceRoleSetRequest,
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

  /// Update a role set
  ///
  /// Updates an existing role set. You can update the name, key, description, type, default role, or creator role. All parameters are optional - you can update only the fields you want to change.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set to update
  ///
  /// * [UpdateRoleSetRequest] updateRoleSetRequest (required):
  Future<http.Response> updateRoleSetWithHttpInfo(
    String roleSetKeyOrId,
    UpdateRoleSetRequest updateRoleSetRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/role_sets/{role_set_key_or_id}'
        .replaceAll('{role_set_key_or_id}', roleSetKeyOrId);

    // ignore: prefer_final_locals
    Object? postBody = updateRoleSetRequest;

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

  /// Update a role set
  ///
  /// Updates an existing role set. You can update the name, key, description, type, default role, or creator role. All parameters are optional - you can update only the fields you want to change.
  ///
  /// Parameters:
  ///
  /// * [String] roleSetKeyOrId (required):
  ///   The key or ID of the role set to update
  ///
  /// * [UpdateRoleSetRequest] updateRoleSetRequest (required):
  Future<RoleSet?> updateRoleSet(
    String roleSetKeyOrId,
    UpdateRoleSetRequest updateRoleSetRequest,
  ) async {
    final response = await updateRoleSetWithHttpInfo(
      roleSetKeyOrId,
      updateRoleSetRequest,
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
        'RoleSet',
      ) as RoleSet;
    }
    return null;
  }
}
