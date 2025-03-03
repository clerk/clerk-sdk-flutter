//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OAuthApplicationsApi {
  OAuthApplicationsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create an OAuth application
  ///
  /// Creates a new OAuth application with the given name and callback URL for an instance. The callback URL must be a valid url. All URL schemes are allowed such as `http://`, `https://`, `myapp://`, etc...
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateOAuthApplicationRequest] createOAuthApplicationRequest:
  Future<http.Response> createOAuthApplicationWithHttpInfo({
    CreateOAuthApplicationRequest? createOAuthApplicationRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/oauth_applications';

    // ignore: prefer_final_locals
    Object? postBody = createOAuthApplicationRequest;

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

  /// Create an OAuth application
  ///
  /// Creates a new OAuth application with the given name and callback URL for an instance. The callback URL must be a valid url. All URL schemes are allowed such as `http://`, `https://`, `myapp://`, etc...
  ///
  /// Parameters:
  ///
  /// * [CreateOAuthApplicationRequest] createOAuthApplicationRequest:
  Future<OAuthApplicationWithSecret?> createOAuthApplication({
    CreateOAuthApplicationRequest? createOAuthApplicationRequest,
  }) async {
    final response = await createOAuthApplicationWithHttpInfo(
      createOAuthApplicationRequest: createOAuthApplicationRequest,
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
        'OAuthApplicationWithSecret',
      ) as OAuthApplicationWithSecret;
    }
    return null;
  }

  /// Delete an OAuth application
  ///
  /// Deletes the given OAuth application. This is not reversible.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] oauthApplicationId (required):
  ///   The ID of the OAuth application to delete
  Future<http.Response> deleteOAuthApplicationWithHttpInfo(
    String oauthApplicationId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/oauth_applications/{oauth_application_id}'
        .replaceAll('{oauth_application_id}', oauthApplicationId);

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

  /// Delete an OAuth application
  ///
  /// Deletes the given OAuth application. This is not reversible.
  ///
  /// Parameters:
  ///
  /// * [String] oauthApplicationId (required):
  ///   The ID of the OAuth application to delete
  Future<DeletedObject?> deleteOAuthApplication(
    String oauthApplicationId,
  ) async {
    final response = await deleteOAuthApplicationWithHttpInfo(
      oauthApplicationId,
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

  /// Retrieve an OAuth application by ID
  ///
  /// Fetches the OAuth application whose ID matches the provided `id` in the path.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] oauthApplicationId (required):
  ///   The ID of the OAuth application
  Future<http.Response> getOAuthApplicationWithHttpInfo(
    String oauthApplicationId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/oauth_applications/{oauth_application_id}'
        .replaceAll('{oauth_application_id}', oauthApplicationId);

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

  /// Retrieve an OAuth application by ID
  ///
  /// Fetches the OAuth application whose ID matches the provided `id` in the path.
  ///
  /// Parameters:
  ///
  /// * [String] oauthApplicationId (required):
  ///   The ID of the OAuth application
  Future<OAuthApplication?> getOAuthApplication(
    String oauthApplicationId,
  ) async {
    final response = await getOAuthApplicationWithHttpInfo(
      oauthApplicationId,
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
        'OAuthApplication',
      ) as OAuthApplication;
    }
    return null;
  }

  /// Get a list of OAuth applications for an instance
  ///
  /// This request returns the list of OAuth applications for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The OAuth applications are ordered by descending creation date. Most recent OAuth applications will be returned first.
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
  Future<http.Response> listOAuthApplicationsWithHttpInfo({
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/oauth_applications';

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

  /// Get a list of OAuth applications for an instance
  ///
  /// This request returns the list of OAuth applications for an instance. Results can be paginated using the optional `limit` and `offset` query parameters. The OAuth applications are ordered by descending creation date. Most recent OAuth applications will be returned first.
  ///
  /// Parameters:
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<OAuthApplications?> listOAuthApplications({
    int? limit,
    int? offset,
  }) async {
    final response = await listOAuthApplicationsWithHttpInfo(
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
        'OAuthApplications',
      ) as OAuthApplications;
    }
    return null;
  }

  /// Rotate the client secret of the given OAuth application
  ///
  /// Rotates the OAuth application's client secret. When the client secret is rotated, make sure to update it in authorized OAuth clients.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] oauthApplicationId (required):
  ///   The ID of the OAuth application for which to rotate the client secret
  Future<http.Response> rotateOAuthApplicationSecretWithHttpInfo(
    String oauthApplicationId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/oauth_applications/{oauth_application_id}/rotate_secret'
        .replaceAll('{oauth_application_id}', oauthApplicationId);

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

  /// Rotate the client secret of the given OAuth application
  ///
  /// Rotates the OAuth application's client secret. When the client secret is rotated, make sure to update it in authorized OAuth clients.
  ///
  /// Parameters:
  ///
  /// * [String] oauthApplicationId (required):
  ///   The ID of the OAuth application for which to rotate the client secret
  Future<OAuthApplicationWithSecret?> rotateOAuthApplicationSecret(
    String oauthApplicationId,
  ) async {
    final response = await rotateOAuthApplicationSecretWithHttpInfo(
      oauthApplicationId,
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
        'OAuthApplicationWithSecret',
      ) as OAuthApplicationWithSecret;
    }
    return null;
  }

  /// Update an OAuth application
  ///
  /// Updates an existing OAuth application
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] oauthApplicationId (required):
  ///   The ID of the OAuth application to update
  ///
  /// * [UpdateOAuthApplicationRequest] updateOAuthApplicationRequest (required):
  Future<http.Response> updateOAuthApplicationWithHttpInfo(
    String oauthApplicationId,
    UpdateOAuthApplicationRequest updateOAuthApplicationRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/oauth_applications/{oauth_application_id}'
        .replaceAll('{oauth_application_id}', oauthApplicationId);

    // ignore: prefer_final_locals
    Object? postBody = updateOAuthApplicationRequest;

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

  /// Update an OAuth application
  ///
  /// Updates an existing OAuth application
  ///
  /// Parameters:
  ///
  /// * [String] oauthApplicationId (required):
  ///   The ID of the OAuth application to update
  ///
  /// * [UpdateOAuthApplicationRequest] updateOAuthApplicationRequest (required):
  Future<OAuthApplication?> updateOAuthApplication(
    String oauthApplicationId,
    UpdateOAuthApplicationRequest updateOAuthApplicationRequest,
  ) async {
    final response = await updateOAuthApplicationWithHttpInfo(
      oauthApplicationId,
      updateOAuthApplicationRequest,
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
        'OAuthApplication',
      ) as OAuthApplication;
    }
    return null;
  }
}
