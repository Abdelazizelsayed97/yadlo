import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yadlo/features/posts/domain/entities%20/users_entitis/users_entities.dart';
import 'package:yadlo/features/posts/domain/use_cases/users_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserUseCAse userUseCAse;

  UserCubit(this.userUseCAse) : super(UserInitial());

  Future<void> execute() async {
    final result = await userUseCAse.execute();
    emit(UserLoading());
    result.fold((l) {
      emit(UserError(message: l.message ?? ""));
    }, (r) {
      emit(UserLoaded(user: UserEntities(id: r.id)));
    });
  }
}
