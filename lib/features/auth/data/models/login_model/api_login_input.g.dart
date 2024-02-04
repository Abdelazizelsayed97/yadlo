// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/login_model/api_login_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiLoginInput _$ApiLoginInputFromJson(Map<String, dynamic> json) =>
    ApiLoginInput(
      email: json['email'] as String,
      password: json['password'] as String,
      device: json['device'] as String,
    );

Map<String, dynamic> _$ApiLoginInputToJson(ApiLoginInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'device': instance.device,
    };
