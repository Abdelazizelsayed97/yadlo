import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/domain/entities/reset_password.dart';
import 'package:yadlo/features/auth/domain/entities/send_code_entites.dart';
import 'package:yadlo/features/auth/domain/entities/set_newpass_entities.dart';
import 'package:yadlo/features/auth/domain/entities/verify_entities.dart';

import '../entities/login_entites/login_input.dart';
import '../entities/login_entites/user_data.dart';
import '../entities/registration_user_input.dart';

abstract class AuthRepository {
  Future<Either<ApiError, UserData>> login(LoginInput input);

  Future<Either<ApiError, RegistrationInput>> register(RegistrationInput input);

  Future<Either<ApiError, void>> setNewPassword(SetNewPasswordInput input);

  Future<Either<ApiError, void>> sendCode(SendCodeInput input);

  Future<Either<ApiError, void>> verify(VerifyCodeInput input);

  Future<Either<ApiError, void>> resetPassword(ResetPasswordInput input);
}
