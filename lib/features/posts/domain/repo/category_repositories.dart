import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/posts/domain/entities%20/category/category_entity.dart';


abstract class CategoryRepository{
  Future<Either<ApiError,List<CategoryModel>>> getCategory();
  // Future<Either<ApiError,List<SubCategoryEntity>>> getSubCategory();
}
