import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/home/Error/failure.dart';


import '../../../../core/errors/login/Failure.dart';

import '../entities /posts.dart';
import '../repo/posts_repository.dart';

class UpdatePost{
  final PostsRepository repository;

  UpdatePost(this.repository);
  Future<Either<Failure, Unit>>  Call(Post post) async {
    return await repository.updatePost(post);
  }

}