// // // To parse this JSON data, do
// // //
// // //     final review = reviewFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // ApiResultReview reviewFromJson(String str) =>
// //     ApiResultReview.fromJson(json.decode(str));
// //
// // class ApiResultReview {
// //   final Reviews? reviews;
// //
// //   ApiResultReview({
// //     this.reviews,
// //   });
// //
// //   factory ApiResultReview.fromJson(Map<String, dynamic> json) =>
// //       ApiResultReview(
// //         reviews:
// //             json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
// //       );
// // }
// //
// // class Reviews {
// //   final int? code;
// //   final bool? success;
// //   final String? message;
// //   final Data? data;
// //
// //   Reviews({
// //     this.code,
// //     this.success,
// //     this.message,
// //     this.data,
// //   });
// //
// //   factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
// //         code: json["code"],
// //         success: json["success"],
// //         message: json["message"],
// //         data: json["data"] == null ? null : Data.fromJson(json["data"]),
// //       );
// // }
// //
// // class Data {
// //   final List<ApiPostDataItem>? items;
// //
// //   Data({
// //     this.items,
// //   });
// //
// //   factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         items: json["items"] == null
// //             ? []
// //             : List<ApiPostDataItem>.from(
// //                 json["items"]!.map((x) => ApiPostDataItem.fromJson(x))),
// //       );
// // }
// //
// // class ApiPostDataItem {
// //   final String? id;
// //   final String? name;
// //   final String? title;
// //   final String? description;
// //   final Type? type;
// //   final int? commentsCount;
// //   final int? totalVotes;
// //   final int? votesCount;
// //   final int? createdAt;
// //   final int? updatedAt;
// //   final List<Attachment>? attachments;
// //   final ApiUser? user;
// //
// //   ApiPostDataItem({
// //     this.id,
// //     this.name,
// //     this.title,
// //     this.description,
// //     this.type,
// //     this.commentsCount,
// //     this.totalVotes,
// //     this.votesCount,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.attachments,
// //     this.user,
// //   });
// //
// //   factory ApiPostDataItem.fromJson(Map<String, dynamic> json) =>
// //       ApiPostDataItem(
// //         id: json["id"],
// //         name: json["name"],
// //         title: json["title"],
// //         description: json["description"],
// //         type: typeValues.map[json["type"]]!,
// //         commentsCount: json["commentsCount"],
// //         totalVotes: json["totalVotes"],
// //         votesCount: json["votesCount"],
// //         createdAt: json["createdAt"],
// //         updatedAt: json["updatedAt"],
// //         attachments: json["attachments"] == null
// //             ? []
// //             : List<Attachment>.from(
// //                 json["attachments"]!.map((x) => Attachment.fromJson(x))),
// //         user: json["user"] == null ? null : ApiUser.fromJson(json["user"]),
// //       );
// // }
// //
// // class Attachment {
// //   final String? link;
// //
// //   Attachment({
// //     this.link,
// //   });
// //
// //   factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
// //         link: json["link"],
// //       );
// //
// // }
// //
// // enum Type { PLACE, PRODUCT }
// //
// // final typeValues = EnumValues({"PLACE": Type.PLACE, "PRODUCT": Type.PRODUCT});
// //
// // class ApiUser {
// //   final String? userName;
// //   final String? id;
// //
// //   ApiUser({
// //     this.userName,
// //     this.id,
// //   });
// //
// //   factory ApiUser.fromJson(Map<String, dynamic> json) => ApiUser(
// //         userName: json["userName"],
// //         id: json["id"],
// //       );
// //
// // }
// //
// // enum UserName { AHMEDNEGO, KARIM }
// //
// // final userNameValues =
// //     EnumValues({"ahmednego": UserName.AHMEDNEGO, "karim": UserName.KARIM});
// //
// // class EnumValues<T> {
// //   Map<String, T> map;
// //   late Map<T, String> reverseMap;
// //
// //   EnumValues(this.map);
// //
// //   Map<T, String> get reverse {
// //     reverseMap = map.map((k, v) => MapEntry(v, k));
// //     return reverseMap;
// //   }
// // }
// //
// // // =================================================================
// // To parse this JSON data, do
// //
// //     final apiResultReview = apiResultReviewFromJson(jsonString);
//
// import 'dart:convert';
//
// ApiResultReview apiResultReviewFromJson(String str) => ApiResultReview.fromJson(json.decode(str));
//
// String apiResultReviewToJson(ApiResultReview data) => json.encode(data.toJson());
//
// class ApiResultReview {
//   final ApiResultReviewData? data;
//
//   ApiResultReview({
//     this.data,
//   });
//
//   factory ApiResultReview.fromJson(Map<String, dynamic> json) => ApiResultReview(
//     data: json["data"] == null ? null : ApiResultReviewData.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data?.toJson(),
//   };
// }
//
// class ApiResultReviewData {
//   final Reviews? reviews;
//
//   ApiResultReviewData({
//     this.reviews,
//   });
//
//   factory ApiResultReviewData.fromJson(Map<String, dynamic> json) => ApiResultReviewData(
//     reviews: json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "reviews": reviews?.toJson(),
//   };
// }
//
// class Reviews {
//   final int? code;
//   final bool? success;
//   final String? message;
//   final ReviewsData? data;
//
//   Reviews({
//     this.code,
//     this.success,
//     this.message,
//     this.data,
//   });
//
//   factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
//     code: json["code"],
//     success: json["success"],
//     message: json["message"],
//     data: json["data"] == null ? null : ReviewsData.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "code": code,
//     "success": success,
//     "message": message,
//     "data": data?.toJson(),
//   };
// }
//
// class ReviewsData {
//   final PageInfo? pageInfo;
//   final List<ApiPostDataItem>? items;
//
//   ReviewsData({
//     this.pageInfo,
//     this.items,
//   });
//
//   factory ReviewsData.fromJson(Map<String, dynamic> json) => ReviewsData(
//     pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
//     items: json["items"] == null ? [] : List<ApiPostDataItem>.from(json["items"]!.map((x) => ApiPostDataItem.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "pageInfo": pageInfo?.toJson(),
//     "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
//   };
// }
//
// class ApiPostDataItem {
//   final String? id;
//   final String? name;
//   final String? title;
//   final String? description;
//   final Type? type;
//   final int? commentsCount;
//   final int? totalVotes;
//   final int? votesCount;
//   final int? createdAt;
//   final int? updatedAt;
//   final List<Attachment>? attachments;
//   final ApiUser? user;
//
//   ApiPostDataItem({
//     this.id,
//     this.name,
//     this.title,
//     this.description,
//     this.type,
//     this.commentsCount,
//     this.totalVotes,
//     this.votesCount,
//     this.createdAt,
//     this.updatedAt,
//     this.attachments,
//     this.user,
//   });
//
//   factory ApiPostDataItem.fromJson(Map<String, dynamic> json) => ApiPostDataItem(
//     id: json["id"],
//     name: json["name"],
//     title: json["title"],
//     description: json["description"],
//     type: typeValues.map[json["type"]]!,
//     commentsCount: json["commentsCount"],
//     totalVotes: json["totalVotes"],
//     votesCount: json["votesCount"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//     attachments: json["attachments"] == null ? [] : List<Attachment>.from(json["attachments"]!.map((x) => Attachment.fromJson(x))),
//     user: json["user"] == null ? null : ApiUser.fromJson(json["user"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "title": title,
//     "description": description,
//     "type": typeValues.reverse[type],
//     "commentsCount": commentsCount,
//     "totalVotes": totalVotes,
//     "votesCount": votesCount,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "attachments": attachments == null ? [] : List<dynamic>.from(attachments!.map((x) => x.toJson())),
//     "user": user?.toJson(),
//   };
// }
//
// class Attachment {
//   final String? link;
//
//   Attachment({
//     this.link,
//   });
//
//   factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
//     link: json["link"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "link": link,
//   };
// }
//
// enum Type {
//   PLACE,
//   PRODUCT
// }
//
// final typeValues = EnumValues({
//   "PLACE": Type.PLACE,
//   "PRODUCT": Type.PRODUCT
// });
//
// class ApiUser {
//   final UserName? userName;
//   final String? id;
//
//   ApiUser({
//     this.userName,
//     this.id,
//   });
//
//   factory ApiUser.fromJson(Map<String, dynamic> json) => ApiUser(
//     userName: userNameValues.map[json["userName"]]!,
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "userName": userNameValues.reverse[userName],
//     "id": id,
//   };
// }
//
// enum UserName {
//   AHMEDNEGO,
//   KARIM,
//   NAGDY
// }
//
// final userNameValues = EnumValues({
//   "ahmednego": UserName.AHMEDNEGO,
//   "karim": UserName.KARIM,
//   "nagdy": UserName.NAGDY
// });
//
// class PageInfo {
//   final int? page;
//   final int? limit;
//   final bool? hasNext;
//   final bool? hasBefore;
//   final dynamic nextCursor;
//
//   PageInfo({
//     this.page,
//     this.limit,
//     this.hasNext,
//     this.hasBefore,
//     this.nextCursor,
//   });
//
//   factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
//     page: json["page"],
//     limit: json["limit"],
//     hasNext: json["hasNext"],
//     hasBefore: json["hasBefore"],
//     nextCursor: json["nextCursor"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "page": page,
//     "limit": limit,
//     "hasNext": hasNext,
//     "hasBefore": hasBefore,
//     "nextCursor": nextCursor,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
// To parse this JSON data, do
//
//     final apiResultReview = apiResultReviewFromJson(jsonString);

