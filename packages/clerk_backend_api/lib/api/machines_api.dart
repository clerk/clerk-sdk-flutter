//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MachinesApi {
  MachinesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a machine
  ///
  /// Creates a new machine.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateMachineRequest] createMachineRequest:
  Future<http.Response> createMachineWithHttpInfo({
    CreateMachineRequest? createMachineRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/machines';

    // ignore: prefer_final_locals
    Object? postBody = createMachineRequest;

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

  /// Create a machine
  ///
  /// Creates a new machine.
  ///
  /// Parameters:
  ///
  /// * [CreateMachineRequest] createMachineRequest:
  Future<CreateMachine200Response?> createMachine({
    CreateMachineRequest? createMachineRequest,
  }) async {
    final response = await createMachineWithHttpInfo(
      createMachineRequest: createMachineRequest,
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
        'CreateMachine200Response',
      ) as CreateMachine200Response;
    }
    return null;
  }

  /// Create a machine scope
  ///
  /// Creates a new machine scope, allowing the specified machine to access another machine. Maximum of 150 scopes per machine.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine that will have access to another machine
  ///
  /// * [CreateMachineScopeRequest] createMachineScopeRequest:
  Future<http.Response> createMachineScopeWithHttpInfo(
    String machineId, {
    CreateMachineScopeRequest? createMachineScopeRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/machines/{machine_id}/scopes'.replaceAll('{machine_id}', machineId);

    // ignore: prefer_final_locals
    Object? postBody = createMachineScopeRequest;

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

  /// Create a machine scope
  ///
  /// Creates a new machine scope, allowing the specified machine to access another machine. Maximum of 150 scopes per machine.
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine that will have access to another machine
  ///
  /// * [CreateMachineScopeRequest] createMachineScopeRequest:
  Future<MachineScope?> createMachineScope(
    String machineId, {
    CreateMachineScopeRequest? createMachineScopeRequest,
  }) async {
    final response = await createMachineScopeWithHttpInfo(
      machineId,
      createMachineScopeRequest: createMachineScopeRequest,
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
        'MachineScope',
      ) as MachineScope;
    }
    return null;
  }

  /// Delete a machine
  ///
  /// Deletes a machine.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to delete
  Future<http.Response> deleteMachineWithHttpInfo(
    String machineId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/machines/{machine_id}'.replaceAll('{machine_id}', machineId);

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

  /// Delete a machine
  ///
  /// Deletes a machine.
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to delete
  Future<DeleteMachine200Response?> deleteMachine(
    String machineId,
  ) async {
    final response = await deleteMachineWithHttpInfo(
      machineId,
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
        'DeleteMachine200Response',
      ) as DeleteMachine200Response;
    }
    return null;
  }

  /// Delete a machine scope
  ///
  /// Deletes a machine scope, removing access from one machine to another.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine that has access to another machine
  ///
  /// * [String] otherMachineId (required):
  ///   The ID of the machine that is being accessed
  Future<http.Response> deleteMachineScopeWithHttpInfo(
    String machineId,
    String otherMachineId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/machines/{machine_id}/scopes/{other_machine_id}'
        .replaceAll('{machine_id}', machineId)
        .replaceAll('{other_machine_id}', otherMachineId);

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

  /// Delete a machine scope
  ///
  /// Deletes a machine scope, removing access from one machine to another.
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine that has access to another machine
  ///
  /// * [String] otherMachineId (required):
  ///   The ID of the machine that is being accessed
  Future<DeleteMachineScope200Response?> deleteMachineScope(
    String machineId,
    String otherMachineId,
  ) async {
    final response = await deleteMachineScopeWithHttpInfo(
      machineId,
      otherMachineId,
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
        'DeleteMachineScope200Response',
      ) as DeleteMachineScope200Response;
    }
    return null;
  }

  /// Retrieve a machine
  ///
  /// Returns the details of a machine.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to retrieve
  Future<http.Response> getMachineWithHttpInfo(
    String machineId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/machines/{machine_id}'.replaceAll('{machine_id}', machineId);

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

  /// Retrieve a machine
  ///
  /// Returns the details of a machine.
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to retrieve
  Future<Machine?> getMachine(
    String machineId,
  ) async {
    final response = await getMachineWithHttpInfo(
      machineId,
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
        'Machine',
      ) as Machine;
    }
    return null;
  }

  /// Retrieve a machine secret key
  ///
  /// Returns the secret key for a machine.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to retrieve the secret key for
  Future<http.Response> getMachineSecretKeyWithHttpInfo(
    String machineId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/machines/{machine_id}/secret_key'
        .replaceAll('{machine_id}', machineId);

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

  /// Retrieve a machine secret key
  ///
  /// Returns the secret key for a machine.
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to retrieve the secret key for
  Future<GetMachineSecretKey200Response?> getMachineSecretKey(
    String machineId,
  ) async {
    final response = await getMachineSecretKeyWithHttpInfo(
      machineId,
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
        'GetMachineSecretKey200Response',
      ) as GetMachineSecretKey200Response;
    }
    return null;
  }

  /// Get a list of machines for an instance
  ///
  /// This request returns the list of machines for an instance. The machines are ordered by descending creation date (i.e. most recent machines will be returned first)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] query:
  ///   Returns machines with ID or name that match the given query. Uses exact match for machine ID and partial match for name.
  ///
  /// * [String] orderBy:
  ///   Allows to return machines in a particular order. You can order the returned machines by their `name` or `created_at`. To specify the direction, use the `+` or `-` symbols prepended to the property to order by. For example, to return machines in descending order by `created_at`, use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  Future<http.Response> listMachinesWithHttpInfo({
    int? limit,
    int? offset,
    String? query,
    String? orderBy,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/machines';

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
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
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

  /// Get a list of machines for an instance
  ///
  /// This request returns the list of machines for an instance. The machines are ordered by descending creation date (i.e. most recent machines will be returned first)
  ///
  /// Parameters:
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] query:
  ///   Returns machines with ID or name that match the given query. Uses exact match for machine ID and partial match for name.
  ///
  /// * [String] orderBy:
  ///   Allows to return machines in a particular order. You can order the returned machines by their `name` or `created_at`. To specify the direction, use the `+` or `-` symbols prepended to the property to order by. For example, to return machines in descending order by `created_at`, use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  Future<ListMachines200Response?> listMachines({
    int? limit,
    int? offset,
    String? query,
    String? orderBy,
  }) async {
    final response = await listMachinesWithHttpInfo(
      limit: limit,
      offset: offset,
      query: query,
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
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'ListMachines200Response',
      ) as ListMachines200Response;
    }
    return null;
  }

  /// Rotate a machine's secret key
  ///
  /// Rotates the machine's secret key. When the secret key is rotated, make sure to update it in your machine/application. The previous secret key will remain valid for the duration specified by the previous_token_ttl parameter.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to rotate the secret key for
  ///
  /// * [RotateMachineSecretKeyRequest] rotateMachineSecretKeyRequest (required):
  Future<http.Response> rotateMachineSecretKeyWithHttpInfo(
    String machineId,
    RotateMachineSecretKeyRequest rotateMachineSecretKeyRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/machines/{machine_id}/secret_key/rotate'
        .replaceAll('{machine_id}', machineId);

    // ignore: prefer_final_locals
    Object? postBody = rotateMachineSecretKeyRequest;

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

  /// Rotate a machine's secret key
  ///
  /// Rotates the machine's secret key. When the secret key is rotated, make sure to update it in your machine/application. The previous secret key will remain valid for the duration specified by the previous_token_ttl parameter.
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to rotate the secret key for
  ///
  /// * [RotateMachineSecretKeyRequest] rotateMachineSecretKeyRequest (required):
  Future<GetMachineSecretKey200Response?> rotateMachineSecretKey(
    String machineId,
    RotateMachineSecretKeyRequest rotateMachineSecretKeyRequest,
  ) async {
    final response = await rotateMachineSecretKeyWithHttpInfo(
      machineId,
      rotateMachineSecretKeyRequest,
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
        'GetMachineSecretKey200Response',
      ) as GetMachineSecretKey200Response;
    }
    return null;
  }

  /// Update a machine
  ///
  /// Updates an existing machine. Only the provided fields will be updated.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to update
  ///
  /// * [UpdateMachineRequest] updateMachineRequest:
  Future<http.Response> updateMachineWithHttpInfo(
    String machineId, {
    UpdateMachineRequest? updateMachineRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/machines/{machine_id}'.replaceAll('{machine_id}', machineId);

    // ignore: prefer_final_locals
    Object? postBody = updateMachineRequest;

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

  /// Update a machine
  ///
  /// Updates an existing machine. Only the provided fields will be updated.
  ///
  /// Parameters:
  ///
  /// * [String] machineId (required):
  ///   The ID of the machine to update
  ///
  /// * [UpdateMachineRequest] updateMachineRequest:
  Future<Machine?> updateMachine(
    String machineId, {
    UpdateMachineRequest? updateMachineRequest,
  }) async {
    final response = await updateMachineWithHttpInfo(
      machineId,
      updateMachineRequest: updateMachineRequest,
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
        'Machine',
      ) as Machine;
    }
    return null;
  }
}
