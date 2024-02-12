import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../../domain/entities/login_entites/login_input.dart';
import '../../domain/entities/login_entites/user_data.dart';
import '../../domain/repositories/login_repository.dart';
import '../graph_ql/auth_graphql_requests.dart';
import '../models/login_model/api_login_input.dart';
import '../models/login_model/login_model.dart';

class UserRepositoryImpl implements UserLoginRepository {
  final GraphQLClient _graphQLClient;
  GraphQlConfig client = GraphQlConfig();

  UserRepositoryImpl(this._graphQLClient, ) {
    client.init();
  }

  @override
  Future<Either<ApiError, UserData>> login(LoginInput input) async {
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
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("token", data.token);
        return Right(data.map);
      } else {
        return Left(ApiError(message: response?.message, code: response?.code));
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
