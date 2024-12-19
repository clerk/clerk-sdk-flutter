import 'dart:io';

import 'models.dart';

/// [ApiResponse] holds parsed Clerk data from a back-end http response
class ApiResponse {
  /// Constructs an instance of [ApiResponse]
  const ApiResponse({
    required this.status,
    this.errors,
    this.client,
  });

  /// Constructs an [ApiResponse] for situations in which the backend
  /// failed to respond
  ApiResponse.fatal({required ApiError error})
      : status = 0,
        errors = [error],
        client = null;

  /// http status
  final int status;

  /// [Client] parsed from the response body
  final Client? client;

  /// List of errors returned by the call
  final List<ApiError>? errors;

  /// is the response the one that was expected?
  bool get isOkay => status == HttpStatus.ok;

  /// do we have an error?
  bool get isError => isOkay == false;

  /// is there a parsed client with an okay response?
  bool get hasClient => isOkay && client is Client;

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'errors': errors?.map((e) => e.toJson()).toList(),
      'client': client?.toJson(),
    };
  }

  /// formatted error message
  String get errorMessage =>
      errors?.isNotEmpty == true ? errors!.join('; ') : 'Unknown error';
}
