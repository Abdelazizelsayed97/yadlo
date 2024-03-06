import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  final List<CategoryModel>? data;

  const CategoriesEntity(this.data);

  @override
  List<Object?> get props => [
        data,
      ];
}

class CategoryModel extends Equatable {
  final String? categoryId;
  final String? enName;
  final List<SubCategoryModel>? subcategories;

  const CategoryModel({
    required this.categoryId,
    required this.enName,
    required this.subcategories,
  });

  @override
  List<Object?> get props => [
        categoryId,
        enName,
        subcategories,
      ];
}

class SubCategoryModel extends Equatable {
  final String? subCategoryId;
  final String? enName;

  const SubCategoryModel({
    required this.subCategoryId,
    required this.enName,
  });

  @override
  List<Object?> get props => [
        subCategoryId,
        enName,
      ];
}
