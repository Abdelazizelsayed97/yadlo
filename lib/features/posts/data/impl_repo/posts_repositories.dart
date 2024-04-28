import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/core/pagination/paganated_data.dart';
import 'package:yadlo/features/posts/data/mapper/get_post_mapper.dart';
import 'package:yadlo/features/posts/data/mapper/upload_file_mapper.dart';
import 'package:yadlo/features/posts/data/model/reviews_models/posts_model_api.dart';
import 'package:yadlo/features/posts/domain/entities%20/create_post_input.dart';
import 'package:yadlo/features/posts/domain/entities%20/upload_pix/upload_input.dart';

import '../../../auth/ui/pages/shared_preferances.dart';
import '../../domain/entities /posts_entity.dart';
import '../../domain/repo/posts_repository.dart';
import '../graph_ql/graph_ql_requests.dart';
import '../model/create_post_model/api_create_review_input.dart';
import '../model/create_post_model/create_post_model.dart';
import '../model/delete_review/api_delete_review_model.dart';
import '../model/reviews_models/api_posts_input.dart';
import '../model/upload_pix/upload_pix_model.dart';

class PostsRepositoriesImpl implements PostsRepository {
  // final InternetConnection internetConnection;
  final GraphQLClient _graphQLClient;
  final GraphQlConfig client = GraphQlConfig();

  GraphQLClient get _graphQlObj => client.client;

  PostsRepositoriesImpl(
    this._graphQLClient,
    // this.internetConnection,
  ) {
    client.init();
  }

  @override
  Future<Either<ApiError, PaginatedData<PostsEntity>>> getAllPosts(
      int pageKey) async {
    final result = await _graphQLClient.query(
      QueryOptions(
        document: gql(reviewsQueryRequest),
        fetchPolicy: FetchPolicy.networkOnly,
        errorPolicy: ErrorPolicy.all,
        variables: {
          "input": ApiPaginateInput(
            limit: 4,
            page: pageKey,
          ).toJson(),
        },
      ),
    );
    if (result.data == null) {
      throw ApiServerError();
    } else {
      final response = ApiResultReview.fromJson(result.data!).reviews;
      final data = response?.data;
      if (data == null || result.hasException) {
        throw ApiServerError();
      } else {
        try {
          final List<ApiPostDataItem> list = [];
          data.items
              ?.map(
                (e) => list.add(e),
              )
              .toList();

          return right(
            PaginatedData(
              dataItems: list.map((e) => e.mapPost()).toList(),
              pageInfo: PageInfo(
                page: data.pageInfo?.page ?? 0,
                limit: data.pageInfo?.limit ?? 0,
                hasNext: data.pageInfo?.hasNext ?? false,
              ),
            ),
          );
        } on ApiServerError {
          return left(
            ApiError(
              message: response?.message,
              code: response?.code,
            ),
          );
        }
      }
    }
  }

  @override
  Future<Either<ApiError, Unit>> deletePost(String reviewId) async {
    final result = await _graphQlObj.mutate(
      MutationOptions(
        document: gql(deleteReviewRequest),
        variables: {
          'reviewId': reviewId,
        },
      ),
    );
    if (result.data == null) {
      throw const ServerException();
    } else {
      final response =
          ApiDeleteReviewResult.fromJson(result.data!).deleteReview;

      if (response?.code == 200) {
        return const Right(unit);
      } else {
        return Left(ApiError(message: response?.message));
      }
    }
  }

  @override
  Future<Either<ApiError, Unit>> updatePost(PostsEntity post) {
    // TODO: implement updatepost
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, Unit>> createPost(CreateReviewInput input) async {
    final result = await _graphQlObj.mutate(
      MutationOptions(
        document: gql(createReviewRequest),
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {"input": ApiCreateReviewInput.fromInput(input).toJson()},
      ),
    );
    if (result.data == null) {
      throw const ServerException();
    } else {
      final response =
          ApiCreateReviewResult.fromJson(result.data!).createReview;
      if (response?.code == 200) {
        return const Right(unit);
      } else {
        return Left(ApiError(message: response?.message));
      }
    }
  }

  @override
  Future<Either<ApiError, String>> uploadImageCover(UploadInput input) async {
    final result = await client.client.mutate(
      MutationOptions(
        document: gql(upLoadRequest),
        variables: (await input.mapper()).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.data == null) {
      throw const ServerException();
    } else {
      final response = ApiUploadPhotoResult.fromJson(result.data!).uploadFile;
      if (response?.code == 200) {
        print('this is response >>>>>>>>>>>> ${response?.data}');
        SharedPrefs.removeFromShard(key: 'imageUrl');
        await SharedPrefs.saveToShard(
            key: 'imageUrl', value: response?.data ?? "");
        return Right(response?.data ?? "");
      } else {
        return Left(ApiError(message: response?.message));
      }
    }
  }
}
