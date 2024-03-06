// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_registar_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRegisterInput _$ApiRegisterInputFromJson(Map<String, dynamic> json) =>
    ApiRegisterInput(
      country: json['country'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      device: json['device'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$ApiRegisterInputToJson(ApiRegisterInput instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'device': instance.device,
      'country': instance.country,
    };
