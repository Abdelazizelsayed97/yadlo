// To parse this JSON data, do
//
//     final apiCreateReviewResult = apiCreateReviewResultFromJson(jsonString);

import 'dart:convert';

ApiCreateReviewResult apiCreateReviewResultFromJson(String str) => ApiCreateReviewResult.fromJson(json.decode(str));

String apiCreateReviewResultToJson(ApiCreateReviewResult data) => json.encode(data.toJson());

class ApiCreateReviewResult {
  final CreateReview? createReview;

  ApiCreateReviewResult({
    this.createReview,
  });

  factory ApiCreateReviewResult.fromJson(Map<String, dynamic> json) => ApiCreateReviewResult(
    createReview: json["createReview"] == null ? null : CreateReview.fromJson(json["createReview"]),
  );

  Map<String, dynamic> toJson() => {
    "createReview": createReview?.toJson(),
  };
}

class CreateReview {
  final Data? data;
  final int? code;
  final String? message;
  final bool? success;

  CreateReview({
    this.data,
    this.code,
    this.message,
    this.success,
  });

  factory CreateReview.fromJson(Map<String, dynamic> json) => CreateReview(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    code: json["code"],
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "code": code,
    "message": message,
    "success": success,
  };
}

class Data {
  final String? id;
  final String? name;
  final String? title;
  final String? description;
  final String? overallRating;
  final List<Attachment>? attachments;

  Data({
    this.id,
    this.name,
    this.title,
    this.description,
    this.overallRating,
    this.attachments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    title: json["title"],
    description: json["description"],
    overallRating: json["overallRating"],
    attachments: json["attachments"] == null ? [] : List<Attachment>.from(json["attachments"]!.map((x) => Attachment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "title": title,
    "description": description,
    "overallRating": overallRating,
    "attachments": attachments == null ? [] : List<dynamic>.from(attachments!.map((x) => x.toJson())),
  };
}

class Attachment {
  final String? link;

  Attachment({
    this.link,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "link": link,
  };
}
