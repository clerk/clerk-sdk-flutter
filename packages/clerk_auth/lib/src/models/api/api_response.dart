import 'dart:io';

import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/models/api/api_error.dart';
import 'package:clerk_auth/src/models/client/client.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// [ApiResponse] holds parsed Clerk data from a back-end http response
@immutable
class ApiResponse with InformativeToStringMixin {
  /// Constructs an instance of [ApiResponse]
  const ApiResponse({
    required this.status,
    this.errors,
    this.client,
    this.response,
  });

  /// Constructs an [ApiResponse] for situations in which the backend
  /// failed to respond
  ApiResponse.fatal({required ApiError error})
      : status = 0,
        errors = [error],
        response = null,
        client = null;

  /// http status
  final int status;

  /// [Client] parsed from the response body
  final Client? client;

  /// List of errors returned by the call
  final List<ApiError>? errors;

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
      'errors': errors?.map((e) => e.toJson()).toList(),
      'client': client?.toJson(),
    };
  }

  /// formatted error message
  String get errorMessage => errors?.map((e) => e.fullMessage).join('; ') ?? '';

  /// First [AuthErrorCode] encountered
  AuthErrorCode get authErrorCode =>
      errors?.firstWhereOrNull((e) => e.authErrorCode != null)?.authErrorCode ??
      AuthErrorCode.serverErrorResponse;
}
