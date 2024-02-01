import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/verify_email/data/models/api_send_code_input.dart';
import 'package:yadlo/features/auth/verify_email/domain/entities/send_code_ent.dart';
import 'package:yadlo/features/auth/verify_email/domain/user_repo/send_code_repo.dart';

import '../garph_ql/send_code_mutation.dart';
import '../garph_ql/verify_email_mutation.dart';
import '../models/api_verify_email_input.dart';
import '../models/send_code_model.dart';
import '../models/verify_email_model.dart';

class SendCodeRepositoriesImpl implements SendCodeRepositories {
  final GraphQLClient _grahqlClient;

  GraphQlConfig client = GraphQlConfig();

  SendCodeRepositoriesImpl(this._grahqlClient) {
    client.init();
  }

  @override
  Future<Either<ApiError, void>> sendCode(SendCodeInput input) async {
    print('vfghdjgsjkhdlgkjngbhsjnvk,');
    final sendCodeResponse = await _grahqlClient.mutate(
      MutationOptions(
        document: gql(sendCodeRequest),
        errorPolicy: ErrorPolicy.all,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {
          "input": ApiSendCodeInput(
                  email: input.email, useCase: "EMAIL_VERIFICATION")
              .toJson()
        },
      ),
    );
    if (sendCodeResponse.hasException && sendCodeResponse.data == null) {
      throw ApiServerError();
    } else {
      print('8888888888888888888');
      final response =
          SendCode.fromJson(sendCodeResponse.data!).sendEmailVerificationCode;
      final data = response!.data;
      if (response.code == 200) {
        print('success');
        return const Right(null);
      } else {
        print('${response.code}');
        print('failure');
        return Left(ApiError(message: response.message));
      }
    }
  }

  @override
  Future<Either<ApiError, void>> verify(SendCodeInput input) async {
    print('input??????? ${input}');
    final verifyEmailResponse = await _grahqlClient.mutate(
      MutationOptions(
        document: gql(verifyEmailRequest),
        errorPolicy: ErrorPolicy.all,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {
          "input": ApiVerifyEmailInput(
            email: input.email,
            verificationCode: input.verificationCode ?? '',
          ).toJson()
        },
      ),
    );
    print('after input  ${verifyEmailResponse}');
    if (verifyEmailResponse.hasException && verifyEmailResponse.data == null) {
      throw ApiServerError();
    } else {
      final response =
          VerifyEmail.fromJson(verifyEmailResponse.data!).verifyUserByEmail;
      final data = response!.data;
      if (response.code == 200) {
        print('datadatadatadatadatadatadatadata');
        return const Right(null);
      } else {
        print('${response.code}');
        print('failureeeeeeeeeeeeeeeeeeeee');
        return Left(ApiError(message: response.message));
      }
    }
  }
// @override
// Future<Either<ApiError, void>> verify(SendCodeInput input) async {
//   print('vfghdjgsjkhdlgkjngbhsjnvk,');
//   final verifyEmailResponse = await _grahqlClient.mutate(
//     MutationOptions(
//       document: gql(verifyEmailRequest),
//       errorPolicy: ErrorPolicy.all,
//       cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
//       fetchPolicy: FetchPolicy.networkOnly,
//       variables: {
//         "input": ApiVerifyEmailInput(
//             email: input.email, verificationCode: input.verificationCode!)
//             .toJson()
//       },
//     ),
//   );
//   if (verifyEmailResponse.hasException && verifyEmailResponse.data == null) {
//     throw ApiServerError();
//   } else {
//     print('77777777777777777777777777');
//     final response =
//         VerifyEmail.fromJson(verifyEmailResponse.data!).verifyUserByEmail;
//     final data = response!.data;
//     if (response.code == 200) {
//       print('success');
//       return const Right(null);
//     } else {
//       print('${response.code}');
//       print('failure');
//       return Left(ApiError(message: response.message));
//     }
//   }
// }
}
