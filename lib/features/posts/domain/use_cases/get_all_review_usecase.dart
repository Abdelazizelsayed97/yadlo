import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/core/pagination/paganated_data.dart';

import '../entities /posts_entity.dart';
import '../repo/posts_repository.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;

  GetAllPostsUseCase(this.repository);

  Future<Either<ApiError, PaginatedData<PostsEntity>>> getAllPosts(
      int pageKey) async {
    return await repository.getAllPosts(pageKey);
  }
}
