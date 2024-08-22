// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignIn _$SignInFromJson(Map<String, dynamic> json) => SignIn(
      id: json['id'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      supportedIdentifiers: (json['supported_identifiers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      identifier: json['identifier'] as String,
      userData: User.fromJson(json['user_data'] as Map<String, dynamic>),
      supportedFirstFactors: (json['supported_first_factors'] as List<dynamic>)
          .map((e) => Factor.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstVerification: Verification.fromJson(
          json['first_verification'] as Map<String, dynamic>),
      supportedSecondFactors:
          (json['supported_second_factors'] as List<dynamic>)
              .map((e) => Factor.fromJson(e as Map<String, dynamic>))
              .toList(),
      secondVerification: Verification.fromJson(
          json['second_verification'] as Map<String, dynamic>),
      createdSessionId: json['created_session_id'] as String,
      abandonAt: (json['abandon_at'] as num).toInt(),
    );

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'id': instance.id,
      'status': _$StatusEnumMap[instance.status]!,
      'supported_identifiers': instance.supportedIdentifiers,
      'identifier': instance.identifier,
      'user_data': instance.userData,
      'supported_first_factors': instance.supportedFirstFactors,
      'first_verification': instance.firstVerification,
      'supported_second_factors': instance.supportedSecondFactors,
      'second_verification': instance.secondVerification,
      'created_session_id': instance.createdSessionId,
      'abandon_at': instance.abandonAt,
    };

const _$StatusEnumMap = {
  Status.active: 'active',
  Status.abandoned: 'abandoned',
};
