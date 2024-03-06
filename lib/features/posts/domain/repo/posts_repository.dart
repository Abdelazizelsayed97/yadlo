import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/core/paganated_data.dart';
import 'package:yadlo/features/posts/domain/entities%20/create_post_input.dart';
import 'package:yadlo/features/posts/domain/entities%20/posts_entity.dart';

abstract class PostsRepository {
  Future<Either<ApiError, PaginatedData<PostsEntity>>> getAllPosts( int pageKey);
  Future<Either<ApiError, Unit>> deletePost(String reviewId);
  Future<Either<ApiError, Unit>> updatePost(PostsEntity post);
  Future<Either<ApiError, Unit>> createPost(CreateReviewInput post);
}
