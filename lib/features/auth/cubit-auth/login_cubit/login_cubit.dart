import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadlo/features/auth/domain/entities/login_input.dart';
import 'package:yadlo/features/auth/domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  void login(LoginInput input) {
    _loginUseCase.call(input);
  }
}
