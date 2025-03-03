//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignUpsApi {
  SignUpsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Retrieve a sign-up by ID
  ///
  /// Retrieve the details of the sign-up with the given ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the sign-up to retrieve
  Future<http.Response> getSignUpWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/sign_ups/{id}'.replaceAll('{id}', id);

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

  /// Retrieve a sign-up by ID
  ///
  /// Retrieve the details of the sign-up with the given ID
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the sign-up to retrieve
  Future<SignUp?> getSignUp(
    String id,
  ) async {
    final response = await getSignUpWithHttpInfo(
      id,
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
        'SignUp',
      ) as SignUp;
    }
    return null;
  }

  /// Update a sign-up
  ///
  /// Update the sign-up with the given ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the sign-up to update
  ///
  /// * [UpdateSignUpRequest] updateSignUpRequest:
  Future<http.Response> updateSignUpWithHttpInfo(
    String id, {
    UpdateSignUpRequest? updateSignUpRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/sign_ups/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = updateSignUpRequest;

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

  /// Update a sign-up
  ///
  /// Update the sign-up with the given ID
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the sign-up to update
  ///
  /// * [UpdateSignUpRequest] updateSignUpRequest:
  Future<SignUp?> updateSignUp(
    String id, {
    UpdateSignUpRequest? updateSignUpRequest,
  }) async {
    final response = await updateSignUpWithHttpInfo(
      id,
      updateSignUpRequest: updateSignUpRequest,
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
        'SignUp',
      ) as SignUp;
    }
    return null;
  }
}
