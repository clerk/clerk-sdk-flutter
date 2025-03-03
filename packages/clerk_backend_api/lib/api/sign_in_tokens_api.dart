//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignInTokensApi {
  SignInTokensApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create sign-in token
  ///
  /// Creates a new sign-in token and associates it with the given user. By default, sign-in tokens expire in 30 days. You can optionally supply a different duration in seconds using the `expires_in_seconds` property.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateSignInTokenRequest] createSignInTokenRequest:
  Future<http.Response> createSignInTokenWithHttpInfo({
    CreateSignInTokenRequest? createSignInTokenRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/sign_in_tokens';

    // ignore: prefer_final_locals
    Object? postBody = createSignInTokenRequest;

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

  /// Create sign-in token
  ///
  /// Creates a new sign-in token and associates it with the given user. By default, sign-in tokens expire in 30 days. You can optionally supply a different duration in seconds using the `expires_in_seconds` property.
  ///
  /// Parameters:
  ///
  /// * [CreateSignInTokenRequest] createSignInTokenRequest:
  Future<SignInToken?> createSignInToken({
    CreateSignInTokenRequest? createSignInTokenRequest,
  }) async {
    final response = await createSignInTokenWithHttpInfo(
      createSignInTokenRequest: createSignInTokenRequest,
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
        'SignInToken',
      ) as SignInToken;
    }
    return null;
  }

  /// Revoke the given sign-in token
  ///
  /// Revokes a pending sign-in token
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] signInTokenId (required):
  ///   The ID of the sign-in token to be revoked
  Future<http.Response> revokeSignInTokenWithHttpInfo(
    String signInTokenId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/sign_in_tokens/{sign_in_token_id}/revoke'
        .replaceAll('{sign_in_token_id}', signInTokenId);

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

  /// Revoke the given sign-in token
  ///
  /// Revokes a pending sign-in token
  ///
  /// Parameters:
  ///
  /// * [String] signInTokenId (required):
  ///   The ID of the sign-in token to be revoked
  Future<SignInToken?> revokeSignInToken(
    String signInTokenId,
  ) async {
    final response = await revokeSignInTokenWithHttpInfo(
      signInTokenId,
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
        'SignInToken',
      ) as SignInToken;
    }
    return null;
  }
}
