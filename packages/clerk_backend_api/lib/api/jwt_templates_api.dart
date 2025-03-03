//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JWTTemplatesApi {
  JWTTemplatesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a JWT template
  ///
  /// Create a new JWT template
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateJWTTemplateRequest] createJWTTemplateRequest:
  Future<http.Response> createJWTTemplateWithHttpInfo({
    CreateJWTTemplateRequest? createJWTTemplateRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/jwt_templates';

    // ignore: prefer_final_locals
    Object? postBody = createJWTTemplateRequest;

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

  /// Create a JWT template
  ///
  /// Create a new JWT template
  ///
  /// Parameters:
  ///
  /// * [CreateJWTTemplateRequest] createJWTTemplateRequest:
  Future<JWTTemplate?> createJWTTemplate({
    CreateJWTTemplateRequest? createJWTTemplateRequest,
  }) async {
    final response = await createJWTTemplateWithHttpInfo(
      createJWTTemplateRequest: createJWTTemplateRequest,
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
        'JWTTemplate',
      ) as JWTTemplate;
    }
    return null;
  }

  /// Delete a Template
  ///
  ///
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateId (required):
  ///   JWT Template ID
  Future<http.Response> deleteJWTTemplateWithHttpInfo(
    String templateId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/jwt_templates/{template_id}'.replaceAll('{template_id}', templateId);

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

  /// Delete a Template
  ///
  ///
  ///
  /// Parameters:
  ///
  /// * [String] templateId (required):
  ///   JWT Template ID
  Future<DeletedObject?> deleteJWTTemplate(
    String templateId,
  ) async {
    final response = await deleteJWTTemplateWithHttpInfo(
      templateId,
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

  /// Retrieve a template
  ///
  /// Retrieve the details of a given JWT template
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateId (required):
  ///   JWT Template ID
  Future<http.Response> getJWTTemplateWithHttpInfo(
    String templateId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/jwt_templates/{template_id}'.replaceAll('{template_id}', templateId);

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

  /// Retrieve a template
  ///
  /// Retrieve the details of a given JWT template
  ///
  /// Parameters:
  ///
  /// * [String] templateId (required):
  ///   JWT Template ID
  Future<JWTTemplate?> getJWTTemplate(
    String templateId,
  ) async {
    final response = await getJWTTemplateWithHttpInfo(
      templateId,
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
        'JWTTemplate',
      ) as JWTTemplate;
    }
    return null;
  }

  /// List all templates
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
  Future<http.Response> listJWTTemplatesWithHttpInfo({
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/jwt_templates';

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

  /// List all templates
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
  Future<List<JWTTemplate>?> listJWTTemplates({
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    final response = await listJWTTemplatesWithHttpInfo(
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
              responseBody, 'List<JWTTemplate>') as List)
          .cast<JWTTemplate>()
          .toList(growable: false);
    }
    return null;
  }

  /// Update a JWT template
  ///
  /// Updates an existing JWT template
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateId (required):
  ///   The ID of the JWT template to update
  ///
  /// * [CreateJWTTemplateRequest] createJWTTemplateRequest:
  Future<http.Response> updateJWTTemplateWithHttpInfo(
    String templateId, {
    CreateJWTTemplateRequest? createJWTTemplateRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/jwt_templates/{template_id}'.replaceAll('{template_id}', templateId);

    // ignore: prefer_final_locals
    Object? postBody = createJWTTemplateRequest;

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

  /// Update a JWT template
  ///
  /// Updates an existing JWT template
  ///
  /// Parameters:
  ///
  /// * [String] templateId (required):
  ///   The ID of the JWT template to update
  ///
  /// * [CreateJWTTemplateRequest] createJWTTemplateRequest:
  Future<JWTTemplate?> updateJWTTemplate(
    String templateId, {
    CreateJWTTemplateRequest? createJWTTemplateRequest,
  }) async {
    final response = await updateJWTTemplateWithHttpInfo(
      templateId,
      createJWTTemplateRequest: createJWTTemplateRequest,
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
        'JWTTemplate',
      ) as JWTTemplate;
    }
    return null;
  }
}
