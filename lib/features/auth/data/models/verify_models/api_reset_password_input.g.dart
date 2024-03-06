// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_reset_password_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResetPasswordVerificationOtpInput
    _$ApiResetPasswordVerificationOtpInputFromJson(Map<String, dynamic> json) =>
        ApiResetPasswordVerificationOtpInput(
          email: json['email'] as String,
          useCase: $enumDecode(_$ApiSendCodeUseCaseEnumMap, json['useCase']),
          code: json['code'] as String,
        );

Map<String, dynamic> _$ApiResetPasswordVerificationOtpInputToJson(
        ApiResetPasswordVerificationOtpInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'useCase': _$ApiSendCodeUseCaseEnumMap[instance.useCase]!,
      'code': instance.code,
    };

const _$ApiSendCodeUseCaseEnumMap = {
  ApiSendCodeUseCase.PASSWORD_RESET: 'PASSWORD_RESET',
  ApiSendCodeUseCase.PHONE_VERIFICATION: 'PHONE_VERIFICATION',
  ApiSendCodeUseCase.EMAIL_VERIFICATION: 'EMAIL_VERIFICATION',
};
