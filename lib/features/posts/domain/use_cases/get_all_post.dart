import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/home/Error/failure.dart';

import '../entities /posts.dart';
import '../repo/posts_repository.dart';

class GetAllPosts {
  final PostsRepository repository;

  GetAllPosts(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
