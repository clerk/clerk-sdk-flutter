import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
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
  static ApiError fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}
