import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../repo/posts_repository.dart';

class DeletePostUseCase {
  final PostsRepository repository;

  DeletePostUseCase(this.repository);

  Future<Either<ApiError, Unit>> execute(String reviewId) async {
    return await repository.deletePost(reviewId );
  }
}
