import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/verify_email/data/models/api_send_code_input.dart';
import 'package:yadlo/features/auth/verify_email/domain/entities/send_code_ent.dart';
import 'package:yadlo/features/auth/verify_email/domain/user_repo/send_code_repo.dart';

import '../garph_ql/send_code_mutation.dart';
import '../models/send_code_model.dart';

class SendCodeRepositoriesImpl implements SendCodeRepositories {
  final GraphQLClient _grahqlClient;

  GraphQlConfig client = GraphQlConfig();

  SendCodeRepositoriesImpl(this._grahqlClient) {
    client.init();
  }

  @override
  Future<Either<ApiError, void>> sendCode(SendCodeInput input) async {
    final sendCodeResponse = await _grahqlClient.mutate(
      MutationOptions(
        document: gql(SendCodeRequest),
        errorPolicy: ErrorPolicy.all,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {"input": ApiSendCodeInput(email: input.email).toJson()},
      ),
    );
    if (sendCodeResponse.hasException && sendCodeResponse.data == null) {
      throw ApiServerError();
    } else {
      final response =
          SendCode.fromJson(sendCodeResponse.data!).sendEmailVerificationCode;
      final data = response!.data;
      if (data == null) {
        return const Right(null);
      } else {
        return Left(ApiError(message: response.message));
      }
    }
  }
}
