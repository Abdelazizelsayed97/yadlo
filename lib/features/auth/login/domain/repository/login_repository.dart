import 'package:dartz/dartz.dart';

import '../entities/login_input.dart';
import '../entities/user_data.dart';

abstract class UserLoginRepository{
  Future<Either<Exception, UserData>> login(LoginInput input);
}

