import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/posts/data/mapper/categorie_mapper.dart';
import 'package:yadlo/features/posts/domain/entities%20/category/category_entity.dart';
import 'package:yadlo/features/posts/domain/repo/category_repositories.dart';

import '../../../../core/di/graphql_config.dart';
import '../graph_ql/graph_ql_requests.dart';
import '../model/api_categries_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final GraphQLClient _graphQLClient;
  GraphQlConfig client = GraphQlConfig();

  CategoryRepositoryImpl(
    this._graphQLClient,
    // this.internetConnection,
  ) {
    client.init();
  }

  @override
  Future<Either<ApiError, List<CategoryModel>>> getCategory() async {
    final result = await _graphQLClient.query(
      QueryOptions(
        document: gql(categoriesQueryRequest),
        fetchPolicy: FetchPolicy.networkOnly,
        errorPolicy: ErrorPolicy.all,
      ),
    );
    final response = ApiCategoriesResult.fromJson(result.data!).categories;

    if (result.data != null) {
      if (response == null || result.hasException) {
        throw ApiServerError();
      } else {
        try {
          return Right(
              response.data?.map((e) => e.mapCategory()).toList() ?? []);
        } catch (e) {
          return left(ApiError(
              message: ApiCategoriesData.fromJson(result.data!).message));
        }
      }
    }
    throw ApiServerError();
  }
}
