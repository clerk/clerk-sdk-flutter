//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ClientsApi {
  ClientsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get a client
  ///
  /// Returns the details of a client.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] clientId (required):
  ///   Client ID.
  Future<http.Response> getClientWithHttpInfo(
    String clientId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/clients/{client_id}'.replaceAll('{client_id}', clientId);

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

  /// Get a client
  ///
  /// Returns the details of a client.
  ///
  /// Parameters:
  ///
  /// * [String] clientId (required):
  ///   Client ID.
  Future<Client?> getClient(
    String clientId,
  ) async {
    final response = await getClientWithHttpInfo(
      clientId,
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
        'Client',
      ) as Client;
    }
    return null;
  }

  /// List all clients
  ///
  /// Returns a list of all clients. The clients are returned sorted by creation date, with the newest clients appearing first. Warning: the endpoint is being deprecated and will be removed in future versions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> getClientListWithHttpInfo({
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/clients';

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

  /// List all clients
  ///
  /// Returns a list of all clients. The clients are returned sorted by creation date, with the newest clients appearing first. Warning: the endpoint is being deprecated and will be removed in future versions.
  ///
  /// Parameters:
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<List<Client>?> getClientList({
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    final response = await getClientListWithHttpInfo(
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
      return (await apiClient.deserializeAsync(responseBody, 'List<Client>')
              as List)
          .cast<Client>()
          .toList(growable: false);
    }
    return null;
  }

  /// Verify a client
  ///
  /// Verifies the client in the provided token
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [VerifyClientRequest] verifyClientRequest:
  ///   Parameters.
  Future<http.Response> verifyClientWithHttpInfo({
    VerifyClientRequest? verifyClientRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/clients/verify';

    // ignore: prefer_final_locals
    Object? postBody = verifyClientRequest;

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

  /// Verify a client
  ///
  /// Verifies the client in the provided token
  ///
  /// Parameters:
  ///
  /// * [VerifyClientRequest] verifyClientRequest:
  ///   Parameters.
  Future<Client?> verifyClient({
    VerifyClientRequest? verifyClientRequest,
  }) async {
    final response = await verifyClientWithHttpInfo(
      verifyClientRequest: verifyClientRequest,
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
        'Client',
      ) as Client;
    }
    return null;
  }
}
