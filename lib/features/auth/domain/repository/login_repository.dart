import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

abstract class UserLoginRepository{
  Future<Either<LoginFailure,void>> login();
}

