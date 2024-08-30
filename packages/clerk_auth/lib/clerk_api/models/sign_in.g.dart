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
      userData: json['user_data'] == null
          ? null
          : User.fromJson(json['user_data'] as Map<String, dynamic>),
      supportedFirstFactors: (json['supported_first_factors'] as List<dynamic>?)
              ?.map((e) => Factor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      firstFactorVerification: json['first_factor_verification'] == null
          ? null
          : Verification.fromJson(
              json['first_factor_verification'] as Map<String, dynamic>),
      supportedSecondFactors:
          (json['supported_second_factors'] as List<dynamic>?)
                  ?.map((e) => Factor.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
      secondFactorVerification: json['second_factor_verification'] == null
          ? null
          : Verification.fromJson(
              json['second_factor_verification'] as Map<String, dynamic>),
      createdSessionId: json['created_session_id'] as String?,
      abandonAt: DateTime.fromMillisecondsSinceEpoch(
          (json['abandon_at'] as num).toInt()),
    );

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'id': instance.id,
      'status': _$StatusEnumMap[instance.status]!,
      'supported_identifiers': instance.supportedIdentifiers,
      'identifier': instance.identifier,
      'user_data': instance.userData?.toJson(),
      'first_factor_verification': instance.firstFactorVerification?.toJson(),
      'second_factor_verification': instance.secondFactorVerification?.toJson(),
      'created_session_id': instance.createdSessionId,
      'abandon_at': instance.abandonAt.toIso8601String(),
      'supported_first_factors':
          instance.supportedFirstFactors.map((e) => e.toJson()).toList(),
      'supported_second_factors':
          instance.supportedSecondFactors.map((e) => e.toJson()).toList(),
    };

const _$StatusEnumMap = {
  Status.abandoned: 'abandoned',
  Status.active: 'active',
  Status.missingRequirements: 'missing_requirements',
  Status.needsFirstFactor: 'needs_first_factor',
  Status.unverified: 'unverified',
};
