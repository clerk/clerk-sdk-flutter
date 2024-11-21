// ignore_for_file: public_member_api_docs
// See https://clerk.com/docs/reference/frontend-api for
// more details

import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError {
  const ApiError({
    required this.message,
    this.code,
    this.meta,
    this.longMessage,
  });

  final String message;
  final String? code;
  final Map<String, String>? meta;
  final String? longMessage;

  static ApiError fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  @override
  String toString() => longMessage ?? message;
}
