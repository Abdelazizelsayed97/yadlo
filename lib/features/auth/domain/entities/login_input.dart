import 'package:equatable/equatable.dart';

class LoginInput extends Equatable {
  final String email;
  final String password;
  final String? token;

  const LoginInput({required this.email, required this.password,this.token,});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password,token];
}