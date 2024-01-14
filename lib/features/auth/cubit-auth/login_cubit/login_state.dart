part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {

}
class loginLoading extends LoginState{

}
class LoginLoaded extends LoginState{
  final String userName;
  LoginLoaded({required this.userName});

}
