import 'package:yadlo/features/posts/data/model/api_categries_model.dart';
import 'package:yadlo/features/posts/domain/entities%20/category/category_entity.dart';

extension bb on ApiCategoriesData {
  CategoriesEntity mapList() {
    return CategoriesEntity(data?.map((e) => e.mapCategory()).toList());
  }
}

extension ConvertCategoriesEntityToApiCategories on ApiCategoryData {
  CategoryModel mapCategory() {
    return CategoryModel(
      categoryId: id ?? '',
      enName: enName ?? '',
      subcategories: subcategories?.map((e) => e.mapSubCategory()).toList(),
    );
  }
}

extension ConvertSubCategoryEntityToApiSubcategory on ApiSubcategory {
  SubCategoryModel mapSubCategory() {
    return SubCategoryModel(
      enName: enName ?? '',
      subCategoryId: id ?? '',
    );
  }
}
