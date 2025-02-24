// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) => SignUp(
      id: json['id'] as String,
      status: Status.fromJson(json['status'] as String),
      requiredFields: (json['required_fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as String))
          .toList(),
      optionalFields: (json['optional_fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as String))
          .toList(),
      missingFields: (json['missing_fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as String))
          .toList(),
      unverifiedFields: (json['unverified_fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as String))
          .toList(),
      username: json['username'] as String?,
      emailAddress: json['email_address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      web3Wallet: json['web3_wallet'] as String?,
      passwordEnabled: json['password_enabled'] as bool,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      unsafeMetadata: json['unsafe_metadata'] as Map<String, dynamic>,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>,
      verifications: _toFieldVerificationMap(json['verifications']),
      customAction: json['custom_action'] as bool,
      externalId: json['external_id'] as String?,
      createdSessionId: json['created_session_id'] as String?,
      createdUserId: json['created_user_id'] as String?,
      abandonAt: intToDateTime(json['abandon_at']),
    );

Map<String, dynamic> _$SignUpToJson(SignUp instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': instance.status.toJson(),
    'required_fields': instance.requiredFields.map((e) => e.toJson()).toList(),
    'optional_fields': instance.optionalFields.map((e) => e.toJson()).toList(),
    'missing_fields': instance.missingFields.map((e) => e.toJson()).toList(),
    'unverified_fields':
        instance.unverifiedFields.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('email_address', instance.emailAddress);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('web3_wallet', instance.web3Wallet);
  val['password_enabled'] = instance.passwordEnabled;
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  val['unsafe_metadata'] = instance.unsafeMetadata;
  val['public_metadata'] = instance.publicMetadata;
  val['verifications'] = _fromFieldVerificationMap(instance.verifications);
  val['custom_action'] = instance.customAction;
  writeNotNull('external_id', instance.externalId);
  writeNotNull('created_session_id', instance.createdSessionId);
  writeNotNull('created_user_id', instance.createdUserId);
  val['abandon_at'] = dateTimeToInt(instance.abandonAt);
  return val;
}
