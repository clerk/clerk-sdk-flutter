//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WaitlistEntriesApi {
  WaitlistEntriesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create multiple waitlist entries
  ///
  /// Creates multiple waitlist entries for the provided email addresses. You can choose whether to send confirmation emails by setting the `notify` parameter to `true` or `false` for each entry. If the `notify` parameter is omitted, it defaults to `true`.  If an email address is already on the waitlist, no new entry will be created and the existing waitlist entry will be returned. Duplicate email addresses within the same request are not allowed.  This endpoint is limited to a maximum of 50 entries per API call. If you need to add more entries, please make multiple requests.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<CreateBulkWaitlistEntriesRequestInner>] createBulkWaitlistEntriesRequestInner:
  ///   Required parameters
  Future<http.Response> createBulkWaitlistEntriesWithHttpInfo({
    List<CreateBulkWaitlistEntriesRequestInner>?
        createBulkWaitlistEntriesRequestInner,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/waitlist_entries/bulk';

    // ignore: prefer_final_locals
    Object? postBody = createBulkWaitlistEntriesRequestInner;

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

  /// Create multiple waitlist entries
  ///
  /// Creates multiple waitlist entries for the provided email addresses. You can choose whether to send confirmation emails by setting the `notify` parameter to `true` or `false` for each entry. If the `notify` parameter is omitted, it defaults to `true`.  If an email address is already on the waitlist, no new entry will be created and the existing waitlist entry will be returned. Duplicate email addresses within the same request are not allowed.  This endpoint is limited to a maximum of 50 entries per API call. If you need to add more entries, please make multiple requests.
  ///
  /// Parameters:
  ///
  /// * [List<CreateBulkWaitlistEntriesRequestInner>] createBulkWaitlistEntriesRequestInner:
  ///   Required parameters
  Future<List<WaitlistEntry>?> createBulkWaitlistEntries({
    List<CreateBulkWaitlistEntriesRequestInner>?
        createBulkWaitlistEntriesRequestInner,
  }) async {
    final response = await createBulkWaitlistEntriesWithHttpInfo(
      createBulkWaitlistEntriesRequestInner:
          createBulkWaitlistEntriesRequestInner,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(
              responseBody, 'List<WaitlistEntry>') as List)
          .cast<WaitlistEntry>()
          .toList(growable: false);
    }
    return null;
  }

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

  /// Delete a pending waitlist entry
  ///
  /// Delete a pending waitlist entry.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] waitlistEntryId (required):
  ///   The ID of the waitlist entry to delete
  Future<http.Response> deleteWaitlistEntryWithHttpInfo(
    String waitlistEntryId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/waitlist_entries/{waitlist_entry_id}'
        .replaceAll('{waitlist_entry_id}', waitlistEntryId);

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

  /// Delete a pending waitlist entry
  ///
  /// Delete a pending waitlist entry.
  ///
  /// Parameters:
  ///
  /// * [String] waitlistEntryId (required):
  ///   The ID of the waitlist entry to delete
  Future<DeletedObject?> deleteWaitlistEntry(
    String waitlistEntryId,
  ) async {
    final response = await deleteWaitlistEntryWithHttpInfo(
      waitlistEntryId,
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

  /// Invite a waitlist entry
  ///
  /// Send an invite to the email address in a waitlist entry.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] waitlistEntryId (required):
  ///   The ID of the waitlist entry to invite
  ///
  /// * [InviteWaitlistEntryRequest] inviteWaitlistEntryRequest:
  Future<http.Response> inviteWaitlistEntryWithHttpInfo(
    String waitlistEntryId, {
    InviteWaitlistEntryRequest? inviteWaitlistEntryRequest,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/waitlist_entries/{waitlist_entry_id}/invite'
        .replaceAll('{waitlist_entry_id}', waitlistEntryId);

    // ignore: prefer_final_locals
    Object? postBody = inviteWaitlistEntryRequest;

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

  /// Invite a waitlist entry
  ///
  /// Send an invite to the email address in a waitlist entry.
  ///
  /// Parameters:
  ///
  /// * [String] waitlistEntryId (required):
  ///   The ID of the waitlist entry to invite
  ///
  /// * [InviteWaitlistEntryRequest] inviteWaitlistEntryRequest:
  Future<WaitlistEntry?> inviteWaitlistEntry(
    String waitlistEntryId, {
    InviteWaitlistEntryRequest? inviteWaitlistEntryRequest,
  }) async {
    final response = await inviteWaitlistEntryWithHttpInfo(
      waitlistEntryId,
      inviteWaitlistEntryRequest: inviteWaitlistEntryRequest,
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

  /// Reject a waitlist entry
  ///
  /// Reject a waitlist entry.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] waitlistEntryId (required):
  ///   The ID of the waitlist entry to reject
  Future<http.Response> rejectWaitlistEntryWithHttpInfo(
    String waitlistEntryId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/waitlist_entries/{waitlist_entry_id}/reject'
        .replaceAll('{waitlist_entry_id}', waitlistEntryId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

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

  /// Reject a waitlist entry
  ///
  /// Reject a waitlist entry.
  ///
  /// Parameters:
  ///
  /// * [String] waitlistEntryId (required):
  ///   The ID of the waitlist entry to reject
  Future<WaitlistEntry?> rejectWaitlistEntry(
    String waitlistEntryId,
  ) async {
    final response = await rejectWaitlistEntryWithHttpInfo(
      waitlistEntryId,
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
}
