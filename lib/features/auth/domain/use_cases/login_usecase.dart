import 'package:dartz/dartz.dart';


import '../entities/login_entites/login_input.dart';
import '../entities/login_entites/user_data.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final UserLoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Either<Exception, UserData>> login(LoginInput input) async {
    return await _loginRepository.login(input);
  }
}
