//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SessionsApi {
  SessionsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a new active session
  ///
  /// Create a new active session for the provided user ID.  **This operation is intended only for use in testing, and is not available for production instances.** If you are looking to generate a user session from the backend, we recommend using the [Sign-in Tokens](https://clerk.com/docs/reference/backend-api/tag/Sign-in-Tokens#operation/CreateSignInToken) resource instead.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateSessionRequest] createSessionRequest:
  Future<http.Response> createSessionWithHttpInfo({
    CreateSessionRequest? createSessionRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/sessions';

    // ignore: prefer_final_locals
    Object? postBody = createSessionRequest;

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

  /// Create a new active session
  ///
  /// Create a new active session for the provided user ID.  **This operation is intended only for use in testing, and is not available for production instances.** If you are looking to generate a user session from the backend, we recommend using the [Sign-in Tokens](https://clerk.com/docs/reference/backend-api/tag/Sign-in-Tokens#operation/CreateSignInToken) resource instead.
  ///
  /// Parameters:
  ///
  /// * [CreateSessionRequest] createSessionRequest:
  Future<Session?> createSession({
    CreateSessionRequest? createSessionRequest,
  }) async {
    final response = await createSessionWithHttpInfo(
      createSessionRequest: createSessionRequest,
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
        'Session',
      ) as Session;
    }
    return null;
  }

  /// Create a session token
  ///
  /// Creates a session JSON Web Token (JWT) based on a session.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  ///
  /// * [CreateSessionTokenRequest] createSessionTokenRequest:
  Future<http.Response> createSessionTokenWithHttpInfo(
    String sessionId, {
    CreateSessionTokenRequest? createSessionTokenRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/sessions/{session_id}/tokens'.replaceAll('{session_id}', sessionId);

    // ignore: prefer_final_locals
    Object? postBody = createSessionTokenRequest;

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

  /// Create a session token
  ///
  /// Creates a session JSON Web Token (JWT) based on a session.
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  ///
  /// * [CreateSessionTokenRequest] createSessionTokenRequest:
  Future<CreateSessionToken200Response?> createSessionToken(
    String sessionId, {
    CreateSessionTokenRequest? createSessionTokenRequest,
  }) async {
    final response = await createSessionTokenWithHttpInfo(
      sessionId,
      createSessionTokenRequest: createSessionTokenRequest,
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
        'CreateSessionToken200Response',
      ) as CreateSessionToken200Response;
    }
    return null;
  }

  /// Create a session token from a jwt template
  ///
  /// Creates a JSON Web Token(JWT) based on a session and a JWT Template name defined for your instance
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  ///
  /// * [String] templateName (required):
  ///   The name of the JWT Template defined in your instance (e.g. `custom_hasura`).
  ///
  /// * [CreateSessionTokenFromTemplateRequest] createSessionTokenFromTemplateRequest:
  Future<http.Response> createSessionTokenFromTemplateWithHttpInfo(
    String sessionId,
    String templateName, {
    CreateSessionTokenFromTemplateRequest?
        createSessionTokenFromTemplateRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/sessions/{session_id}/tokens/{template_name}'
        .replaceAll('{session_id}', sessionId)
        .replaceAll('{template_name}', templateName);

    // ignore: prefer_final_locals
    Object? postBody = createSessionTokenFromTemplateRequest;

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

  /// Create a session token from a jwt template
  ///
  /// Creates a JSON Web Token(JWT) based on a session and a JWT Template name defined for your instance
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  ///
  /// * [String] templateName (required):
  ///   The name of the JWT Template defined in your instance (e.g. `custom_hasura`).
  ///
  /// * [CreateSessionTokenFromTemplateRequest] createSessionTokenFromTemplateRequest:
  Future<CreateSessionToken200Response?> createSessionTokenFromTemplate(
    String sessionId,
    String templateName, {
    CreateSessionTokenFromTemplateRequest?
        createSessionTokenFromTemplateRequest,
  }) async {
    final response = await createSessionTokenFromTemplateWithHttpInfo(
      sessionId,
      templateName,
      createSessionTokenFromTemplateRequest:
          createSessionTokenFromTemplateRequest,
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
        'CreateSessionToken200Response',
      ) as CreateSessionToken200Response;
    }
    return null;
  }

  /// Retrieve a session
  ///
  /// Retrieve the details of a session
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  Future<http.Response> getSessionWithHttpInfo(
    String sessionId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/sessions/{session_id}'.replaceAll('{session_id}', sessionId);

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

  /// Retrieve a session
  ///
  /// Retrieve the details of a session
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  Future<Session?> getSession(
    String sessionId,
  ) async {
    final response = await getSessionWithHttpInfo(
      sessionId,
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
        'Session',
      ) as Session;
    }
    return null;
  }

  /// List all sessions
  ///
  /// Returns a list of all sessions. The sessions are returned sorted by creation date, with the newest sessions appearing first. **Deprecation Notice (2024-01-01):** All parameters were initially considered optional, however moving forward at least one of `client_id` or `user_id` parameters should be provided.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] clientId:
  ///   List sessions for the given client
  ///
  /// * [String] userId:
  ///   List sessions for the given user
  ///
  /// * [String] status:
  ///   Filter sessions by the provided status
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> getSessionListWithHttpInfo({
    String? clientId,
    String? userId,
    String? status,
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/sessions';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (clientId != null) {
      queryParams.addAll(_queryParams('', 'client_id', clientId));
    }
    if (userId != null) {
      queryParams.addAll(_queryParams('', 'user_id', userId));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
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

  /// List all sessions
  ///
  /// Returns a list of all sessions. The sessions are returned sorted by creation date, with the newest sessions appearing first. **Deprecation Notice (2024-01-01):** All parameters were initially considered optional, however moving forward at least one of `client_id` or `user_id` parameters should be provided.
  ///
  /// Parameters:
  ///
  /// * [String] clientId:
  ///   List sessions for the given client
  ///
  /// * [String] userId:
  ///   List sessions for the given user
  ///
  /// * [String] status:
  ///   Filter sessions by the provided status
  ///
  /// * [bool] paginated:
  ///   Whether to paginate the results. If true, the results will be paginated. If false, the results will not be paginated.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<List<Session>?> getSessionList({
    String? clientId,
    String? userId,
    String? status,
    bool? paginated,
    int? limit,
    int? offset,
  }) async {
    final response = await getSessionListWithHttpInfo(
      clientId: clientId,
      userId: userId,
      status: status,
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
      return (await apiClient.deserializeAsync(responseBody, 'List<Session>')
              as List)
          .cast<Session>()
          .toList(growable: false);
    }
    return null;
  }

  /// Revoke a session
  ///
  /// Sets the status of a session as \"revoked\", which is an unauthenticated state. In multi-session mode, a revoked session will still be returned along with its client object, however the user will need to sign in again.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  Future<http.Response> revokeSessionWithHttpInfo(
    String sessionId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/sessions/{session_id}/revoke'.replaceAll('{session_id}', sessionId);

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

  /// Revoke a session
  ///
  /// Sets the status of a session as \"revoked\", which is an unauthenticated state. In multi-session mode, a revoked session will still be returned along with its client object, however the user will need to sign in again.
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  Future<Session?> revokeSession(
    String sessionId,
  ) async {
    final response = await revokeSessionWithHttpInfo(
      sessionId,
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
        'Session',
      ) as Session;
    }
    return null;
  }

  /// Verify a session
  ///
  /// Returns the session if it is authenticated, otherwise returns an error. WARNING: This endpoint is deprecated and will be removed in future versions. We strongly recommend switching to networkless verification using short-lived session tokens,          which is implemented transparently in all recent SDK versions (e.g. [NodeJS SDK](https://clerk.com/docs/backend-requests/handling/nodejs#clerk-express-require-auth)).          For more details on how networkless verification works, refer to our [Session Tokens documentation](https://clerk.com/docs/backend-requests/resources/session-tokens).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  ///
  /// * [VerifySessionRequest] verifySessionRequest:
  ///   Parameters.
  Future<http.Response> verifySessionWithHttpInfo(
    String sessionId, {
    VerifySessionRequest? verifySessionRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path =
        r'/sessions/{session_id}/verify'.replaceAll('{session_id}', sessionId);

    // ignore: prefer_final_locals
    Object? postBody = verifySessionRequest;

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

  /// Verify a session
  ///
  /// Returns the session if it is authenticated, otherwise returns an error. WARNING: This endpoint is deprecated and will be removed in future versions. We strongly recommend switching to networkless verification using short-lived session tokens,          which is implemented transparently in all recent SDK versions (e.g. [NodeJS SDK](https://clerk.com/docs/backend-requests/handling/nodejs#clerk-express-require-auth)).          For more details on how networkless verification works, refer to our [Session Tokens documentation](https://clerk.com/docs/backend-requests/resources/session-tokens).
  ///
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///   The ID of the session
  ///
  /// * [VerifySessionRequest] verifySessionRequest:
  ///   Parameters.
  Future<Session?> verifySession(
    String sessionId, {
    VerifySessionRequest? verifySessionRequest,
  }) async {
    final response = await verifySessionWithHttpInfo(
      sessionId,
      verifySessionRequest: verifySessionRequest,
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
        'Session',
      ) as Session;
    }
    return null;
  }
}
