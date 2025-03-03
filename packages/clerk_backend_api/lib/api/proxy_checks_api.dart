//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProxyChecksApi {
  ProxyChecksApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Verify the proxy configuration for your domain
  ///
  /// This endpoint can be used to validate that a proxy-enabled domain is operational. It tries to verify that the proxy URL provided in the parameters maps to a functional proxy that can reach the Clerk Frontend API.  You can use this endpoint before you set a proxy URL for a domain. This way you can ensure that switching to proxy-based configuration will not lead to downtime for your instance.  The `proxy_url` parameter allows for testing proxy configurations for domains that don't have a proxy URL yet, or operate on a different proxy URL than the one provided. It can also be used to re-validate a domain that is already configured to work with a proxy.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [VerifyDomainProxyRequest] verifyDomainProxyRequest:
  Future<http.Response> verifyDomainProxyWithHttpInfo({
    VerifyDomainProxyRequest? verifyDomainProxyRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/proxy_checks';

    // ignore: prefer_final_locals
    Object? postBody = verifyDomainProxyRequest;

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

  /// Verify the proxy configuration for your domain
  ///
  /// This endpoint can be used to validate that a proxy-enabled domain is operational. It tries to verify that the proxy URL provided in the parameters maps to a functional proxy that can reach the Clerk Frontend API.  You can use this endpoint before you set a proxy URL for a domain. This way you can ensure that switching to proxy-based configuration will not lead to downtime for your instance.  The `proxy_url` parameter allows for testing proxy configurations for domains that don't have a proxy URL yet, or operate on a different proxy URL than the one provided. It can also be used to re-validate a domain that is already configured to work with a proxy.
  ///
  /// Parameters:
  ///
  /// * [VerifyDomainProxyRequest] verifyDomainProxyRequest:
  Future<ProxyCheck?> verifyDomainProxy({
    VerifyDomainProxyRequest? verifyDomainProxyRequest,
  }) async {
    final response = await verifyDomainProxyWithHttpInfo(
      verifyDomainProxyRequest: verifyDomainProxyRequest,
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
        'ProxyCheck',
      ) as ProxyCheck;
    }
    return null;
  }
}
