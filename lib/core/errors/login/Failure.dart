import 'package:equatable/equatable.dart';

abstract class LoginFailure extends Equatable{}

class NoConnectionFailure extends LoginFailure {


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();}

class NoExistFailure extends LoginFailure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WrongPassword extends LoginFailure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}








