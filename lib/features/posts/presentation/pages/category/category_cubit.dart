import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yadlo/features/posts/domain/entities%20/category/category_entity.dart';
import 'package:yadlo/features/posts/domain/use_cases/category_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryUseCase _categoryUseCase;

  CategoryCubit(this._categoryUseCase) : super(CategoryInitial());

  void onCubitStart() {
    fetchCategory();
  }

  Future<void> fetchCategory() async {
    emit(CategoryLoading());
    final response = await _categoryUseCase.execute();
    response.fold((l) {
      emit(CategoryFailure(message: l.message ?? ''));
    }, (r) {
      emit(CategorySuccess(r));
    });
  }
}
