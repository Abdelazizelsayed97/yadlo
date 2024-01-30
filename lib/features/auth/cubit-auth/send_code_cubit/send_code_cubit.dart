import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yadlo/features/auth/registration/domain/entities/registration_user_input.dart';
import 'package:yadlo/features/auth/verify_email/domain/entities/send_code_ent.dart';

import '../../verify_email/domain/use_case/send_code_usecase.dart';

part 'send_code_state.dart';

class SendCodeCubit extends Cubit<SendCodeState> {
  final SendCodeUseCase _sendCodeUseCase;
  final RegistrationInput input;
  SendCodeCubit(this._sendCodeUseCase, this.input) : super(SendCodeInitial(email: input.email));


  void emitSendCodeStates({required SendCodeInput input})async{
      emit(SendCodeLoading());
   final response =   await _sendCodeUseCase.sendCode(input );
      response.fold((l) {
        if(l.message != 200){
          emit(SendCodeFailure(l.message??''));
        }
      }, (r) {
        emit(SendCodeSuccess());

      });
  }

}
