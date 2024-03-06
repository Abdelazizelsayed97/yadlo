part of 'set_newpass_cubit.dart';

@immutable
abstract class SetNewPasswordState {}

class SetNewPasswordInitial extends SetNewPasswordState {


}
class SetNewPasswordLoading extends SetNewPasswordState {

}
class SetNewPasswordSuccess extends SetNewPasswordState {

}
class SetNewPasswordFailure extends SetNewPasswordState {
  final String message;

  SetNewPasswordFailure(this.message);

  @override
  List<Object> get props => [message];
}
