import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yadlo/features/auth/domain/entities/set_newpass_entities.dart';
import 'package:yadlo/features/auth/domain/use_cases/set_newpass_usecase.dart';

part 'set_newpass_state.dart';

class SetNewPasswordCubit extends Cubit<SetNewPasswordState> {
  final SetNewPasswordUseCase setNewPasswordUseCase;

  SetNewPasswordCubit(this.setNewPasswordUseCase)
      : super(SetNewPasswordInitial());

  void setNewPassword({required SetNewPasswordInput input}) async {
    emit(SetNewPasswordLoading());

    final response = await setNewPasswordUseCase.setNewPassword(input);
    print('$response');
    response.fold((l) {

      emit(SetNewPasswordFailure(l.message ?? ""));
    }, (r) {
      print('setnew reson>>>>>>>>');
      emit(SetNewPasswordSuccess());
    });
  }
}
