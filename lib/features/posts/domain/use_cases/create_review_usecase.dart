import 'package:dartz/dartz.dart';
import 'package:yadlo/features/posts/domain/entities%20/create_post_input.dart';

import '../../../../core/errors/login/Failure.dart';
import '../repo/posts_repository.dart';

class CreateReviewUseCase{
  final PostsRepository repository;

  CreateReviewUseCase(this.repository);
  Future<Either<ApiError, Unit>> call(CreateReviewInput post)async{
    return await repository.createPost(post);
  }

}