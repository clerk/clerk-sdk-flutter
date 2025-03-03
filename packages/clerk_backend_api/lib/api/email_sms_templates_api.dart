//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EmailSMSTemplatesApi {
  EmailSMSTemplatesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Retrieve a template
  ///
  /// Returns the details of a template
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of templates to retrieve (email or SMS)
  ///
  /// * [String] slug (required):
  ///   The slug (i.e. machine-friendly name) of the template to retrieve
  Future<http.Response> getTemplateWithHttpInfo(
    String templateType,
    String slug,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/templates/{template_type}/{slug}'
        .replaceAll('{template_type}', templateType)
        .replaceAll('{slug}', slug);

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
  /// Returns the details of a template
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of templates to retrieve (email or SMS)
  ///
  /// * [String] slug (required):
  ///   The slug (i.e. machine-friendly name) of the template to retrieve
  Future<Template?> getTemplate(
    String templateType,
    String slug,
  ) async {
    final response = await getTemplateWithHttpInfo(
      templateType,
      slug,
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
        'Template',
      ) as Template;
    }
    return null;
  }

  /// List all templates
  ///
  /// Returns a list of all templates. The templates are returned sorted by position.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of templates to list (email or SMS)
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> getTemplateListWithHttpInfo(
    String templateType, {
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/templates/{template_type}'
        .replaceAll('{template_type}', templateType);

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
  /// Returns a list of all templates. The templates are returned sorted by position.
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of templates to list (email or SMS)
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<List<Template>?> getTemplateList(
    String templateType, {
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    final response = await getTemplateListWithHttpInfo(
      templateType,
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
      return (await apiClient.deserializeAsync(responseBody, 'List<Template>')
              as List)
          .cast<Template>()
          .toList(growable: false);
    }
    return null;
  }

  /// Preview changes to a template
  ///
  /// Returns a preview of a template for a given template_type, slug and body
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of template to preview
  ///
  /// * [String] slug (required):
  ///   The slug of the template to preview
  ///
  /// * [PreviewTemplateRequest] previewTemplateRequest:
  ///   Required parameters
  Future<http.Response> previewTemplateWithHttpInfo(
    String templateType,
    String slug, {
    PreviewTemplateRequest? previewTemplateRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/templates/{template_type}/{slug}/preview'
        .replaceAll('{template_type}', templateType)
        .replaceAll('{slug}', slug);

    // ignore: prefer_final_locals
    Object? postBody = previewTemplateRequest;

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

  /// Preview changes to a template
  ///
  /// Returns a preview of a template for a given template_type, slug and body
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of template to preview
  ///
  /// * [String] slug (required):
  ///   The slug of the template to preview
  ///
  /// * [PreviewTemplateRequest] previewTemplateRequest:
  ///   Required parameters
  Future<Object?> previewTemplate(
    String templateType,
    String slug, {
    PreviewTemplateRequest? previewTemplateRequest,
  }) async {
    final response = await previewTemplateWithHttpInfo(
      templateType,
      slug,
      previewTemplateRequest: previewTemplateRequest,
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
        'Object',
      ) as Object;
    }
    return null;
  }

  /// Revert a template
  ///
  /// Reverts an updated template to its default state
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of template to revert
  ///
  /// * [String] slug (required):
  ///   The slug of the template to revert
  Future<http.Response> revertTemplateWithHttpInfo(
    String templateType,
    String slug,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/templates/{template_type}/{slug}/revert'
        .replaceAll('{template_type}', templateType)
        .replaceAll('{slug}', slug);

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

  /// Revert a template
  ///
  /// Reverts an updated template to its default state
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of template to revert
  ///
  /// * [String] slug (required):
  ///   The slug of the template to revert
  Future<Template?> revertTemplate(
    String templateType,
    String slug,
  ) async {
    final response = await revertTemplateWithHttpInfo(
      templateType,
      slug,
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
        'Template',
      ) as Template;
    }
    return null;
  }

  /// Toggle the delivery by Clerk for a template of a given type and slug
  ///
  /// Toggles the delivery by Clerk for a template of a given type and slug. If disabled, Clerk will not deliver the resulting email or SMS. The app developer will need to listen to the `email.created` or `sms.created` webhooks in order to handle delivery themselves.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of template to toggle delivery for
  ///
  /// * [String] slug (required):
  ///   The slug of the template for which to toggle delivery
  ///
  /// * [ToggleTemplateDeliveryRequest] toggleTemplateDeliveryRequest:
  Future<http.Response> toggleTemplateDeliveryWithHttpInfo(
    String templateType,
    String slug, {
    ToggleTemplateDeliveryRequest? toggleTemplateDeliveryRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/templates/{template_type}/{slug}/toggle_delivery'
        .replaceAll('{template_type}', templateType)
        .replaceAll('{slug}', slug);

    // ignore: prefer_final_locals
    Object? postBody = toggleTemplateDeliveryRequest;

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

  /// Toggle the delivery by Clerk for a template of a given type and slug
  ///
  /// Toggles the delivery by Clerk for a template of a given type and slug. If disabled, Clerk will not deliver the resulting email or SMS. The app developer will need to listen to the `email.created` or `sms.created` webhooks in order to handle delivery themselves.
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of template to toggle delivery for
  ///
  /// * [String] slug (required):
  ///   The slug of the template for which to toggle delivery
  ///
  /// * [ToggleTemplateDeliveryRequest] toggleTemplateDeliveryRequest:
  Future<Template?> toggleTemplateDelivery(
    String templateType,
    String slug, {
    ToggleTemplateDeliveryRequest? toggleTemplateDeliveryRequest,
  }) async {
    final response = await toggleTemplateDeliveryWithHttpInfo(
      templateType,
      slug,
      toggleTemplateDeliveryRequest: toggleTemplateDeliveryRequest,
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
        'Template',
      ) as Template;
    }
    return null;
  }

  /// Update a template for a given type and slug
  ///
  /// Updates the existing template of the given type and slug
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of template to update
  ///
  /// * [String] slug (required):
  ///   The slug of the template to update
  ///
  /// * [UpsertTemplateRequest] upsertTemplateRequest:
  Future<http.Response> upsertTemplateWithHttpInfo(
    String templateType,
    String slug, {
    UpsertTemplateRequest? upsertTemplateRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/templates/{template_type}/{slug}'
        .replaceAll('{template_type}', templateType)
        .replaceAll('{slug}', slug);

    // ignore: prefer_final_locals
    Object? postBody = upsertTemplateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update a template for a given type and slug
  ///
  /// Updates the existing template of the given type and slug
  ///
  /// Parameters:
  ///
  /// * [String] templateType (required):
  ///   The type of template to update
  ///
  /// * [String] slug (required):
  ///   The slug of the template to update
  ///
  /// * [UpsertTemplateRequest] upsertTemplateRequest:
  Future<Template?> upsertTemplate(
    String templateType,
    String slug, {
    UpsertTemplateRequest? upsertTemplateRequest,
  }) async {
    final response = await upsertTemplateWithHttpInfo(
      templateType,
      slug,
      upsertTemplateRequest: upsertTemplateRequest,
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
        'Template',
      ) as Template;
    }
    return null;
  }
}
