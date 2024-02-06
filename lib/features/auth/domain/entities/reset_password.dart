import 'package:equatable/equatable.dart';
import 'package:yadlo/features/auth/domain/entities/send_code_entites.dart';

class ResetPasswordInput extends Equatable {
  final String email;
  final String verificationCode;
  final SendCodeUseCases useCase;

  const ResetPasswordInput({
    required this.email,
    required this.useCase,
    required  this.verificationCode,
  });

  @override
  List<Object?> get props => [email, useCase, verificationCode];
}

// enum SendCodeUseCases { PASSWORD_RESET, PHONE_VERIFICATION, EMAIL_VERIFICATION }
