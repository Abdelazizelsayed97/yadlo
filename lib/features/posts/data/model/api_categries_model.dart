// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

ApiCategoriesResult categoriesFromJson(String str) =>
    ApiCategoriesResult.fromJson(json.decode(str));

class ApiCategoriesResult {
  final ApiCategoriesData? categories;

  ApiCategoriesResult({
    this.categories,
  });

  factory ApiCategoriesResult.fromJson(Map<String, dynamic> json) => ApiCategoriesResult(
        categories: json["categories"] == null
            ? null
            : ApiCategoriesData.fromJson(json["categories"]),
      );

}

class ApiCategoriesData {
  final List<ApiCategoryData>? data;
  final int? code;
  final bool? success;
  final String? message;

  ApiCategoriesData({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory ApiCategoriesData.fromJson(Map<String, dynamic> json) =>
      ApiCategoriesData(
        data: json["data"] == null
            ? []
            : List<ApiCategoryData>.from(
                json["data"]!.map((x) => ApiCategoryData.fromJson(x))),
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );
}

class ApiCategoryData {
  final String? id;
  final String? enName;
  final List<ApiSubcategory>? subcategories;

  ApiCategoryData({
    this.id,
    this.enName,
    this.subcategories,
  });

  factory ApiCategoryData.fromJson(Map<String, dynamic> json) =>
      ApiCategoryData(
        id: json["id"],
        enName: json["enName"],
        subcategories: json["subcategories"] == null
            ? []
            : List<ApiSubcategory>.from(
                json["subcategories"]!.map((x) => ApiSubcategory.fromJson(x))),
      );
}

class ApiSubcategory {
  final String? id;
  final String? enName;

  ApiSubcategory({
    this.id,
    this.enName,
  });

  factory ApiSubcategory.fromJson(Map<String, dynamic> json) => ApiSubcategory(
        id: json["id"],
        enName: json["enName"],
      );
}
