
import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';


import '../entities/login_entites/login_input.dart';
import '../entities/login_entites/user_data.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _loginRepository ;

  LoginUseCase(this._loginRepository);

  Future<Either<ApiError, UserData>> login(LoginInput input) async {
    return await _loginRepository.login(input);
  }
}
