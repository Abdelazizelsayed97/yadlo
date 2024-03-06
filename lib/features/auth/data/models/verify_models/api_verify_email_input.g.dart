// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_verify_email_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiVerifyEmailInput _$ApiVerifyEmailInputFromJson(Map<String, dynamic> json) =>
    ApiVerifyEmailInput(
      email: json['email'] as String,
      verificationCode: json['verificationCode'] as String,
    );

Map<String, dynamic> _$ApiVerifyEmailInputToJson(
        ApiVerifyEmailInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'verificationCode': instance.verificationCode,
    };
