part of 'category_cubit.dart';

@immutable
abstract class CategoryState extends Equatable {}

class CategoryInitial extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoryModel;

  CategorySuccess(this.categoryModel);

  @override
  List<Object?> get props => [
        categoryModel,
      ];
}

class CategoryFailure extends CategoryState {
  final String message;

  CategoryFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
