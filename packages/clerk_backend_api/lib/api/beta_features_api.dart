//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BetaFeaturesApi {
  BetaFeaturesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Update production instance domain
  ///
  /// Change the domain of a production instance.  Changing the domain requires updating the [DNS records](https://clerk.com/docs/deployments/overview#dns-records) accordingly, deploying new [SSL certificates](https://clerk.com/docs/deployments/overview#deploy), updating your Social Connection's redirect URLs and setting the new keys in your code.  WARNING: Changing your domain will invalidate all current user sessions (i.e. users will be logged out). Also, while your application is being deployed, a small downtime is expected to occur.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ChangeProductionInstanceDomainRequest] changeProductionInstanceDomainRequest:
  Future<http.Response> changeProductionInstanceDomainWithHttpInfo({
    ChangeProductionInstanceDomainRequest?
        changeProductionInstanceDomainRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/instance/change_domain';

    // ignore: prefer_final_locals
    Object? postBody = changeProductionInstanceDomainRequest;

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

  /// Update production instance domain
  ///
  /// Change the domain of a production instance.  Changing the domain requires updating the [DNS records](https://clerk.com/docs/deployments/overview#dns-records) accordingly, deploying new [SSL certificates](https://clerk.com/docs/deployments/overview#deploy), updating your Social Connection's redirect URLs and setting the new keys in your code.  WARNING: Changing your domain will invalidate all current user sessions (i.e. users will be logged out). Also, while your application is being deployed, a small downtime is expected to occur.
  ///
  /// Parameters:
  ///
  /// * [ChangeProductionInstanceDomainRequest] changeProductionInstanceDomainRequest:
  Future<void> changeProductionInstanceDomain({
    ChangeProductionInstanceDomainRequest?
        changeProductionInstanceDomainRequest,
  }) async {
    final response = await changeProductionInstanceDomainWithHttpInfo(
      changeProductionInstanceDomainRequest:
          changeProductionInstanceDomainRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update instance settings
  ///
  /// Updates the settings of an instance
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UpdateInstanceAuthConfigRequest] updateInstanceAuthConfigRequest:
  Future<http.Response> updateInstanceAuthConfigWithHttpInfo({
    UpdateInstanceAuthConfigRequest? updateInstanceAuthConfigRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/beta_features/instance_settings';

    // ignore: prefer_final_locals
    Object? postBody = updateInstanceAuthConfigRequest;

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
  /// * [UpdateInstanceAuthConfigRequest] updateInstanceAuthConfigRequest:
  Future<UpdateInstanceAuthConfig200Response?> updateInstanceAuthConfig({
    UpdateInstanceAuthConfigRequest? updateInstanceAuthConfigRequest,
  }) async {
    final response = await updateInstanceAuthConfigWithHttpInfo(
      updateInstanceAuthConfigRequest: updateInstanceAuthConfigRequest,
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
        'UpdateInstanceAuthConfig200Response',
      ) as UpdateInstanceAuthConfig200Response;
    }
    return null;
  }

  /// Update production instance domain
  ///
  /// Change the domain of a production instance.  Changing the domain requires updating the [DNS records](https://clerk.com/docs/deployments/overview#dns-records) accordingly, deploying new [SSL certificates](https://clerk.com/docs/deployments/overview#deploy), updating your Social Connection's redirect URLs and setting the new keys in your code.  WARNING: Changing your domain will invalidate all current user sessions (i.e. users will be logged out). Also, while your application is being deployed, a small downtime is expected to occur.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UpdateProductionInstanceDomainRequest] updateProductionInstanceDomainRequest:
  Future<http.Response> updateProductionInstanceDomainWithHttpInfo({
    UpdateProductionInstanceDomainRequest?
        updateProductionInstanceDomainRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/beta_features/domain';

    // ignore: prefer_final_locals
    Object? postBody = updateProductionInstanceDomainRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update production instance domain
  ///
  /// Change the domain of a production instance.  Changing the domain requires updating the [DNS records](https://clerk.com/docs/deployments/overview#dns-records) accordingly, deploying new [SSL certificates](https://clerk.com/docs/deployments/overview#deploy), updating your Social Connection's redirect URLs and setting the new keys in your code.  WARNING: Changing your domain will invalidate all current user sessions (i.e. users will be logged out). Also, while your application is being deployed, a small downtime is expected to occur.
  ///
  /// Parameters:
  ///
  /// * [UpdateProductionInstanceDomainRequest] updateProductionInstanceDomainRequest:
  Future<void> updateProductionInstanceDomain({
    UpdateProductionInstanceDomainRequest?
        updateProductionInstanceDomainRequest,
  }) async {
    final response = await updateProductionInstanceDomainWithHttpInfo(
      updateProductionInstanceDomainRequest:
          updateProductionInstanceDomainRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
