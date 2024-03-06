import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'api_send_code_input.dart';

part 'api_reset_password_input.g.dart';
@JsonSerializable()
class ApiResetPasswordVerificationOtpInput {
  final String email;
  final ApiSendCodeUseCase useCase;
  final String code;




  factory ApiResetPasswordVerificationOtpInput.fromJson(Map<String, dynamic> json) =>
      _$ApiResetPasswordVerificationOtpInputFromJson(json);

  ApiResetPasswordVerificationOtpInput({required this.email, required this.useCase, required this.code});


  Map<String, dynamic> toJson() => _$ApiResetPasswordVerificationOtpInputToJson(this);
}


