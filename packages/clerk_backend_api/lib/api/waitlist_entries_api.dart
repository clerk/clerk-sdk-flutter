//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WaitlistEntriesApi {
  WaitlistEntriesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a waitlist entry
  ///
  /// Creates a new waitlist entry for the given email address. If the email address is already on the waitlist, no new entry will be created and the existing waitlist entry will be returned.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateWaitlistEntryRequest] createWaitlistEntryRequest:
  Future<http.Response> createWaitlistEntryWithHttpInfo({
    CreateWaitlistEntryRequest? createWaitlistEntryRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/waitlist_entries';

    // ignore: prefer_final_locals
    Object? postBody = createWaitlistEntryRequest;

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

  /// Create a waitlist entry
  ///
  /// Creates a new waitlist entry for the given email address. If the email address is already on the waitlist, no new entry will be created and the existing waitlist entry will be returned.
  ///
  /// Parameters:
  ///
  /// * [CreateWaitlistEntryRequest] createWaitlistEntryRequest:
  Future<WaitlistEntry?> createWaitlistEntry({
    CreateWaitlistEntryRequest? createWaitlistEntryRequest,
  }) async {
    final response = await createWaitlistEntryWithHttpInfo(
      createWaitlistEntryRequest: createWaitlistEntryRequest,
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
        'WaitlistEntry',
      ) as WaitlistEntry;
    }
    return null;
  }

  /// List all waitlist entries
  ///
  /// Retrieve a list of waitlist entries for the instance. Entries are ordered by creation date in descending order by default. Supports filtering by email address or status and pagination with limit and offset parameters.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] query:
  ///   Filter waitlist entries by `email_address` or `id`
  ///
  /// * [String] status:
  ///   Filter waitlist entries by their status
  ///
  /// * [String] orderBy:
  ///   Specify the order of results. Supported values are: - `created_at` - `email_address` - `invited_at`  Use `+` for ascending or `-` for descending order. Defaults to `-created_at`.
  Future<http.Response> listWaitlistEntriesWithHttpInfo({
    int? limit,
    int? offset,
    String? query,
    String? status,
    String? orderBy,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/waitlist_entries';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'order_by', orderBy));
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

  /// List all waitlist entries
  ///
  /// Retrieve a list of waitlist entries for the instance. Entries are ordered by creation date in descending order by default. Supports filtering by email address or status and pagination with limit and offset parameters.
  ///
  /// Parameters:
  ///
  /// * [int] limit:
  ///   Applies a limit to the number of results returned. Can be used for paginating the results together with `offset`.
  ///
  /// * [int] offset:
  ///   Skip the first `offset` results when paginating. Needs to be an integer greater or equal to zero. To be used in conjunction with `limit`.
  ///
  /// * [String] query:
  ///   Filter waitlist entries by `email_address` or `id`
  ///
  /// * [String] status:
  ///   Filter waitlist entries by their status
  ///
  /// * [String] orderBy:
  ///   Specify the order of results. Supported values are: - `created_at` - `email_address` - `invited_at`  Use `+` for ascending or `-` for descending order. Defaults to `-created_at`.
  Future<ListWaitlistEntries200Response?> listWaitlistEntries({
    int? limit,
    int? offset,
    String? query,
    String? status,
    String? orderBy,
  }) async {
    final response = await listWaitlistEntriesWithHttpInfo(
      limit: limit,
      offset: offset,
      query: query,
      status: status,
      orderBy: orderBy,
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
        'ListWaitlistEntries200Response',
      ) as ListWaitlistEntries200Response;
    }
    return null;
  }
}
