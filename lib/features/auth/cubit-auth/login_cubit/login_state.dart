import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// part "login_state.freezed.dart";
// @freezed
// class LoginState<T> with _$LoginState<T> {
//   const factory LoginState.initial() = _Initial;
//   const factory LoginState.loading() = Loading;
//   const factory LoginState.success(T data) = Success<T>;
//   const factory LoginState.error({required String error}) = Error;
// }

abstract class LoginState extends Equatable{

}

class LoadingState extends LoginState{

  @override
  List<Object?> get props => [];


}

class InitialState extends LoginState{

  @override
  List<Object?> get props => [];


}

class SuccessState extends LoginState{

  @override
  List<Object?> get props => [];
}

class FailureState extends LoginState{
  // final String error;
  @override
  List<Object?> get props => [];


}