// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part "register_state.freezed.dart";
//
// @freezed
// class RegisterState<T> with _$RegisterState<T> {
//   const factory RegisterState.initial() = _Initial;
//
//   const factory RegisterState.loading() = Loading;
//
//   const factory RegisterState.success() = Success;
//
//   const factory RegisterState.error({required String error}) = Error;
// }
import 'package:equatable/equatable.dart';


abstract class RegisterState extends Equatable{
  void emitRegisterState() {}

}

class RegLoadingState extends RegisterState           {

  @override
  List<Object?> get props => [];


}

class RegInitialState extends RegisterState{

  @override
  List<Object?> get props => [];


}

class RegSuccessState extends RegisterState{
 final String email;

  RegSuccessState(this.email);
  @override
  List<Object?> get props => [email];
}

class RegFailureState extends RegisterState{
  final String message ;


  RegFailureState(this.message);



  @override
  List<Object?> get props => [message];


}