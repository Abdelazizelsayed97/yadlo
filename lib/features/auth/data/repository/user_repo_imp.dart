import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/data/graph_ql/graph_ql_request.dart';
import 'package:yadlo/features/auth/data/model/api_login_input.dart';
import 'package:yadlo/features/auth/data/model/login_model.dart';
import 'package:yadlo/features/auth/domain/entities/login_input.dart';
import 'package:yadlo/features/auth/domain/entities/user_data.dart';
import 'package:yadlo/features/auth/domain/repository/login_repository.dart';

class UserRepositoryImpl implements UserLoginRepository {
  final GraphQLClient _graphQLClient;

  UserRepositoryImpl(this._graphQLClient);

  @override
  Future<Either<LoginFailure, UserData>> login(LoginInput input) async {
    final result = await _graphQLClient.mutate(
      MutationOptions(document: gql(loginRequest), variables: {
        "input": ApiLoginInput(
          email: input.email,
          password: input.password,
          device: "DESKTOP",
        ).toJson(),
      }),
    );
    try {
      final request =
          ApiLoginResult.fromJson(result.data!).emailAndPasswordLogin;
      final data = request.data;
      return right(data.map);
    } catch (e) {
      throw Exception(e);
    }
  }
}

extension UserDataToApiUserData on ApiUserData {
  UserData get map {
    return UserData(
      id: "",
      token: token,
      username: userName,
    );
  }
}
