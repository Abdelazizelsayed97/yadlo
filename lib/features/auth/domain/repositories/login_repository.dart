import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../entities/login_entites/login_input.dart';
import '../entities/login_entites/user_data.dart';

abstract class UserLoginRepository{
  Future<Either<ApiError, UserData>> login(LoginInput input);
}

