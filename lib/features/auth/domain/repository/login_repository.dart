import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/domain/entities/login_input.dart';
import 'package:yadlo/features/auth/domain/entities/user_data.dart';

abstract class UserLoginRepository{
  Future<Either<LoginFailure, UserData>> login(LoginInput input);
}

