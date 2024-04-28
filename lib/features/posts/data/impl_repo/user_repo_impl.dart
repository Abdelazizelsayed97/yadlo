import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/posts/data/model/users_model/users_model.dart';
import 'package:yadlo/features/posts/domain/entities%20/users_entitis/users_entities.dart';
import 'package:yadlo/features/posts/domain/repo/user_repository.dart';

import '../../../../core/di/graphql_config.dart';
import '../graph_ql/graph_ql_requests.dart';

class UserRepositories implements UserRepository {
  final GraphQlConfig client = GraphQlConfig();

  GraphQLClient get _graphQlObj => client.client;

  UserRepositories() {
    client.init();
  }

  @override
  Future<Either<ApiError, UserEntities>> execute() async {
    final result = await _graphQlObj.query(QueryOptions(
      document: gql(userRequest),
      fetchPolicy: FetchPolicy.networkOnly,
      errorPolicy: ErrorPolicy.all,
      variables: const {},
    ));
    if (result.data == null || result.hasException) {
      throw const ServerException();
    } else {
      final response = ApiUsersModel.fromJson(result.data).user;

      try {
        if (response?.code == 200){
         return  Right(UserEntities as UserEntities);
        }else{
          return left(ApiError(message: response?.message));
        }

      } catch (e) {}
    }
    throw const ServerException();
  }
}
