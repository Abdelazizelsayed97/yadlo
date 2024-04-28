import 'package:equatable/equatable.dart';


class PostsEntity extends Equatable {
  final String postId;
  final String name;
  final String title;
  final String description;
  final String type;
  final int commentsCount;
  final int totalVotes;
  final int votesCount;
  final int createdAt;
  final UserEntity? user;
  final List<Attachments> attachments;

  const PostsEntity({
    required this.attachments,
    required this.name,
    required this.title,
    required this.description,
    required this.type,
    required this.commentsCount,
    required this.totalVotes,
    required this.votesCount,
    required this.createdAt,
    required this.user,
    required this.postId,
  });

  @override
  List<Object?> get props => [
        name,
        title,
        description,
        type,
        commentsCount,
        totalVotes,
        votesCount,
        createdAt,
        user,
        postId,
        attachments
      ];
}

class UserEntity {
  final String userName;
  final String userID;

  UserEntity({
    required this.userID,
    required this.userName,
  });
}

class Attachments {
  final String? imageUrl;

  Attachments({required this.imageUrl});
}
