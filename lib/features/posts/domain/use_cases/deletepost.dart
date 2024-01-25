import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/home/Error/failure.dart';

import '../repo/posts_repository.dart';


class DeletePost{
  final PostsRepository repository;

  DeletePost({required this.repository});
  Future<Either<Failure, Unit>> call(int postId) async {
     return await repository.deletePost(postId);


  }


}