import 'dart:io';

import 'package:clerk_auth/src/models/api/api_error.dart';
import 'package:clerk_auth/src/models/client/client.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:meta/meta.dart';

/// [ApiResponse] holds parsed Clerk data from a back-end http response
@immutable
class ApiResponse with InformativeToStringMixin {
  /// Constructs an instance of [ApiResponse]
  const ApiResponse({
    required this.status,
    ApiErrorCollection? errorCollection,
    this.client,
    this.response,
  }) : errorCollection = errorCollection ?? const ApiErrorCollection();

  /// Constructs an [ApiResponse] for situations in which the backend
  /// failed to respond
  factory ApiResponse.fatal({required ApiError error}) {
    return ApiResponse(
      status: 0,
      response: null,
      client: null,
      errorCollection: ApiErrorCollection(errors: [error]),
    );
  }

  /// http status
  final int status;

  /// [Client] parsed from the response body
  final Client? client;

  /// List of errors returned by the call
  final ApiErrorCollection errorCollection;

  /// Specific response data from the API call
  final Map<String, dynamic>? response;

  /// is the response the one that was expected?
  bool get isOkay => status == HttpStatus.ok;

  /// do we have an error?
  bool get isError => isOkay == false;

  /// is there a parsed client with an okay response?
  bool get hasClient => isOkay && client is Client;

  /// toJson
  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'errors': errorCollection,
      'client': client,
    };
  }
}
