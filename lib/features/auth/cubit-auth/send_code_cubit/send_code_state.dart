part of 'send_code_cubit.dart';

@immutable
abstract class SendCodeState {}

class SendCodeInitial extends SendCodeState {
  final String email;

  SendCodeInitial({required this.email});
  @override
  List<Object> get props => [email];
}

class SendCodeLoading extends SendCodeState {
  @override
  List<Object> get props => [];
}
class SendCodeSuccess extends SendCodeState {
  final String verificationCode;

  SendCodeSuccess(this.verificationCode);
  @override

  List<Object> get props => [verificationCode];
}
class SendCodeFailure extends SendCodeState {
  final String message;

  SendCodeFailure(this.message);
  @override
  List<Object> get props => [message];
}
