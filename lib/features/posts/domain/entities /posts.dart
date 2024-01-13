import 'package:equatable/equatable.dart';

class Post extends Equatable {
 final int id;
 final String title;
 final String body;
 final String image;

 const Post(
     {required this.image, required this.id, required this.title, required this.body});

 @override
 // TODO: implement props
 List<Object?> get props => [id, title, body, image];
}


class Posts extends Equatable {
 final String username;
 final String profilePictureUrl;
 final DateTime postDate;
 final int likes;
 final int awards;
 final String location;
 final String title;
 final String contentImageURL;

 const Posts({
  required this.username,
  required this.profilePictureUrl,
  required this.postDate,
  required this.likes,
  required this.awards,
  required this.location,
  required this.title,
  required this.contentImageURL
 });

  @override
  // TODO: implement props
  List<Object?> get props => [username,profilePictureUrl,postDate,likes,awards,location,title,contentImageURL];
}
