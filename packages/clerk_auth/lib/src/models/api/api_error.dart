import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'api_error.g.dart';

/// [ApiError] Clerk object
@immutable
@JsonSerializable()
class ApiError with InformativeToStringMixin {
  /// Constructor
  const ApiError({
    required this.message,
    this.code,
    this.meta,
    this.longMessage,
    this.authErrorCode,
  });

  /// message
  final String message;

  /// code
  final String? code;

  /// meta data
  final Map<String, dynamic>? meta;

  /// long message
  final String? longMessage;

  /// An optional [AuthErrorCode], indicating this
  /// error is internally generated
  final AuthErrorCode? authErrorCode;

  /// The longer of the two messages
  String get fullMessage => longMessage ?? message;

  /// fromJson
  static ApiError fromJson(dynamic json) {
    return _$ApiErrorFromJson(json as Map<String, dynamic>);
  }

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}

/// [ApiErrorCollection] Clerk object
@immutable
@JsonSerializable()
class ApiErrorCollection {
  /// Constructor
  const ApiErrorCollection({this.errors});

  /// The [ApiError]s
  final List<ApiError>? errors;

  /// formatted error message
  String get errorMessage =>
      errors?.map((e) => e.fullMessage).join('; ') ?? 'Unknown error';

  /// First [AuthErrorCode] encountered
  AuthErrorCode get authErrorCode =>
      errors?.map((e) => e.authErrorCode).nonNulls.firstOrNull ??
      AuthErrorCode.serverErrorResponse;

  /// fromJson
  static ApiErrorCollection fromJson(dynamic json) {
    return _$ApiErrorCollectionFromJson(json as Map<String, dynamic>);
  }

  /// toJson
  Map<String, dynamic> toJson() => _$ApiErrorCollectionToJson(this);
}
