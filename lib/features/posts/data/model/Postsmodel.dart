import '../../domain/entities /posts.dart';

class PostModel extends Post {
  const PostModel({required super.id,
    required super.title,
    required super.body,
    required super.image});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body, 'image': image};
  }
}

// class PostsModel extends Posts {
//   PostsModel({required super.username,
//     required super.profilePictureUrl,
//     required super.postDate,
//     required super.likes,
//     required super.awards,
//     required super.location,
//     required super.title,
//     required super.contentImageURL})
//
//   // factory PostsModel.fromJson(Map<String, dynamic> json) {
//   //   return PostsModel(
//   //
//   //       title: json['title'],
//   //
//   //       username: json[''],
//   //       profilePictureUrl: json[''],
//   //       postDate: json ['postDate'],
//   //       likes: json['likes'],
//   //       location: json[''],
//   //       awards: json[null],
//   //       contentImageURL: json ['']);
//   // }
// }
