//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PhoneNumbersApi {
  PhoneNumbersApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a phone number
  ///
  /// Create a new phone number
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreatePhoneNumberRequest] createPhoneNumberRequest:
  Future<http.Response> createPhoneNumberWithHttpInfo({
    CreatePhoneNumberRequest? createPhoneNumberRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/phone_numbers';

    // ignore: prefer_final_locals
    Object? postBody = createPhoneNumberRequest;

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

  /// Create a phone number
  ///
  /// Create a new phone number
  ///
  /// Parameters:
  ///
  /// * [CreatePhoneNumberRequest] createPhoneNumberRequest:
  Future<PhoneNumber?> createPhoneNumber({
    CreatePhoneNumberRequest? createPhoneNumberRequest,
  }) async {
    final response = await createPhoneNumberWithHttpInfo(
      createPhoneNumberRequest: createPhoneNumberRequest,
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
        'PhoneNumber',
      ) as PhoneNumber;
    }
    return null;
  }

  /// Delete a phone number
  ///
  /// Delete the phone number with the given ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] phoneNumberId (required):
  ///   The ID of the phone number to delete
  Future<http.Response> deletePhoneNumberWithHttpInfo(
    String phoneNumberId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/phone_numbers/{phone_number_id}'
        .replaceAll('{phone_number_id}', phoneNumberId);

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

  /// Delete a phone number
  ///
  /// Delete the phone number with the given ID
  ///
  /// Parameters:
  ///
  /// * [String] phoneNumberId (required):
  ///   The ID of the phone number to delete
  Future<DeletedObject?> deletePhoneNumber(
    String phoneNumberId,
  ) async {
    final response = await deletePhoneNumberWithHttpInfo(
      phoneNumberId,
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

  /// Retrieve a phone number
  ///
  /// Returns the details of a phone number
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] phoneNumberId (required):
  ///   The ID of the phone number to retrieve
  Future<http.Response> getPhoneNumberWithHttpInfo(
    String phoneNumberId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/phone_numbers/{phone_number_id}'
        .replaceAll('{phone_number_id}', phoneNumberId);

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

  /// Retrieve a phone number
  ///
  /// Returns the details of a phone number
  ///
  /// Parameters:
  ///
  /// * [String] phoneNumberId (required):
  ///   The ID of the phone number to retrieve
  Future<PhoneNumber?> getPhoneNumber(
    String phoneNumberId,
  ) async {
    final response = await getPhoneNumberWithHttpInfo(
      phoneNumberId,
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
        'PhoneNumber',
      ) as PhoneNumber;
    }
    return null;
  }

  /// Update a phone number
  ///
  /// Updates a phone number
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] phoneNumberId (required):
  ///   The ID of the phone number to update
  ///
  /// * [UpdatePhoneNumberRequest] updatePhoneNumberRequest:
  Future<http.Response> updatePhoneNumberWithHttpInfo(
    String phoneNumberId, {
    UpdatePhoneNumberRequest? updatePhoneNumberRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/phone_numbers/{phone_number_id}'
        .replaceAll('{phone_number_id}', phoneNumberId);

    // ignore: prefer_final_locals
    Object? postBody = updatePhoneNumberRequest;

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

  /// Update a phone number
  ///
  /// Updates a phone number
  ///
  /// Parameters:
  ///
  /// * [String] phoneNumberId (required):
  ///   The ID of the phone number to update
  ///
  /// * [UpdatePhoneNumberRequest] updatePhoneNumberRequest:
  Future<PhoneNumber?> updatePhoneNumber(
    String phoneNumberId, {
    UpdatePhoneNumberRequest? updatePhoneNumberRequest,
  }) async {
    final response = await updatePhoneNumberWithHttpInfo(
      phoneNumberId,
      updatePhoneNumberRequest: updatePhoneNumberRequest,
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
        'PhoneNumber',
      ) as PhoneNumber;
    }
    return null;
  }
}
