//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class M2MTokensApi {
  M2MTokensApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a M2M Token
  ///
  /// Creates a new M2M Token. Must be authenticated via a Machine Secret Key.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateM2MTokenRequest] createM2MTokenRequest (required):
  Future<http.Response> createM2MTokenWithHttpInfo(
    CreateM2MTokenRequest createM2MTokenRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/m2m_tokens';

    // ignore: prefer_final_locals
    Object? postBody = createM2MTokenRequest;

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

  /// Create a M2M Token
  ///
  /// Creates a new M2M Token. Must be authenticated via a Machine Secret Key.
  ///
  /// Parameters:
  ///
  /// * [CreateM2MTokenRequest] createM2MTokenRequest (required):
  Future<CreateM2MToken201Response?> createM2MToken(
    CreateM2MTokenRequest createM2MTokenRequest,
  ) async {
    final response = await createM2MTokenWithHttpInfo(
      createM2MTokenRequest,
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
        'CreateM2MToken201Response',
      ) as CreateM2MToken201Response;
    }
    return null;
  }

  /// Get M2M Tokens
  ///
  /// Fetches M2M tokens for a specific machine.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When fetching M2M tokens with a Machine Secret Key, only tokens associated with the authenticated machine can be retrieved. - When fetching M2M tokens with a Clerk Secret Key, tokens for any machine in the instance can be retrieved.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] subject (required):
  ///
  /// * [bool] revoked:
  ///
  /// * [bool] expired:
  ///
  /// * [num] limit:
  ///
  /// * [num] offset:
  Future<http.Response> getM2MTokensWithHttpInfo(
    String subject, {
    bool? revoked,
    bool? expired,
    num? limit,
    num? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/m2m_tokens';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    queryParams.addAll(_queryParams('', 'subject', subject));
    if (revoked != null) {
      queryParams.addAll(_queryParams('', 'revoked', revoked));
    }
    if (expired != null) {
      queryParams.addAll(_queryParams('', 'expired', expired));
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

  /// Get M2M Tokens
  ///
  /// Fetches M2M tokens for a specific machine.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When fetching M2M tokens with a Machine Secret Key, only tokens associated with the authenticated machine can be retrieved. - When fetching M2M tokens with a Clerk Secret Key, tokens for any machine in the instance can be retrieved.
  ///
  /// Parameters:
  ///
  /// * [String] subject (required):
  ///
  /// * [bool] revoked:
  ///
  /// * [bool] expired:
  ///
  /// * [num] limit:
  ///
  /// * [num] offset:
  Future<GetM2MTokens200Response?> getM2MTokens(
    String subject, {
    bool? revoked,
    bool? expired,
    num? limit,
    num? offset,
  }) async {
    final response = await getM2MTokensWithHttpInfo(
      subject,
      revoked: revoked,
      expired: expired,
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
        'GetM2MTokens200Response',
      ) as GetM2MTokens200Response;
    }
    return null;
  }

  /// Revoke a M2M Token
  ///
  /// Revokes a M2M Token.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When revoking a M2M Token with a Machine Secret Key, the token must managed by the Machine associated with the Machine Secret Key. - When revoking a M2M Token with a Clerk Secret Key, any token on the Instance can be revoked.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] m2mTokenId (required):
  ///
  /// * [RevokeApiKeyRequest] revokeApiKeyRequest (required):
  Future<http.Response> revokeM2MTokenWithHttpInfo(
    String m2mTokenId,
    RevokeApiKeyRequest revokeApiKeyRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/m2m_tokens/{m2m_token_id}/revoke'
        .replaceAll('{m2m_token_id}', m2mTokenId);

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

  /// Revoke a M2M Token
  ///
  /// Revokes a M2M Token.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When revoking a M2M Token with a Machine Secret Key, the token must managed by the Machine associated with the Machine Secret Key. - When revoking a M2M Token with a Clerk Secret Key, any token on the Instance can be revoked.
  ///
  /// Parameters:
  ///
  /// * [String] m2mTokenId (required):
  ///
  /// * [RevokeApiKeyRequest] revokeApiKeyRequest (required):
  Future<GetM2MTokens200ResponseM2mTokensInner?> revokeM2MToken(
    String m2mTokenId,
    RevokeApiKeyRequest revokeApiKeyRequest,
  ) async {
    final response = await revokeM2MTokenWithHttpInfo(
      m2mTokenId,
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
        'GetM2MTokens200ResponseM2mTokensInner',
      ) as GetM2MTokens200ResponseM2mTokensInner;
    }
    return null;
  }

  /// Verify a M2M Token
  ///
  /// Verifies a M2M Token.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When verifying a M2M Token with a Machine Secret Key, the token must be granted access to the Machine associated with the Machine Secret Key. - When verifying a M2M Token with a Clerk Secret Key, any token on the Instance can be verified.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [VerifyM2MTokenRequest] verifyM2MTokenRequest (required):
  Future<http.Response> verifyM2MTokenWithHttpInfo(
    VerifyM2MTokenRequest verifyM2MTokenRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/m2m_tokens/verify';

    // ignore: prefer_final_locals
    Object? postBody = verifyM2MTokenRequest;

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

  /// Verify a M2M Token
  ///
  /// Verifies a M2M Token.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When verifying a M2M Token with a Machine Secret Key, the token must be granted access to the Machine associated with the Machine Secret Key. - When verifying a M2M Token with a Clerk Secret Key, any token on the Instance can be verified.
  ///
  /// Parameters:
  ///
  /// * [VerifyM2MTokenRequest] verifyM2MTokenRequest (required):
  Future<GetM2MTokens200ResponseM2mTokensInner?> verifyM2MToken(
    VerifyM2MTokenRequest verifyM2MTokenRequest,
  ) async {
    final response = await verifyM2MTokenWithHttpInfo(
      verifyM2MTokenRequest,
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
        'GetM2MTokens200ResponseM2mTokensInner',
      ) as GetM2MTokens200ResponseM2mTokensInner;
    }
    return null;
  }
}
