import 'package:equatable/equatable.dart';
import 'package:yadlo/features/auth/domain/entities/login_entites/user_data.dart';

// part "login_state.freezed.dart";
// @freezed
// class LoginState<T> with _$LoginState<T> {
//   const factory LoginState.initial() = _Initial;
//   const factory LoginState.loading() = Loading;
//   const factory LoginState.success(T data) = Success<T>;
//   const factory LoginState.error({required String error}) = Error;
// }

abstract class LoginState extends Equatable {}

class LoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class InitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends LoginState {
  final UserData date;

  SuccessState(this.date);
  @override
  List<Object?> get props => [date];
}

class FailureState extends LoginState {
  final String message;

  FailureState(this.message);

  @override
  List<Object?> get props => [message];
}
