//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MiscellaneousApi {
  MiscellaneousApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Returns the markup for the interstitial page
  ///
  /// The Clerk interstitial endpoint serves an html page that loads clerk.js in order to check the user's authentication state. It is used by Clerk SDKs when the user's authentication state cannot be immediately determined.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] frontendApi:
  ///   Please use `frontend_api` instead
  ///
  /// * [String] frontendApi2:
  ///   The Frontend API key of your instance
  ///
  /// * [String] publishableKey:
  ///   The publishable key of your instance
  ///
  /// * [String] proxyUrl:
  ///   The proxy URL of your instance
  ///
  /// * [String] domain:
  ///   The domain of your instance
  ///
  /// * [String] signInUrl:
  ///   The sign in URL of your instance
  ///
  /// * [bool] useDomainForScript:
  ///   Whether to use the domain for the script URL
  Future<http.Response> getPublicInterstitialWithHttpInfo({
    String? frontendApi,
    String? frontendApi2,
    String? publishableKey,
    String? proxyUrl,
    String? domain,
    String? signInUrl,
    bool? useDomainForScript,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/public/interstitial';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (frontendApi != null) {
      queryParams.addAll(_queryParams('', 'frontendApi', frontendApi));
    }
    if (frontendApi2 != null) {
      queryParams.addAll(_queryParams('', 'frontend_api', frontendApi2));
    }
    if (publishableKey != null) {
      queryParams.addAll(_queryParams('', 'publishable_key', publishableKey));
    }
    if (proxyUrl != null) {
      queryParams.addAll(_queryParams('', 'proxy_url', proxyUrl));
    }
    if (domain != null) {
      queryParams.addAll(_queryParams('', 'domain', domain));
    }
    if (signInUrl != null) {
      queryParams.addAll(_queryParams('', 'sign_in_url', signInUrl));
    }
    if (useDomainForScript != null) {
      queryParams.addAll(
          _queryParams('', 'use_domain_for_script', useDomainForScript));
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

  /// Returns the markup for the interstitial page
  ///
  /// The Clerk interstitial endpoint serves an html page that loads clerk.js in order to check the user's authentication state. It is used by Clerk SDKs when the user's authentication state cannot be immediately determined.
  ///
  /// Parameters:
  ///
  /// * [String] frontendApi:
  ///   Please use `frontend_api` instead
  ///
  /// * [String] frontendApi2:
  ///   The Frontend API key of your instance
  ///
  /// * [String] publishableKey:
  ///   The publishable key of your instance
  ///
  /// * [String] proxyUrl:
  ///   The proxy URL of your instance
  ///
  /// * [String] domain:
  ///   The domain of your instance
  ///
  /// * [String] signInUrl:
  ///   The sign in URL of your instance
  ///
  /// * [bool] useDomainForScript:
  ///   Whether to use the domain for the script URL
  Future<void> getPublicInterstitial({
    String? frontendApi,
    String? frontendApi2,
    String? publishableKey,
    String? proxyUrl,
    String? domain,
    String? signInUrl,
    bool? useDomainForScript,
  }) async {
    final response = await getPublicInterstitialWithHttpInfo(
      frontendApi: frontendApi,
      frontendApi2: frontendApi2,
      publishableKey: publishableKey,
      proxyUrl: proxyUrl,
      domain: domain,
      signInUrl: signInUrl,
      useDomainForScript: useDomainForScript,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
