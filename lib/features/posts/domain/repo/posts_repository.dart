import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/core/pagination/paganated_data.dart';
import 'package:yadlo/features/posts/domain/entities%20/create_post_input.dart';
import 'package:yadlo/features/posts/domain/entities%20/posts_entity.dart';
import 'package:yadlo/features/posts/domain/entities%20/upload_pix/upload_input.dart';

abstract class PostsRepository {
  Future<Either<ApiError, PaginatedData<PostsEntity>>> getAllPosts( int pageKey);
  Future<Either<ApiError, Unit>> deletePost(String reviewId);
  Future<Either<ApiError, Unit>> updatePost(PostsEntity post);
  Future<Either<ApiError, Unit>> createPost(CreateReviewInput post);
  Future<Either<ApiError, String>> uploadImageCover(UploadInput input);
}
