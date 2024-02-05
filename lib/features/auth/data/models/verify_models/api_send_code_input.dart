import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yadlo/features/auth/domain/use_cases/verify_use_cases/send_code_usecase.dart';

import '../../../domain/entities/send_code_entites.dart';

part 'api_send_code_input.g.dart';

@JsonSerializable()
class ApiSendCodeInput {
  final ApiSendCodeUseCase? useCase;
  final String email;

  ApiSendCodeInput(
     {required this.useCase,
    required this.email,
  });

  factory ApiSendCodeInput.fromInput(SendCodeInput input) {
    return ApiSendCodeInput(
      useCase: mapTiApiEnum(input.useCase!),
      email: input.email,
    );
  }

  factory ApiSendCodeInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSendCodeInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSendCodeInputToJson(this);
}


enum ApiSendCodeUseCase {
  PASSWORD_RESET,
  PHONE_VERIFICATION,
  EMAIL_VERIFICATION
}


ApiSendCodeUseCase mapTiApiEnum(SendCodeUseCases useCases) {
  print('useCase is =>${useCases}');
  switch (useCases) {
    case SendCodeUseCases.PASSWORD_RESET:
      return ApiSendCodeUseCase.PASSWORD_RESET;
    case SendCodeUseCases.PHONE_VERIFICATION:
      return ApiSendCodeUseCase.PHONE_VERIFICATION;
    case SendCodeUseCases.EMAIL_VERIFICATION:
      return ApiSendCodeUseCase.EMAIL_VERIFICATION;
  }
}