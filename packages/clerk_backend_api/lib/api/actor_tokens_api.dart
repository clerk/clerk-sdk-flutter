//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ActorTokensApi {
  ActorTokensApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create actor token
  ///
  /// Create an actor token that can be used to impersonate the given user. The `actor` parameter needs to include at least a \"sub\" key whose value is the ID of the actor (impersonating) user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateActorTokenRequest] createActorTokenRequest:
  Future<http.Response> createActorTokenWithHttpInfo({
    CreateActorTokenRequest? createActorTokenRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/actor_tokens';

    // ignore: prefer_final_locals
    Object? postBody = createActorTokenRequest;

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

  /// Create actor token
  ///
  /// Create an actor token that can be used to impersonate the given user. The `actor` parameter needs to include at least a \"sub\" key whose value is the ID of the actor (impersonating) user.
  ///
  /// Parameters:
  ///
  /// * [CreateActorTokenRequest] createActorTokenRequest:
  Future<ActorToken?> createActorToken({
    CreateActorTokenRequest? createActorTokenRequest,
  }) async {
    final response = await createActorTokenWithHttpInfo(
      createActorTokenRequest: createActorTokenRequest,
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
        'ActorToken',
      ) as ActorToken;
    }
    return null;
  }

  /// Revoke actor token
  ///
  /// Revokes a pending actor token.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] actorTokenId (required):
  ///   The ID of the actor token to be revoked.
  Future<http.Response> revokeActorTokenWithHttpInfo(
    String actorTokenId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/actor_tokens/{actor_token_id}/revoke'
        .replaceAll('{actor_token_id}', actorTokenId);

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

  /// Revoke actor token
  ///
  /// Revokes a pending actor token.
  ///
  /// Parameters:
  ///
  /// * [String] actorTokenId (required):
  ///   The ID of the actor token to be revoked.
  Future<ActorToken?> revokeActorToken(
    String actorTokenId,
  ) async {
    final response = await revokeActorTokenWithHttpInfo(
      actorTokenId,
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
        'ActorToken',
      ) as ActorToken;
    }
    return null;
  }
}
