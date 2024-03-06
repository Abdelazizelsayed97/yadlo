// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_set_newpass_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSetNewPasswordInput _$ApiSetNewPasswordInputFromJson(
        Map<String, dynamic> json) =>
    ApiSetNewPasswordInput(
      email: json['email'] as String,
      newPassword: json['newPassword'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$ApiSetNewPasswordInputToJson(
        ApiSetNewPasswordInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
      'newPassword': instance.newPassword,
    };
