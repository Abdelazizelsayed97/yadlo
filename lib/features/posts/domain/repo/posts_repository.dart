import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/home/Error/failure.dart';
import 'package:yadlo/features/posts/domain/entities%20/posts.dart';


abstract class PostsRepository {
  Future<Either<Failure,List<Post>>> getAllPosts();
  Future<Either<Failure,Unit>> deletePost(int Id);
  Future<Either<Failure,Unit>> updatePost(Post post);
  Future<Either<Failure,Unit>>addPost(Post post);
}