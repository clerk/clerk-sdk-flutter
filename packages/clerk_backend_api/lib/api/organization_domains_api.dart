//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrganizationDomainsApi {
  OrganizationDomainsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a new organization domain.
  ///
  /// Creates a new organization domain. By default the domain is verified, but can be optionally set to unverified.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization where the new domain will be created.
  ///
  /// * [CreateOrganizationDomainRequest] createOrganizationDomainRequest (required):
  Future<http.Response> createOrganizationDomainWithHttpInfo(
    String organizationId,
    CreateOrganizationDomainRequest createOrganizationDomainRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/domains'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody = createOrganizationDomainRequest;

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

  /// Create a new organization domain.
  ///
  /// Creates a new organization domain. By default the domain is verified, but can be optionally set to unverified.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization where the new domain will be created.
  ///
  /// * [CreateOrganizationDomainRequest] createOrganizationDomainRequest (required):
  Future<OrganizationDomain?> createOrganizationDomain(
    String organizationId,
    CreateOrganizationDomainRequest createOrganizationDomainRequest,
  ) async {
    final response = await createOrganizationDomainWithHttpInfo(
      organizationId,
      createOrganizationDomainRequest,
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
        'OrganizationDomain',
      ) as OrganizationDomain;
    }
    return null;
  }

  /// Remove a domain from an organization.
  ///
  /// Removes the given domain from the organization.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the domain belongs to
  ///
  /// * [String] domainId (required):
  ///   The ID of the domain
  Future<http.Response> deleteOrganizationDomainWithHttpInfo(
    String organizationId,
    String domainId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/domains/{domain_id}'
        .replaceAll('{organization_id}', organizationId)
        .replaceAll('{domain_id}', domainId);

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

  /// Remove a domain from an organization.
  ///
  /// Removes the given domain from the organization.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the domain belongs to
  ///
  /// * [String] domainId (required):
  ///   The ID of the domain
  Future<DeletedObject?> deleteOrganizationDomain(
    String organizationId,
    String domainId,
  ) async {
    final response = await deleteOrganizationDomainWithHttpInfo(
      organizationId,
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

  /// Get a list of all domains of an organization.
  ///
  /// Get a list of all domains of an organization.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] verified:
  ///   Filter domains by their verification status. `true` or `false`
  ///
  /// * [String] enrollmentMode:
  ///   Filter domains by their enrollment mode
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<http.Response> listOrganizationDomainsWithHttpInfo(
    String organizationId, {
    String? verified,
    String? enrollmentMode,
    int? limit,
    int? offset,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/domains'
        .replaceAll('{organization_id}', organizationId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (verified != null) {
      queryParams.addAll(_queryParams('', 'verified', verified));
    }
    if (enrollmentMode != null) {
      queryParams.addAll(_queryParams('', 'enrollment_mode', enrollmentMode));
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

  /// Get a list of all domains of an organization.
  ///
  /// Get a list of all domains of an organization.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The organization ID.
  ///
  /// * [String] verified:
  ///   Filter domains by their verification status. `true` or `false`
  ///
  /// * [String] enrollmentMode:
  ///   Filter domains by their enrollment mode
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  Future<OrganizationDomains?> listOrganizationDomains(
    String organizationId, {
    String? verified,
    String? enrollmentMode,
    int? limit,
    int? offset,
  }) async {
    final response = await listOrganizationDomainsWithHttpInfo(
      organizationId,
      verified: verified,
      enrollmentMode: enrollmentMode,
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
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'OrganizationDomains',
      ) as OrganizationDomains;
    }
    return null;
  }

  /// Update an organization domain.
  ///
  /// Updates the properties of an existing organization domain.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the domain belongs to
  ///
  /// * [String] domainId (required):
  ///   The ID of the domain
  ///
  /// * [UpdateOrganizationDomainRequest] updateOrganizationDomainRequest (required):
  Future<http.Response> updateOrganizationDomainWithHttpInfo(
    String organizationId,
    String domainId,
    UpdateOrganizationDomainRequest updateOrganizationDomainRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/organizations/{organization_id}/domains/{domain_id}'
        .replaceAll('{organization_id}', organizationId)
        .replaceAll('{domain_id}', domainId);

    // ignore: prefer_final_locals
    Object? postBody = updateOrganizationDomainRequest;

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

  /// Update an organization domain.
  ///
  /// Updates the properties of an existing organization domain.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId (required):
  ///   The ID of the organization the domain belongs to
  ///
  /// * [String] domainId (required):
  ///   The ID of the domain
  ///
  /// * [UpdateOrganizationDomainRequest] updateOrganizationDomainRequest (required):
  Future<OrganizationDomain?> updateOrganizationDomain(
    String organizationId,
    String domainId,
    UpdateOrganizationDomainRequest updateOrganizationDomainRequest,
  ) async {
    final response = await updateOrganizationDomainWithHttpInfo(
      organizationId,
      domainId,
      updateOrganizationDomainRequest,
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
        'OrganizationDomain',
      ) as OrganizationDomain;
    }
    return null;
  }
}
