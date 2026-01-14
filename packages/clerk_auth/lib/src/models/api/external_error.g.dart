// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalError _$ExternalErrorFromJson(Map<String, dynamic> json) =>
    ExternalError(
      message: json['message'] as String,
      code: json['code'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
      longMessage: json['long_message'] as String?,
      errors: json['errors'] == null
          ? null
          : ExternalErrorCollection.fromJson(
              json['errors'] as Map<String, dynamic>),
      errorCode:
          $enumDecodeNullable(_$ClerkErrorCodeEnumMap, json['error_code']),
    );

Map<String, dynamic> _$ExternalErrorToJson(ExternalError instance) {
  final val = <String, dynamic>{
    'message': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('meta', instance.meta);
  writeNotNull('long_message', instance.longMessage);
  writeNotNull('errors', instance.errors?.toJson());
  writeNotNull('error_code', _$ClerkErrorCodeEnumMap[instance.errorCode]);
  return val;
}

const _$ClerkErrorCodeEnumMap = {
  ClerkErrorCode.serverErrorResponse: 'serverErrorResponse',
  ClerkErrorCode.noStageForStatus: 'noStageForStatus',
  ClerkErrorCode.noSessionTokenRetrieved: 'noSessionTokenRetrieved',
  ClerkErrorCode.noAssociatedStrategy: 'noAssociatedStrategy',
  ClerkErrorCode.noAssociatedCodeRetrievalMethod:
      'noAssociatedCodeRetrievalMethod',
  ClerkErrorCode.passwordMatchError: 'passwordMatchError',
  ClerkErrorCode.jwtPoorlyFormatted: 'jwtPoorlyFormatted',
  ClerkErrorCode.noSessionFoundForUser: 'noSessionFoundForUser',
  ClerkErrorCode.noSuchFirstFactorStrategy: 'noSuchFirstFactorStrategy',
  ClerkErrorCode.noSuchSecondFactorStrategy: 'noSuchSecondFactorStrategy',
  ClerkErrorCode.passwordResetStrategyError: 'passwordResetStrategyError',
  ClerkErrorCode.cannotDeleteSelf: 'cannotDeleteSelf',
  ClerkErrorCode.unknownError: 'unknownError',
  ClerkErrorCode.clientAppError: 'clientAppError',
};

ExternalErrorCollection _$ExternalErrorCollectionFromJson(
        Map<String, dynamic> json) =>
    ExternalErrorCollection(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ExternalError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExternalErrorCollectionToJson(
    ExternalErrorCollection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errors', instance.errors?.map((e) => e.toJson()).toList());
  return val;
}
