import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/posts/domain/entities%20/category/category_entity.dart';
import 'package:yadlo/features/posts/domain/repo/category_repositories.dart';

class CategoryUseCase{
  final CategoryRepository _categoryRepository;
  CategoryUseCase(this._categoryRepository);
  Future<Either<ApiError,List<CategoryModel>>> execute() async{
    return await _categoryRepository.getCategory();
  }

}