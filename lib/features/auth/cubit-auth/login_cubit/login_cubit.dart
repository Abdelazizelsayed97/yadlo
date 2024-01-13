import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yadlo/features/auth/data/model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {



  }
}
