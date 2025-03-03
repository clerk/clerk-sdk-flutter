//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AllowListBlockListApi {
  AllowListBlockListApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add identifier to the allow-list
  ///
  /// Create an identifier allowed to sign up to an instance
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateAllowlistIdentifierRequest] createAllowlistIdentifierRequest:
  Future<http.Response> createAllowlistIdentifierWithHttpInfo({
    CreateAllowlistIdentifierRequest? createAllowlistIdentifierRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/allowlist_identifiers';

    // ignore: prefer_final_locals
    Object? postBody = createAllowlistIdentifierRequest;

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

  /// Add identifier to the allow-list
  ///
  /// Create an identifier allowed to sign up to an instance
  ///
  /// Parameters:
  ///
  /// * [CreateAllowlistIdentifierRequest] createAllowlistIdentifierRequest:
  Future<AllowlistIdentifier?> createAllowlistIdentifier({
    CreateAllowlistIdentifierRequest? createAllowlistIdentifierRequest,
  }) async {
    final response = await createAllowlistIdentifierWithHttpInfo(
      createAllowlistIdentifierRequest: createAllowlistIdentifierRequest,
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
        'AllowlistIdentifier',
      ) as AllowlistIdentifier;
    }
    return null;
  }

  /// Add identifier to the block-list
  ///
  /// Create an identifier that is blocked from accessing an instance
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateBlocklistIdentifierRequest] createBlocklistIdentifierRequest:
  Future<http.Response> createBlocklistIdentifierWithHttpInfo({
    CreateBlocklistIdentifierRequest? createBlocklistIdentifierRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/blocklist_identifiers';

    // ignore: prefer_final_locals
    Object? postBody = createBlocklistIdentifierRequest;

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

  /// Add identifier to the block-list
  ///
  /// Create an identifier that is blocked from accessing an instance
  ///
  /// Parameters:
  ///
  /// * [CreateBlocklistIdentifierRequest] createBlocklistIdentifierRequest:
  Future<BlocklistIdentifier?> createBlocklistIdentifier({
    CreateBlocklistIdentifierRequest? createBlocklistIdentifierRequest,
  }) async {
    final response = await createBlocklistIdentifierWithHttpInfo(
      createBlocklistIdentifierRequest: createBlocklistIdentifierRequest,
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
        'BlocklistIdentifier',
      ) as BlocklistIdentifier;
    }
    return null;
  }

  /// Delete identifier from allow-list
  ///
  /// Delete an identifier from the instance allow-list
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] identifierId (required):
  ///   The ID of the identifier to delete from the allow-list
  Future<http.Response> deleteAllowlistIdentifierWithHttpInfo(
    String identifierId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/allowlist_identifiers/{identifier_id}'
        .replaceAll('{identifier_id}', identifierId);

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

  /// Delete identifier from allow-list
  ///
  /// Delete an identifier from the instance allow-list
  ///
  /// Parameters:
  ///
  /// * [String] identifierId (required):
  ///   The ID of the identifier to delete from the allow-list
  Future<DeletedObject?> deleteAllowlistIdentifier(
    String identifierId,
  ) async {
    final response = await deleteAllowlistIdentifierWithHttpInfo(
      identifierId,
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

  /// Delete identifier from block-list
  ///
  /// Delete an identifier from the instance block-list
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] identifierId (required):
  ///   The ID of the identifier to delete from the block-list
  Future<http.Response> deleteBlocklistIdentifierWithHttpInfo(
    String identifierId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/blocklist_identifiers/{identifier_id}'
        .replaceAll('{identifier_id}', identifierId);

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

  /// Delete identifier from block-list
  ///
  /// Delete an identifier from the instance block-list
  ///
  /// Parameters:
  ///
  /// * [String] identifierId (required):
  ///   The ID of the identifier to delete from the block-list
  Future<DeletedObject?> deleteBlocklistIdentifier(
    String identifierId,
  ) async {
    final response = await deleteBlocklistIdentifierWithHttpInfo(
      identifierId,
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

  /// List all identifiers on the allow-list
  ///
  /// Get a list of all identifiers allowed to sign up to an instance
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
  Future<http.Response> listAllowlistIdentifiersWithHttpInfo({
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/allowlist_identifiers';

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

  /// List all identifiers on the allow-list
  ///
  /// Get a list of all identifiers allowed to sign up to an instance
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
  Future<List<AllowlistIdentifier>?> listAllowlistIdentifiers({
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    final response = await listAllowlistIdentifiersWithHttpInfo(
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
      return (await apiClient.deserializeAsync(
              responseBody, 'List<AllowlistIdentifier>') as List)
          .cast<AllowlistIdentifier>()
          .toList(growable: false);
    }
    return null;
  }

  /// List all identifiers on the block-list
  ///
  /// Get a list of all identifiers which are not allowed to access an instance
  ///
  /// Note: This method returns the HTTP [Response].
  Future<http.Response> listBlocklistIdentifiersWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/blocklist_identifiers';

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

  /// List all identifiers on the block-list
  ///
  /// Get a list of all identifiers which are not allowed to access an instance
  Future<BlocklistIdentifiers?> listBlocklistIdentifiers() async {
    final response = await listBlocklistIdentifiersWithHttpInfo();
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
        'BlocklistIdentifiers',
      ) as BlocklistIdentifiers;
    }
    return null;
  }
}
