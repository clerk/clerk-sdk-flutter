//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SAMLConnectionsApi {
  SAMLConnectionsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a SAML Connection
  ///
  /// Create a new SAML Connection.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateSAMLConnectionRequest] createSAMLConnectionRequest:
  Future<http.Response> createSAMLConnectionWithHttpInfo({
    CreateSAMLConnectionRequest? createSAMLConnectionRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/saml_connections';

    // ignore: prefer_final_locals
    Object? postBody = createSAMLConnectionRequest;

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

  /// Create a SAML Connection
  ///
  /// Create a new SAML Connection.
  ///
  /// Parameters:
  ///
  /// * [CreateSAMLConnectionRequest] createSAMLConnectionRequest:
  Future<SchemasSAMLConnection?> createSAMLConnection({
    CreateSAMLConnectionRequest? createSAMLConnectionRequest,
  }) async {
    final response = await createSAMLConnectionWithHttpInfo(
      createSAMLConnectionRequest: createSAMLConnectionRequest,
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
        'SchemasSAMLConnection',
      ) as SchemasSAMLConnection;
    }
    return null;
  }

  /// Delete a SAML Connection
  ///
  /// Deletes the SAML Connection whose ID matches the provided `id` in the path.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] samlConnectionId (required):
  ///   The ID of the SAML Connection to delete
  Future<http.Response> deleteSAMLConnectionWithHttpInfo(
    String samlConnectionId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/saml_connections/{saml_connection_id}'
        .replaceAll('{saml_connection_id}', samlConnectionId);

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

  /// Delete a SAML Connection
  ///
  /// Deletes the SAML Connection whose ID matches the provided `id` in the path.
  ///
  /// Parameters:
  ///
  /// * [String] samlConnectionId (required):
  ///   The ID of the SAML Connection to delete
  Future<DeletedObject?> deleteSAMLConnection(
    String samlConnectionId,
  ) async {
    final response = await deleteSAMLConnectionWithHttpInfo(
      samlConnectionId,
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

  /// Retrieve a SAML Connection by ID
  ///
  /// Fetches the SAML Connection whose ID matches the provided `saml_connection_id` in the path.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] samlConnectionId (required):
  ///   The ID of the SAML Connection
  Future<http.Response> getSAMLConnectionWithHttpInfo(
    String samlConnectionId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/saml_connections/{saml_connection_id}'
        .replaceAll('{saml_connection_id}', samlConnectionId);

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

  /// Retrieve a SAML Connection by ID
  ///
  /// Fetches the SAML Connection whose ID matches the provided `saml_connection_id` in the path.
  ///
  /// Parameters:
  ///
  /// * [String] samlConnectionId (required):
  ///   The ID of the SAML Connection
  Future<SchemasSAMLConnection?> getSAMLConnection(
    String samlConnectionId,
  ) async {
    final response = await getSAMLConnectionWithHttpInfo(
      samlConnectionId,
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
        'SchemasSAMLConnection',
      ) as SchemasSAMLConnection;
    }
    return null;
  }

  /// Get a list of SAML Connections for an instance
  ///
  /// Returns the list of SAML Connections for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The SAML Connections are ordered by descending creation date and the most recent will be returned first.
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
  ///   Returns SAML connections that have a name that matches the given query, via case-insensitive partial match.
  ///
  /// * [String] orderBy:
  ///   Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.
  ///
  /// * [List<String>] organizationId:
  ///   Returns SAML connections that have an associated organization ID to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids.
  Future<http.Response> listSAMLConnectionsWithHttpInfo({
    int? limit,
    int? offset,
    String? query,
    String? orderBy,
    List<String>? organizationId,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/saml_connections';

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
    if (organizationId != null) {
      queryParams
          .addAll(_queryParams('multi', 'organization_id', organizationId));
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

  /// Get a list of SAML Connections for an instance
  ///
  /// Returns the list of SAML Connections for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The SAML Connections are ordered by descending creation date and the most recent will be returned first.
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
  ///   Returns SAML connections that have a name that matches the given query, via case-insensitive partial match.
  ///
  /// * [String] orderBy:
  ///   Sorts organizations memberships by phone_number, email_address, created_at, first_name, last_name or username. By prepending one of those values with + or -, we can choose to sort in ascending (ASC) or descending (DESC) order.
  ///
  /// * [List<String>] organizationId:
  ///   Returns SAML connections that have an associated organization ID to the given organizations. For each organization id, the `+` and `-` can be prepended to the id, which denote whether the respective organization should be included or excluded from the result set. Accepts up to 100 organization ids.
  Future<SAMLConnections?> listSAMLConnections({
    int? limit,
    int? offset,
    String? query,
    String? orderBy,
    List<String>? organizationId,
  }) async {
    final response = await listSAMLConnectionsWithHttpInfo(
      limit: limit,
      offset: offset,
      query: query,
      orderBy: orderBy,
      organizationId: organizationId,
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
        'SAMLConnections',
      ) as SAMLConnections;
    }
    return null;
  }

  /// Update a SAML Connection
  ///
  /// Updates the SAML Connection whose ID matches the provided `id` in the path.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] samlConnectionId (required):
  ///   The ID of the SAML Connection to update
  ///
  /// * [UpdateSAMLConnectionRequest] updateSAMLConnectionRequest (required):
  Future<http.Response> updateSAMLConnectionWithHttpInfo(
    String samlConnectionId,
    UpdateSAMLConnectionRequest updateSAMLConnectionRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/saml_connections/{saml_connection_id}'
        .replaceAll('{saml_connection_id}', samlConnectionId);

    // ignore: prefer_final_locals
    Object? postBody = updateSAMLConnectionRequest;

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

  /// Update a SAML Connection
  ///
  /// Updates the SAML Connection whose ID matches the provided `id` in the path.
  ///
  /// Parameters:
  ///
  /// * [String] samlConnectionId (required):
  ///   The ID of the SAML Connection to update
  ///
  /// * [UpdateSAMLConnectionRequest] updateSAMLConnectionRequest (required):
  Future<SchemasSAMLConnection?> updateSAMLConnection(
    String samlConnectionId,
    UpdateSAMLConnectionRequest updateSAMLConnectionRequest,
  ) async {
    final response = await updateSAMLConnectionWithHttpInfo(
      samlConnectionId,
      updateSAMLConnectionRequest,
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
        'SchemasSAMLConnection',
      ) as SchemasSAMLConnection;
    }
    return null;
  }
}
