// To parse this JSON data, do
//     final apiSearchModel = apiSearchModelFromJson(jsonString);

import 'dart:convert';

ApiSearchModel apiSearchModelFromJson(String str) => ApiSearchModel.fromJson(json.decode(str));

String apiSearchModelToJson(ApiSearchModel data) => json.encode(data.toJson());

class ApiSearchModel {
  final ApiSearch? search;

  ApiSearchModel({
    this.search,
  });

  factory ApiSearchModel.fromJson(Map<String, dynamic> json) => ApiSearchModel(
    search: json["search"] == null ? null : ApiSearch.fromJson(json["search"]),
  );

  Map<String, dynamic> toJson() => {
    "search": search?.toJson(),
  };
}

class ApiSearch {
  final ApiSearchData? data;
  final int? code;
  final bool? success;
  final String? message;

  ApiSearch({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory ApiSearch.fromJson(Map<String, dynamic> json) => ApiSearch(
    data: json["data"] == null ? null : ApiSearchData.fromJson(json["data"]),
    code: json["code"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "code": code,
    "success": success,
    "message": message,
  };
}

class ApiSearchData {
  final ApiUsers? users;
  final ApiReviews? reviews;

  ApiSearchData({
    this.users,
    this.reviews,
  });

  factory ApiSearchData.fromJson(Map<String, dynamic> json) => ApiSearchData(
    users: json["users"] == null ? null : ApiUsers.fromJson(json["users"]),
    reviews: json["reviews"] == null ? null : ApiReviews.fromJson(json["reviews"]),
  );

  Map<String, dynamic> toJson() => {
    "users": users?.toJson(),
    "reviews": reviews?.toJson(),
  };
}

class ApiReviews {
  final List<ApiReviewsItem>? items;
  final ApiPageInfo? pageInfo;

  ApiReviews({
    this.items,
    this.pageInfo,
  });

  factory ApiReviews.fromJson(Map<String, dynamic> json) => ApiReviews(
    items: json["items"] == null ? [] : List<ApiReviewsItem>.from(json["items"]!.map((x) => ApiReviewsItem.fromJson(x))),
    pageInfo: json["pageInfo"] == null ? null : ApiPageInfo.fromJson(json["pageInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "pageInfo": pageInfo?.toJson(),
  };
}

class ApiReviewsItem {
  final String? title;

  ApiReviewsItem({
    this.title,
  });

  factory ApiReviewsItem.fromJson(Map<String, dynamic> json) => ApiReviewsItem(
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
  };
}

class ApiPageInfo {
  final int? page;
  final bool? hasNext;

  ApiPageInfo({
    this.page,
    this.hasNext,
  });

  factory ApiPageInfo.fromJson(Map<String, dynamic> json) => ApiPageInfo(
    page: json["page"],
    hasNext: json["hasNext"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "hasNext": hasNext,
  };
}

class ApiUsers {
  final ApiPageInfo? pageInfo;
  final List<ApiUsersItem>? items;

  ApiUsers({
    this.pageInfo,
    this.items,
  });

  factory ApiUsers.fromJson(Map<String, dynamic> json) => ApiUsers(
    pageInfo: json["pageInfo"] == null ? null : ApiPageInfo.fromJson(json["pageInfo"]),
    items: json["items"] == null ? [] : List<ApiUsersItem>.from(json["items"]!.map((x) => ApiUsersItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pageInfo": pageInfo?.toJson(),
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class ApiUsersItem {
  final String? userName;

  ApiUsersItem({
    this.userName,
  });

  factory ApiUsersItem.fromJson(Map<String, dynamic> json) => ApiUsersItem(
    userName: json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
  };
}
