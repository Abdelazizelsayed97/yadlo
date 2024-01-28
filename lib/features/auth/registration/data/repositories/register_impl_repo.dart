import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/registration/data/graph_ql/graph_request.dart';
import 'package:yadlo/features/auth/registration/data/model/api_registar_input.dart';
import 'package:yadlo/features/auth/registration/domain/entities/registration_user_input.dart';
import 'package:yadlo/features/auth/registration/domain/repositories/registration_repo.dart';

import '../model/register_model.dart';

class RegisterRepositoryImpl extends UserRegisterRepository {
  final GraphQLClient _graphQLClient;

  GraphQlConfig client = GraphQlConfig();

  RegisterRepositoryImpl(this._graphQLClient) {
    client.init();
  }

  @override
  Future<Either<ApiError,void>> register(RegistrationInput input) async {
    final registerRespone = await _graphQLClient.mutate(
      MutationOptions(
        document: gql(registerRequest),
        variables: {
          "input": ApiRegisterInput(
                  userName: input.userName,
                  email: input.email,
                  password: input.password as String,
                  device: 'DESKTOP')
              .toJson(),
        },
      ),
    );
    if (registerRespone.hasException && registerRespone.data == null) {
      throw ApiServerError();
    } else {
      final response =
          ApiRegisterResult.fromJson(registerRespone.data!).apiRegisterData;
      final data = response?.register?.data;
      if (data != null) {
        return Right(data.unVerifiedEmail);
      } else {
        return Left(ApiError(message: response?.register?.message, code: response?.register?.code));
      }
    }
  }
}

extension UserDataToApiUserData on Register {
  Register get map {
    return Register(
      data: data
    );
  }
}

