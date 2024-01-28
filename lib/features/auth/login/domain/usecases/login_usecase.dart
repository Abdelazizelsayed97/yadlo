import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';


import '../entities/login_input.dart';
import '../entities/user_data.dart';
import '../repository/login_repository.dart';

class LoginUseCase {
  final UserLoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Either<Exception, UserData>> call(LoginInput input) async {
    return await _loginRepository.login(input);
  }
}
