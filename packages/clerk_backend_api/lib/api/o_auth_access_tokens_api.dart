//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OAuthAccessTokensApi {
  OAuthAccessTokensApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Verify an OAuth Access Token
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [VerifyOAuthAccessTokenRequest] verifyOAuthAccessTokenRequest (required):
  Future<http.Response> verifyOAuthAccessTokenWithHttpInfo(
    VerifyOAuthAccessTokenRequest verifyOAuthAccessTokenRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/oauth_applications/access_tokens/verify';

    // ignore: prefer_final_locals
    Object? postBody = verifyOAuthAccessTokenRequest;

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

  /// Verify an OAuth Access Token
  ///
  /// Parameters:
  ///
  /// * [VerifyOAuthAccessTokenRequest] verifyOAuthAccessTokenRequest (required):
  Future<VerifyOAuthAccessToken200Response?> verifyOAuthAccessToken(
    VerifyOAuthAccessTokenRequest verifyOAuthAccessTokenRequest,
  ) async {
    final response = await verifyOAuthAccessTokenWithHttpInfo(
      verifyOAuthAccessTokenRequest,
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
        'VerifyOAuthAccessToken200Response',
      ) as VerifyOAuthAccessToken200Response;
    }
    return null;
  }
}
