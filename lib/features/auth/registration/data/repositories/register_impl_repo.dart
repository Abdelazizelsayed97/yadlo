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
  Future<Either<ApiError,RegistrationInput>> register(RegistrationInput input) async {
    final registerResponse = await _graphQLClient.mutate(
      MutationOptions(
        document: gql(registerRequest),
        variables: {
          "input": ApiRegisterInput(
                  userName: input.userName,
                  email: input.email,
                  password: input.password,
                  device: "DESKTOP")
              .toJson(),
        },
      ),
    );
    print('7777777777');
    if (registerResponse.hasException && registerResponse.data == null) {
      throw ApiServerError();
    } else {
      print('fghjklfghjkl;hjkl;');
      final response =
          ApiRegisterResult.fromJson(registerResponse.data!).data;
      final data = response?.register?.data;
      if (data?.isRegisteredViaSocial == true) {
        return Right(input);
      } else {
        return Left(ApiError(message: response?.register?.message, code: response?.register?.code));
      }
    }
  }
}

extension UserDataToApiUserData on ApiRegisterResult {
  ApiRegisterResultData get map {
    return ApiRegisterResultData(
      register:Register() ,
    );
  }
}

