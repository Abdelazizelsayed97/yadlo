
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final WelcomeData data;

  Welcome({
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: WelcomeData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class WelcomeData {
  final Reviews reviews;

  WelcomeData({
    required this.reviews,
  });

  factory WelcomeData.fromJson(Map<String, dynamic> json) => WelcomeData(
    reviews: Reviews.fromJson(json["reviews"]),
  );

  Map<String, dynamic> toJson() => {
    "reviews": reviews.toJson(),
  };
}

class Reviews {
  final ReviewsData data;
  final int code;
  final bool success;

  Reviews({
    required this.data,
    required this.code,
    required this.success,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    data: ReviewsData.fromJson(json["data"]),
    code: json["code"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "code": code,
    "success": success,
  };
}

class ReviewsData {
  final List<dynamic> items;

  ReviewsData({
    required this.items,
  });

  factory ReviewsData.fromJson(Map<String, dynamic> json) => ReviewsData(
    items: List<dynamic>.from(json["items"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x)),
  };
}