import 'dart:convert';

import 'package:yadlo/core/pagination/api_page_info_input.dart';

ApiResultReview apiResultReviewFromJson(String str) =>
    ApiResultReview.fromJson(json.decode(str));

String apiResultReviewToJson(ApiResultReview data) =>
    json.encode(data.toJson());

class ApiResultReview {
  final Reviews? reviews;

  ApiResultReview({
    this.reviews,
  });

  factory ApiResultReview.fromJson(Map<String, dynamic> json) =>
      ApiResultReview(
        reviews:
            json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
      );

  Map<String, dynamic> toJson() => {
        "reviews": reviews?.toJson(),
      };
}

class Reviews {
  final int? code;
  final bool? success;
  final String? message;
  final Data? data;

  Reviews({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final ApiPageInfo? pageInfo;
  final List<ApiPostDataItem>? items;

  Data({
    this.pageInfo,
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageInfo: json["pageInfo"] == null
            ? null
            : ApiPageInfo.fromJson(json["pageInfo"]),
        items: json["items"] == null
            ? []
            : List<ApiPostDataItem>.from(
                json["items"]!.map((x) => ApiPostDataItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ApiPostDataItem {
  final String? id;
  final String? name;
  final String? title;
  final String? description;
  final Type? type;
  final int? commentsCount;
  final int? totalVotes;
  final int? votesCount;
  final int? createdAt;
  final int? updatedAt;
  final List<ApiAttachment>? attachments;
  final ApiUser? user;

  ApiPostDataItem({
    this.id,
    this.name,
    this.title,
    this.description,
    this.type,
    this.commentsCount,
    this.totalVotes,
    this.votesCount,
    this.createdAt,
    this.updatedAt,
    this.attachments,
    this.user,
  });

  factory ApiPostDataItem.fromJson(Map<String, dynamic> json) =>
      ApiPostDataItem(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
        type: typeValues.map[json["type"]]!,
        commentsCount: json["commentsCount"],
        totalVotes: json["totalVotes"],
        votesCount: json["votesCount"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        attachments: json["attachments"] == null
            ? []
            : List<ApiAttachment>.from(
                json["attachments"]!.map((x) => ApiAttachment.fromJson(x))),
        user: json["user"] == null ? null : ApiUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "description": description,
        "type": typeValues.reverse[type],
        "commentsCount": commentsCount,
        "totalVotes": totalVotes,
        "votesCount": votesCount,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "attachments": attachments == null
            ? []
            : List<dynamic>.from(attachments!.map((x) => x.toJson())),
        "user": user?.toJson(),
      };
}

class ApiAttachment {
  final String? link;

  ApiAttachment({
    this.link,
  });

  factory ApiAttachment.fromJson(Map<String, dynamic> json) => ApiAttachment(
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
      };
}

enum Type { PLACE, PRODUCT }

final typeValues = EnumValues({"PLACE": Type.PLACE, "PRODUCT": Type.PRODUCT});

class ApiUser {
  final String? userName;
  final String? id;

  ApiUser({
    this.userName,
    this.id,
  });

  factory ApiUser.fromJson(Map<String, dynamic> json) => ApiUser(
        userName: json["userName"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userNameValues.reverse[userName],
        "id": id,
      };
}

enum UserName { AHMEDNEGO, KARIM, NAGDY }

final userNameValues = EnumValues({
  "ahmednego": UserName.AHMEDNEGO,
  "karim": UserName.KARIM,
  "nagdy": UserName.NAGDY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
