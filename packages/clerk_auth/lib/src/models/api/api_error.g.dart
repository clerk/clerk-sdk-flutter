// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      message: json['message'] as String,
      code: json['code'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
      longMessage: json['long_message'] as String?,
      authErrorCode:
          $enumDecodeNullable(_$AuthErrorCodeEnumMap, json['auth_error_code']),
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) {
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
  writeNotNull(
      'auth_error_code', _$AuthErrorCodeEnumMap[instance.authErrorCode]);
  return val;
}

const _$AuthErrorCodeEnumMap = {
  AuthErrorCode.serverErrorResponse: 'serverErrorResponse',
  AuthErrorCode.webviewErrorResponse: 'webviewErrorResponse',
  AuthErrorCode.invalidPassword: 'invalidPassword',
  AuthErrorCode.typeInvalid: 'typeInvalid',
  AuthErrorCode.noStageForStatus: 'noStageForStatus',
  AuthErrorCode.noSessionTokenRetrieved: 'noSessionTokenRetrieved',
  AuthErrorCode.noAssociatedStrategy: 'noAssociatedStrategy',
  AuthErrorCode.noAssociatedCodeRetrievalMethod:
      'noAssociatedCodeRetrievalMethod',
  AuthErrorCode.passwordMatchError: 'passwordMatchError',
  AuthErrorCode.jwtPoorlyFormatted: 'jwtPoorlyFormatted',
  AuthErrorCode.actionNotTimely: 'actionNotTimely',
  AuthErrorCode.noSessionFoundForUser: 'noSessionFoundForUser',
  AuthErrorCode.noSuchFirstFactorStrategy: 'noSuchFirstFactorStrategy',
  AuthErrorCode.noSuchSecondFactorStrategy: 'noSuchSecondFactorStrategy',
  AuthErrorCode.signInError: 'signInError',
  AuthErrorCode.passwordResetStrategyError: 'passwordResetStrategyError',
  AuthErrorCode.cannotDeleteSelf: 'cannotDeleteSelf',
  AuthErrorCode.problemsConnecting: 'problemsConnecting',
  AuthErrorCode.requiredFieldsAreMissing: 'requiredFieldsAreMissing',
};

ApiErrorCollection _$ApiErrorCollectionFromJson(Map<String, dynamic> json) =>
    ApiErrorCollection(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ApiError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiErrorCollectionToJson(ApiErrorCollection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errors', instance.errors?.map((e) => e.toJson()).toList());
  return val;
}
