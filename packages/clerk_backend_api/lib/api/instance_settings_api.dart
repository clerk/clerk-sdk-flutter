//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceSettingsApi {
  InstanceSettingsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Fetch the current instance
  ///
  /// Fetches the current instance
  ///
  /// Note: This method returns the HTTP [Response].
  Future<http.Response> getInstanceWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/instance';

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

  /// Fetch the current instance
  ///
  /// Fetches the current instance
  Future<Instance?> getInstance() async {
    final response = await getInstanceWithHttpInfo();
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
        'Instance',
      ) as Instance;
    }
    return null;
  }

  /// Update instance settings
  ///
  /// Updates the settings of an instance
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UpdateInstanceRequest] updateInstanceRequest:
  Future<http.Response> updateInstanceWithHttpInfo({
    UpdateInstanceRequest? updateInstanceRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/instance';

    // ignore: prefer_final_locals
    Object? postBody = updateInstanceRequest;

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

  /// Update instance settings
  ///
  /// Updates the settings of an instance
  ///
  /// Parameters:
  ///
  /// * [UpdateInstanceRequest] updateInstanceRequest:
  Future<void> updateInstance({
    UpdateInstanceRequest? updateInstanceRequest,
  }) async {
    final response = await updateInstanceWithHttpInfo(
      updateInstanceRequest: updateInstanceRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update instance organization settings
  ///
  /// Updates the organization settings of the instance
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UpdateInstanceOrganizationSettingsRequest] updateInstanceOrganizationSettingsRequest:
  Future<http.Response> updateInstanceOrganizationSettingsWithHttpInfo({
    UpdateInstanceOrganizationSettingsRequest?
        updateInstanceOrganizationSettingsRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/instance/organization_settings';

    // ignore: prefer_final_locals
    Object? postBody = updateInstanceOrganizationSettingsRequest;

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

  /// Update instance organization settings
  ///
  /// Updates the organization settings of the instance
  ///
  /// Parameters:
  ///
  /// * [UpdateInstanceOrganizationSettingsRequest] updateInstanceOrganizationSettingsRequest:
  Future<OrganizationSettings?> updateInstanceOrganizationSettings({
    UpdateInstanceOrganizationSettingsRequest?
        updateInstanceOrganizationSettingsRequest,
  }) async {
    final response = await updateInstanceOrganizationSettingsWithHttpInfo(
      updateInstanceOrganizationSettingsRequest:
          updateInstanceOrganizationSettingsRequest,
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
        'OrganizationSettings',
      ) as OrganizationSettings;
    }
    return null;
  }

  /// Update instance restrictions
  ///
  /// Updates the restriction settings of an instance
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UpdateInstanceRestrictionsRequest] updateInstanceRestrictionsRequest:
  Future<http.Response> updateInstanceRestrictionsWithHttpInfo({
    UpdateInstanceRestrictionsRequest? updateInstanceRestrictionsRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/instance/restrictions';

    // ignore: prefer_final_locals
    Object? postBody = updateInstanceRestrictionsRequest;

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

  /// Update instance restrictions
  ///
  /// Updates the restriction settings of an instance
  ///
  /// Parameters:
  ///
  /// * [UpdateInstanceRestrictionsRequest] updateInstanceRestrictionsRequest:
  Future<InstanceRestrictions?> updateInstanceRestrictions({
    UpdateInstanceRestrictionsRequest? updateInstanceRestrictionsRequest,
  }) async {
    final response = await updateInstanceRestrictionsWithHttpInfo(
      updateInstanceRestrictionsRequest: updateInstanceRestrictionsRequest,
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
        'InstanceRestrictions',
      ) as InstanceRestrictions;
    }
    return null;
  }
}
