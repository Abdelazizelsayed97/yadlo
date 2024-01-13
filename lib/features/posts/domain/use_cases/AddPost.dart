import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/home/Error/failure.dart';

import '../../../../core/errors/login/Failure.dart';
import '../entities /posts.dart';
import '../repo/posts_repository.dart';

class AddPost{
  final PostsRepository repository;

  AddPost(this.repository);
  Future<Either<Failure, Unit>> call(Post post)async{
    return await repository.addPost(post);
  }

}