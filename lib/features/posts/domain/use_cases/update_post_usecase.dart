import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';



import '../entities /posts_entity.dart';
import '../repo/posts_repository.dart';

class UpdatePost{
  final PostsRepository repository;

  UpdatePost(this.repository);
  Future<Either<ApiError, Unit>>  Call(PostsEntity post) async {
    return await repository.updatePost(post);
  }

}