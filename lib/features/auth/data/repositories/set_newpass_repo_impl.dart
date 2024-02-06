import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/data/graph_ql/auth_graphql_requests.dart';
import 'package:yadlo/features/auth/data/models/set_new_pass_model/api_set_newpass_input.dart';
import 'package:yadlo/features/auth/domain/entities/set_newpass_entities.dart';
import 'package:yadlo/features/auth/domain/repositories/set_newpass_repo.dart';

import '../models/set_new_pass_model/api_set_newpass_model.dart';

class SetNewPasswordImpl extends SetNewPasswordRepository {
  final GraphQLClient _graphQLClient;

  GraphQlConfig client = GraphQlConfig();

  SetNewPasswordImpl(this._graphQLClient) {
    client.init();
  }

  @override
  Future<Either<ApiError, void>> setNewPassword(
      SetNewPasswordInput input) async {
    final setNewPasswordResponse = await _graphQLClient.mutate(
      MutationOptions(
        document: gql(setNewPasswordRequest),
        variables: {
          "input": ApiSetNewPasswordInput(
                  email: input.email,
                  newPassword: input.password,
                  code: input.code)
              .toJson(),
        },
      ),
    );
    if (setNewPasswordResponse.hasException && setNewPasswordResponse.data == null) {
      throw ApiServerError();
    } else {
      final response =
          SetNewPassword.fromJson(setNewPasswordResponse.data!).resetPasswordByEmail;
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

extension UserDataToApiUserData on SetNewPassword {
  ResetPasswordByEmail get map {
    return ResetPasswordByEmail(
      data: Data(),
    );
  }
}
