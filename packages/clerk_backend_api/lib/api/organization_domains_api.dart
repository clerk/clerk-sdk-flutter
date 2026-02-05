//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

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
  ///   The ID of the organization to which the domain belongs
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
  ///   The ID of the organization to which the domain belongs
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

  /// List all organization domains
  ///
  /// Retrieves a list of all organization domains within the current instance. This endpoint can be used to list all domains across all organizations or filter domains by organization, verification status, enrollment mode, or search query.  The response includes pagination information and details about each domain including its verification status, enrollment mode, and associated counts.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] organizationId:
  ///   The ID of the organization to filter domains by
  ///
  /// * [String] verified:
  ///   Filter by verification status
  ///
  /// * [List<String>] enrollmentMode:
  ///   Filter by enrollment mode
  ///
  /// * [String] query:
  ///   Search domains by name or organization ID. If the query starts with \"org_\", it will search by exact organization ID match. Otherwise, it performs a case-insensitive partial match on the domain name.  Note: An empty string or whitespace-only value is not allowed and will result in a validation error.
  ///
  /// * [String] orderBy:
  ///   Allows to return organization domains in a particular order. At the moment, you can order the returned domains by their `name` or `created_at`. In order to specify the direction, you can use the `+/-` symbols prepended to the property to order by. For example, if you want domains to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  Future<http.Response> listAllOrganizationDomainsWithHttpInfo({
    String? organizationId,
    String? verified,
    List<String>? enrollmentMode,
    String? query,
    String? orderBy,
    int? offset,
    int? limit,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/organization_domains';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (organizationId != null) {
      queryParams.addAll(_queryParams('', 'organization_id', organizationId));
    }
    if (verified != null) {
      queryParams.addAll(_queryParams('', 'verified', verified));
    }
    if (enrollmentMode != null) {
      queryParams
          .addAll(_queryParams('csv', 'enrollment_mode', enrollmentMode));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'order_by', orderBy));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// List all organization domains
  ///
  /// Retrieves a list of all organization domains within the current instance. This endpoint can be used to list all domains across all organizations or filter domains by organization, verification status, enrollment mode, or search query.  The response includes pagination information and details about each domain including its verification status, enrollment mode, and associated counts.
  ///
  /// Parameters:
  ///
  /// * [String] organizationId:
  ///   The ID of the organization to filter domains by
  ///
  /// * [String] verified:
  ///   Filter by verification status
  ///
  /// * [List<String>] enrollmentMode:
  ///   Filter by enrollment mode
  ///
  /// * [String] query:
  ///   Search domains by name or organization ID. If the query starts with \"org_\", it will search by exact organization ID match. Otherwise, it performs a case-insensitive partial match on the domain name.  Note: An empty string or whitespace-only value is not allowed and will result in a validation error.
  ///
  /// * [String] orderBy:
  ///   Allows to return organization domains in a particular order. At the moment, you can order the returned domains by their `name` or `created_at`. In order to specify the direction, you can use the `+/-` symbols prepended to the property to order by. For example, if you want domains to be returned in descending order according to their `created_at` property, you can use `-created_at`. If you don't use `+` or `-`, then `+` is implied. Defaults to `-created_at`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  Future<OrganizationDomains?> listAllOrganizationDomains({
    String? organizationId,
    String? verified,
    List<String>? enrollmentMode,
    String? query,
    String? orderBy,
    int? offset,
    int? limit,
  }) async {
    final response = await listAllOrganizationDomainsWithHttpInfo(
      organizationId: organizationId,
      verified: verified,
      enrollmentMode: enrollmentMode,
      query: query,
      orderBy: orderBy,
      offset: offset,
      limit: limit,
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
  ///   The ID of the organization to which the domain belongs
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
  ///   The ID of the organization to which the domain belongs
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
