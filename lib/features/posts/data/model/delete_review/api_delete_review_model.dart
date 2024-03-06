// To parse this JSON data, do
//
//     final apiDeleteReviewResult = apiDeleteReviewResultFromJson(jsonString);

import 'dart:convert';

ApiDeleteReviewResult apiDeleteReviewResultFromJson(String str) => ApiDeleteReviewResult.fromJson(json.decode(str));

String apiDeleteReviewResultToJson(ApiDeleteReviewResult data) => json.encode(data.toJson());

class ApiDeleteReviewResult {
  final DeleteReview? deleteReview;

  ApiDeleteReviewResult({
    this.deleteReview,
  });

  factory ApiDeleteReviewResult.fromJson(Map<String, dynamic> json) => ApiDeleteReviewResult(
    deleteReview: json["deleteReview"] == null ? null : DeleteReview.fromJson(json["deleteReview"]),
  );

  Map<String, dynamic> toJson() => {
    "deleteReview": deleteReview?.toJson(),
  };
}

class DeleteReview {
  final int? code;
  final String? message;
  final bool? success;

  DeleteReview({
    this.code,
    this.message,
    this.success,
  });

  factory DeleteReview.fromJson(Map<String, dynamic> json) => DeleteReview(
    code: json["code"],
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "success": success,
  };
}
