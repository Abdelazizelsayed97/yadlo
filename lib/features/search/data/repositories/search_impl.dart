import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/data/models/register_models/register_model.dart';
import 'package:yadlo/features/search/data/models%20/api_search_model.dart';

import '../../../../core/di/graphql_config.dart';
import '../../domain/repository/search_repository.dart';
import '../graph_ql/graph_ql.dart';

class SearchRepositoryImpl implements SearchRepository {
  final GraphQlConfig client = GraphQlConfig();

  GraphQLClient get _graphQlObj => client.client;

  SearchRepositoryImpl() {
    client.init();
  }

  @override
  Future<Either<ApiError, List<Data>>> searchResult() async {
    final result = await _graphQlObj.query(
      QueryOptions(
        document: gql(searchRequest),
        variables: const {"input": {}},
        fetchPolicy: FetchPolicy.networkOnly,
        errorPolicy: ErrorPolicy.all,
      ),
    );
    if (result.data == null || result.hasException) {
      throw const ServerException();
    } else {
      final response = ApiSearchModel.fromJson(result.data!).search;
      if (response?.code == 200) {
        return right(response?.data as List<Data>);
      }else{
        return left(ApiError(message: response?.message));
      }
    }
  }
}
