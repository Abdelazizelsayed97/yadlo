import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../../domain/entities/login_input.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repository/login_repository.dart';
import '../graph_ql/graph_ql_request.dart';
import '../model/api_login_input.dart';
import '../model/login_model.dart';

class UserRepositoryImpl implements UserLoginRepository {
  final GraphQLClient _graphQLClient;

  GraphQlConfig client = GraphQlConfig();

  UserRepositoryImpl(this._graphQLClient) {
    client.init();
  }

  @override
  Future<Either<Exception, UserData>> login(LoginInput input) async {
    final requestResponse = await _graphQLClient.mutate(
      MutationOptions(
        document: gql(loginRequest),
        errorPolicy: ErrorPolicy.all,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {
          "input": ApiLoginInput(
            email: input.email,
            password: input.password,
            device: "DESKTOP",
          ).toJson(),
        },
      ),
    );

    if (requestResponse.hasException && requestResponse.data == null) {
      throw ApiServerError();
    } else {
      final response =
          ApiLoginResult.fromJson(requestResponse.data!).emailAndPasswordLogin;
      final data = response?.data;
      if (data != null) {
        return Right(data.map);
      } else {
        throw Left(ApiError(message: response?.message, code: response?.code));
      }
    }
  }
}

extension UserDataToApiUserData on ApiUserData {
  UserData get map {
    return UserData(
      token: token ?? '',
    );
  }
}
