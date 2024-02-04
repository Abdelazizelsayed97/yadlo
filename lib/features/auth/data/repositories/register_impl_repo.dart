import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/data/graph_ql/register_graph_request.dart';
import 'package:yadlo/features/auth/data/models/register_models/api_registar_input.dart';
import 'package:yadlo/features/auth/domain/entities/registration_user_input.dart';
import 'package:yadlo/features/auth/domain/repositories/registration_repo.dart';

import '../models/register_models/register_model.dart';

class RegisterRepositoryImpl extends UserRegisterRepository {
  final GraphQLClient _graphQLClient;

  GraphQlConfig client = GraphQlConfig();

  RegisterRepositoryImpl(this._graphQLClient) {
    client.init();
  }

  @override
  Future<Either<ApiError,RegistrationInput>> register(RegistrationInput input) async {
    final registerResponse = await _graphQLClient.mutate(
      MutationOptions(
        document: gql(registerRequest),
        variables: {
          "input": ApiRegisterInput(
                  userName: input.userName,
                  email: input.email,
                  password: input.password,
                  device: "DESKTOP",country: "EG")
              .toJson(),
        },
      ),
    );
    if (registerResponse.hasException && registerResponse.data == null) {
      throw ApiServerError();
    } else {
      final response =
          ApiRegisterResult.fromJson(registerResponse.data!).register;
      final data = response?.data;
      if (response?.code == 200) {
        print('=========================');
        return Right(input);
      } else {
        print(response?.message);
        return Left(ApiError(message: response?.message, code: response?.code));
      }
    }
  }
}
extension UserDataToApiUserData on ApiRegisterResult {
  Register get map {
    return Register(
      data: Data() ,
    );
  }
}

