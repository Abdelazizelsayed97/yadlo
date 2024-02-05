// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_send_code_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSendCodeInput _$ApiSendCodeInputFromJson(Map<String, dynamic> json) =>
    ApiSendCodeInput(
      useCase:
          $enumDecodeNullable(_$ApiSendCodeUseCaseEnumMap, json['useCase']),
      email: json['email'] as String,
    );

Map<String, dynamic> _$ApiSendCodeInputToJson(ApiSendCodeInput instance) =>
    <String, dynamic>{
      'useCase': _$ApiSendCodeUseCaseEnumMap[instance.useCase],
      'email': instance.email,
    };

const _$ApiSendCodeUseCaseEnumMap = {
  ApiSendCodeUseCase.PASSWORD_RESET: 'PASSWORD_RESET',
  ApiSendCodeUseCase.PHONE_VERIFICATION: 'PHONE_VERIFICATION',
  ApiSendCodeUseCase.EMAIL_VERIFICATION: 'EMAIL_VERIFICATION',
};
