import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../entities/login_input.dart';
import '../entities/user_data.dart';

abstract class UserLoginRepository{
  Future<Either<Exception, UserData>> login(LoginInput input);
}

