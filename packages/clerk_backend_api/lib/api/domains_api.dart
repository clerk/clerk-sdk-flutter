//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DomainsApi {
  DomainsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add a domain
  ///
  /// Add a new domain for your instance. Useful in the case of multi-domain instances, allows adding satellite domains to an instance. The new domain must have a `name`. The domain name can contain the port for development instances, like `localhost:3000`. At the moment, instances can have only one primary domain, so the `is_satellite` parameter must be set to `true`. If you're planning to configure the new satellite domain to run behind a proxy, pass the `proxy_url` parameter accordingly.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AddDomainRequest] addDomainRequest:
  Future<http.Response> addDomainWithHttpInfo({
    AddDomainRequest? addDomainRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/domains';

    // ignore: prefer_final_locals
    Object? postBody = addDomainRequest;

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

  /// Add a domain
  ///
  /// Add a new domain for your instance. Useful in the case of multi-domain instances, allows adding satellite domains to an instance. The new domain must have a `name`. The domain name can contain the port for development instances, like `localhost:3000`. At the moment, instances can have only one primary domain, so the `is_satellite` parameter must be set to `true`. If you're planning to configure the new satellite domain to run behind a proxy, pass the `proxy_url` parameter accordingly.
  ///
  /// Parameters:
  ///
  /// * [AddDomainRequest] addDomainRequest:
  Future<Domain?> addDomain({
    AddDomainRequest? addDomainRequest,
  }) async {
    final response = await addDomainWithHttpInfo(
      addDomainRequest: addDomainRequest,
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
        'Domain',
      ) as Domain;
    }
    return null;
  }

  /// Delete a satellite domain
  ///
  /// Deletes a satellite domain for the instance. It is currently not possible to delete the instance's primary domain.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] domainId (required):
  ///   The ID of the domain that will be deleted. Must be a satellite domain.
  Future<http.Response> deleteDomainWithHttpInfo(
    String domainId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/domains/{domain_id}'.replaceAll('{domain_id}', domainId);

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

  /// Delete a satellite domain
  ///
  /// Deletes a satellite domain for the instance. It is currently not possible to delete the instance's primary domain.
  ///
  /// Parameters:
  ///
  /// * [String] domainId (required):
  ///   The ID of the domain that will be deleted. Must be a satellite domain.
  Future<DeletedObject?> deleteDomain(
    String domainId,
  ) async {
    final response = await deleteDomainWithHttpInfo(
      domainId,
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

  /// List all instance domains
  ///
  /// Use this endpoint to get a list of all domains for an instance. The response will contain the primary domain for the instance and any satellite domains. Each domain in the response contains information about the URLs where Clerk operates and the required CNAME targets.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<http.Response> listDomainsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/domains';

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

  /// List all instance domains
  ///
  /// Use this endpoint to get a list of all domains for an instance. The response will contain the primary domain for the instance and any satellite domains. Each domain in the response contains information about the URLs where Clerk operates and the required CNAME targets.
  Future<Domains?> listDomains() async {
    final response = await listDomainsWithHttpInfo();
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
        'Domains',
      ) as Domains;
    }
    return null;
  }

  /// Update a domain
  ///
  /// The `proxy_url` can be updated only for production instances. Update one of the instance's domains. Both primary and satellite domains can be updated. If you choose to use Clerk via proxy, use this endpoint to specify the `proxy_url`. Whenever you decide you'd rather switch to DNS setup for Clerk, simply set `proxy_url` to `null` for the domain. When you update a production instance's primary domain name, you have to make sure that you've completed all the necessary setup steps for DNS and emails to work. Expect downtime otherwise. Updating a primary domain's name will also update the instance's home origin, affecting the default application paths.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] domainId (required):
  ///   The ID of the domain that will be updated.
  ///
  /// * [UpdateDomainRequest] updateDomainRequest (required):
  Future<http.Response> updateDomainWithHttpInfo(
    String domainId,
    UpdateDomainRequest updateDomainRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/domains/{domain_id}'.replaceAll('{domain_id}', domainId);

    // ignore: prefer_final_locals
    Object? postBody = updateDomainRequest;

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

  /// Update a domain
  ///
  /// The `proxy_url` can be updated only for production instances. Update one of the instance's domains. Both primary and satellite domains can be updated. If you choose to use Clerk via proxy, use this endpoint to specify the `proxy_url`. Whenever you decide you'd rather switch to DNS setup for Clerk, simply set `proxy_url` to `null` for the domain. When you update a production instance's primary domain name, you have to make sure that you've completed all the necessary setup steps for DNS and emails to work. Expect downtime otherwise. Updating a primary domain's name will also update the instance's home origin, affecting the default application paths.
  ///
  /// Parameters:
  ///
  /// * [String] domainId (required):
  ///   The ID of the domain that will be updated.
  ///
  /// * [UpdateDomainRequest] updateDomainRequest (required):
  Future<Domain?> updateDomain(
    String domainId,
    UpdateDomainRequest updateDomainRequest,
  ) async {
    final response = await updateDomainWithHttpInfo(
      domainId,
      updateDomainRequest,
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
        'Domain',
      ) as Domain;
    }
    return null;
  }
}
