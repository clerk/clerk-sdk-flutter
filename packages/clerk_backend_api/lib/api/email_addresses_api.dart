//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EmailAddressesApi {
  EmailAddressesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create an email address
  ///
  /// Create a new email address
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateEmailAddressRequest] createEmailAddressRequest:
  Future<http.Response> createEmailAddressWithHttpInfo({
    CreateEmailAddressRequest? createEmailAddressRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/email_addresses';

    // ignore: prefer_final_locals
    Object? postBody = createEmailAddressRequest;

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

  /// Create an email address
  ///
  /// Create a new email address
  ///
  /// Parameters:
  ///
  /// * [CreateEmailAddressRequest] createEmailAddressRequest:
  Future<EmailAddress?> createEmailAddress({
    CreateEmailAddressRequest? createEmailAddressRequest,
  }) async {
    final response = await createEmailAddressWithHttpInfo(
      createEmailAddressRequest: createEmailAddressRequest,
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
        'EmailAddress',
      ) as EmailAddress;
    }
    return null;
  }

  /// Delete an email address
  ///
  /// Delete the email address with the given ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] emailAddressId (required):
  ///   The ID of the email address to delete
  Future<http.Response> deleteEmailAddressWithHttpInfo(
    String emailAddressId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/email_addresses/{email_address_id}'
        .replaceAll('{email_address_id}', emailAddressId);

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

  /// Delete an email address
  ///
  /// Delete the email address with the given ID
  ///
  /// Parameters:
  ///
  /// * [String] emailAddressId (required):
  ///   The ID of the email address to delete
  Future<DeletedObject?> deleteEmailAddress(
    String emailAddressId,
  ) async {
    final response = await deleteEmailAddressWithHttpInfo(
      emailAddressId,
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

  /// Retrieve an email address
  ///
  /// Returns the details of an email address.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] emailAddressId (required):
  ///   The ID of the email address to retrieve
  Future<http.Response> getEmailAddressWithHttpInfo(
    String emailAddressId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/email_addresses/{email_address_id}'
        .replaceAll('{email_address_id}', emailAddressId);

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

  /// Retrieve an email address
  ///
  /// Returns the details of an email address.
  ///
  /// Parameters:
  ///
  /// * [String] emailAddressId (required):
  ///   The ID of the email address to retrieve
  Future<EmailAddress?> getEmailAddress(
    String emailAddressId,
  ) async {
    final response = await getEmailAddressWithHttpInfo(
      emailAddressId,
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
        'EmailAddress',
      ) as EmailAddress;
    }
    return null;
  }

  /// Update an email address
  ///
  /// Updates an email address.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] emailAddressId (required):
  ///   The ID of the email address to update
  ///
  /// * [UpdateEmailAddressRequest] updateEmailAddressRequest:
  Future<http.Response> updateEmailAddressWithHttpInfo(
    String emailAddressId, {
    UpdateEmailAddressRequest? updateEmailAddressRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/email_addresses/{email_address_id}'
        .replaceAll('{email_address_id}', emailAddressId);

    // ignore: prefer_final_locals
    Object? postBody = updateEmailAddressRequest;

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

  /// Update an email address
  ///
  /// Updates an email address.
  ///
  /// Parameters:
  ///
  /// * [String] emailAddressId (required):
  ///   The ID of the email address to update
  ///
  /// * [UpdateEmailAddressRequest] updateEmailAddressRequest:
  Future<EmailAddress?> updateEmailAddress(
    String emailAddressId, {
    UpdateEmailAddressRequest? updateEmailAddressRequest,
  }) async {
    final response = await updateEmailAddressWithHttpInfo(
      emailAddressId,
      updateEmailAddressRequest: updateEmailAddressRequest,
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
        'EmailAddress',
      ) as EmailAddress;
    }
    return null;
  }
}
