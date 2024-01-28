
import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../entities/registration_user_input.dart';

abstract class UserRegisterRepository{
  Future<Either<ApiError,void>> register(RegistrationInput input);
}
