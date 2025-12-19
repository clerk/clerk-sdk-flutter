import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'external_error.g.dart';

/// Error class renamed this is for backwards compatibility
@Deprecated('Use ExternalError instead.')
typedef ApiError = ExternalError;

/// [ExternalError] Clerk object
@immutable
@JsonSerializable()
class ExternalError with InformativeToStringMixin {
  /// Constructor
  const ExternalError({
    required this.message,
    this.code,
    this.meta,
    this.longMessage,
  });

  /// message
  final String message;

  /// code
  final String? code;

  /// meta data
  final Map<String, dynamic>? meta;

  /// long message
  final String? longMessage;

  /// The longer of the two messages
  String get fullMessage => longMessage ?? message;

  /// fromJson
  static ExternalError fromJson(dynamic json) {
    return _$ExternalErrorFromJson(json as Map<String, dynamic>);
  }

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$ExternalErrorToJson(this);
}

/// Error class renamed this is for backwards compatibility
@Deprecated('Use ExternalErrorCollection instead.')
typedef ApiErrorCollection = ExternalErrorCollection;

/// [ExternalErrorCollection] Clerk object
@immutable
@JsonSerializable()
class ExternalErrorCollection {
  /// Constructor
  const ExternalErrorCollection({this.errors});

  /// The [ExternalError]s
  final List<ExternalError>? errors;

  /// formatted error message
  String get errorMessage =>
      errors?.map((e) => e.fullMessage).join('; ') ?? 'Unknown error';

  /// fromJson
  static ExternalErrorCollection fromJson(dynamic json) {
    return _$ExternalErrorCollectionFromJson(json as Map<String, dynamic>);
  }

  /// toJson
  Map<String, dynamic> toJson() => _$ExternalErrorCollectionToJson(this);
}
