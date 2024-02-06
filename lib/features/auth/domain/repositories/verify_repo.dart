import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/domain/entities/reset_password.dart';

import '../entities/send_code_entites.dart';
import '../entities/verify_entities.dart';

 abstract class SendCodeRepositories  {
  Future<Either<ApiError,void>> sendCode(SendCodeInput input);
  Future<Either<ApiError,void>> verify(VerifyCodeInput input);
  Future<Either<ApiError,void>> resetPassword(ResetPasswordInput input);
}
