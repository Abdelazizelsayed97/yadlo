import 'package:dartz/dartz.dart';

import '../entities/login_entites/login_input.dart';
import '../entities/login_entites/user_data.dart';

abstract class UserLoginRepository{
  Future<Either<Exception, UserData>> login(LoginInput input);
}

