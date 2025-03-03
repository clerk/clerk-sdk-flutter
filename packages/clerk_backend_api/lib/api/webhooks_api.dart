//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WebhooksApi {
  WebhooksApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a Svix app
  ///
  /// Create a Svix app and associate it with the current instance
  ///
  /// Note: This method returns the HTTP [Response].
  Future<http.Response> createSvixAppWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/webhooks/svix';

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

  /// Create a Svix app
  ///
  /// Create a Svix app and associate it with the current instance
  Future<SvixURL?> createSvixApp() async {
    final response = await createSvixAppWithHttpInfo();
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
        'SvixURL',
      ) as SvixURL;
    }
    return null;
  }

  /// Delete a Svix app
  ///
  /// Delete a Svix app and disassociate it from the current instance
  ///
  /// Note: This method returns the HTTP [Response].
  Future<http.Response> deleteSvixAppWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/webhooks/svix';

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

  /// Delete a Svix app
  ///
  /// Delete a Svix app and disassociate it from the current instance
  Future<void> deleteSvixApp() async {
    final response = await deleteSvixAppWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Create a Svix Dashboard URL
  ///
  /// Generate a new url for accessing the Svix's management dashboard for that particular instance
  ///
  /// Note: This method returns the HTTP [Response].
  Future<http.Response> generateSvixAuthURLWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/webhooks/svix_url';

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

  /// Create a Svix Dashboard URL
  ///
  /// Generate a new url for accessing the Svix's management dashboard for that particular instance
  Future<SvixURL?> generateSvixAuthURL() async {
    final response = await generateSvixAuthURLWithHttpInfo();
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
        'SvixURL',
      ) as SvixURL;
    }
    return null;
  }
}
