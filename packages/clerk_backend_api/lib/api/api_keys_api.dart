//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class APIKeysApi {
  APIKeysApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create an API Key
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateApiKeyRequest] createApiKeyRequest (required):
  Future<http.Response> createApiKeyWithHttpInfo(
    CreateApiKeyRequest createApiKeyRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api_keys';

    // ignore: prefer_final_locals
    Object? postBody = createApiKeyRequest;

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

  /// Create an API Key
  ///
  /// Parameters:
  ///
  /// * [CreateApiKeyRequest] createApiKeyRequest (required):
  Future<CreateApiKey200Response?> createApiKey(
    CreateApiKeyRequest createApiKeyRequest,
  ) async {
    final response = await createApiKeyWithHttpInfo(
      createApiKeyRequest,
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
        'CreateApiKey200Response',
      ) as CreateApiKey200Response;
    }
    return null;
  }

  /// Delete an API Key
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  Future<http.Response> deleteApiKeyWithHttpInfo(
    String apiKeyID,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api_keys/{apiKeyID}'.replaceAll('{apiKeyID}', apiKeyID);

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

  /// Delete an API Key
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  Future<DeleteApiKey200Response?> deleteApiKey(
    String apiKeyID,
  ) async {
    final response = await deleteApiKeyWithHttpInfo(
      apiKeyID,
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
        'DeleteApiKey200Response',
      ) as DeleteApiKey200Response;
    }
    return null;
  }

  /// Get an API Key by ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  Future<http.Response> getApiKeyWithHttpInfo(
    String apiKeyID,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api_keys/{apiKeyID}'.replaceAll('{apiKeyID}', apiKeyID);

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

  /// Get an API Key by ID
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  Future<GetApiKeys200ResponseDataInner?> getApiKey(
    String apiKeyID,
  ) async {
    final response = await getApiKeyWithHttpInfo(
      apiKeyID,
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
        'GetApiKeys200ResponseDataInner',
      ) as GetApiKeys200ResponseDataInner;
    }
    return null;
  }

  /// Get an API Key Secret
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  Future<http.Response> getApiKeySecretWithHttpInfo(
    String apiKeyID,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/api_keys/{apiKeyID}/secret'.replaceAll('{apiKeyID}', apiKeyID);

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

  /// Get an API Key Secret
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  Future<GetApiKeySecret200Response?> getApiKeySecret(
    String apiKeyID,
  ) async {
    final response = await getApiKeySecretWithHttpInfo(
      apiKeyID,
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
        'GetApiKeySecret200Response',
      ) as GetApiKeySecret200Response;
    }
    return null;
  }

  /// Get API Keys
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] subject (required):
  ///
  /// * [String] type:
  ///
  /// * [String] includeInvalid:
  ///
  /// * [num] limit:
  ///
  /// * [num] offset:
  ///
  /// * [String] query:
  Future<http.Response> getApiKeysWithHttpInfo(
    String subject, {
    String? type,
    String? includeInvalid,
    num? limit,
    num? offset,
    String? query,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api_keys';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (type != null) {
      queryParams.addAll(_queryParams('', 'type', type));
    }
    queryParams.addAll(_queryParams('', 'subject', subject));
    if (includeInvalid != null) {
      queryParams.addAll(_queryParams('', 'include_invalid', includeInvalid));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
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

  /// Get API Keys
  ///
  /// Parameters:
  ///
  /// * [String] subject (required):
  ///
  /// * [String] type:
  ///
  /// * [String] includeInvalid:
  ///
  /// * [num] limit:
  ///
  /// * [num] offset:
  ///
  /// * [String] query:
  Future<GetApiKeys200Response?> getApiKeys(
    String subject, {
    String? type,
    String? includeInvalid,
    num? limit,
    num? offset,
    String? query,
  }) async {
    final response = await getApiKeysWithHttpInfo(
      subject,
      type: type,
      includeInvalid: includeInvalid,
      limit: limit,
      offset: offset,
      query: query,
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
        'GetApiKeys200Response',
      ) as GetApiKeys200Response;
    }
    return null;
  }

  /// Revoke an API Key
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  ///
  /// * [RevokeApiKeyRequest] revokeApiKeyRequest (required):
  Future<http.Response> revokeApiKeyWithHttpInfo(
    String apiKeyID,
    RevokeApiKeyRequest revokeApiKeyRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/api_keys/{apiKeyID}/revoke'.replaceAll('{apiKeyID}', apiKeyID);

    // ignore: prefer_final_locals
    Object? postBody = revokeApiKeyRequest;

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

  /// Revoke an API Key
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  ///
  /// * [RevokeApiKeyRequest] revokeApiKeyRequest (required):
  Future<GetApiKeys200ResponseDataInner?> revokeApiKey(
    String apiKeyID,
    RevokeApiKeyRequest revokeApiKeyRequest,
  ) async {
    final response = await revokeApiKeyWithHttpInfo(
      apiKeyID,
      revokeApiKeyRequest,
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
        'GetApiKeys200ResponseDataInner',
      ) as GetApiKeys200ResponseDataInner;
    }
    return null;
  }

  /// Update an API Key
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  ///
  /// * [UpdateApiKeyRequest] updateApiKeyRequest (required):
  Future<http.Response> updateApiKeyWithHttpInfo(
    String apiKeyID,
    UpdateApiKeyRequest updateApiKeyRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api_keys/{apiKeyID}'.replaceAll('{apiKeyID}', apiKeyID);

    // ignore: prefer_final_locals
    Object? postBody = updateApiKeyRequest;

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

  /// Update an API Key
  ///
  /// Parameters:
  ///
  /// * [String] apiKeyID (required):
  ///
  /// * [UpdateApiKeyRequest] updateApiKeyRequest (required):
  Future<GetApiKeys200ResponseDataInner?> updateApiKey(
    String apiKeyID,
    UpdateApiKeyRequest updateApiKeyRequest,
  ) async {
    final response = await updateApiKeyWithHttpInfo(
      apiKeyID,
      updateApiKeyRequest,
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
        'GetApiKeys200ResponseDataInner',
      ) as GetApiKeys200ResponseDataInner;
    }
    return null;
  }

  /// Verify an API Key
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [VerifyApiKeyRequest] verifyApiKeyRequest (required):
  Future<http.Response> verifyApiKeyWithHttpInfo(
    VerifyApiKeyRequest verifyApiKeyRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api_keys/verify';

    // ignore: prefer_final_locals
    Object? postBody = verifyApiKeyRequest;

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

  /// Verify an API Key
  ///
  /// Parameters:
  ///
  /// * [VerifyApiKeyRequest] verifyApiKeyRequest (required):
  Future<GetApiKeys200ResponseDataInner?> verifyApiKey(
    VerifyApiKeyRequest verifyApiKeyRequest,
  ) async {
    final response = await verifyApiKeyWithHttpInfo(
      verifyApiKeyRequest,
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
        'GetApiKeys200ResponseDataInner',
      ) as GetApiKeys200ResponseDataInner;
    }
    return null;
  }
}
