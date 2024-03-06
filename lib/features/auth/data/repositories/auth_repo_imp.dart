import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/core/di/graphql_config.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/data/models/set_new_pass_model/api_set_newpass_input.dart';
import 'package:yadlo/features/auth/data/models/set_new_pass_model/api_set_newpass_model.dart';
import 'package:yadlo/features/auth/data/models/verify_models/api_reset_password_input.dart';
import 'package:yadlo/features/auth/data/models/verify_models/api_reset_password_model.dart';
import 'package:yadlo/features/auth/data/models/verify_models/api_send_code_input.dart';
import 'package:yadlo/features/auth/data/models/verify_models/api_verify_email_input.dart';
import 'package:yadlo/features/auth/data/models/verify_models/send_code_model.dart';
import 'package:yadlo/features/auth/data/models/verify_models/verify_email_model.dart';
import 'package:yadlo/features/auth/domain/entities/reset_password.dart';
import 'package:yadlo/features/auth/domain/entities/send_code_entites.dart';
import 'package:yadlo/features/auth/domain/entities/set_newpass_entities.dart';
import 'package:yadlo/features/auth/domain/entities/verify_entities.dart';
import 'package:yadlo/features/auth/ui/pages/shared_preferances.dart';

import '../../domain/entities/login_entites/login_input.dart';
import '../../domain/entities/login_entites/user_data.dart';
import '../../domain/entities/registration_user_input.dart';
import '../../domain/repositories/auth_repository.dart';
import '../graph_ql/auth_graphql_requests.dart';
import '../models/login_model/api_login_input.dart';
import '../models/login_model/login_model.dart';
import '../models/register_models/api_registar_input.dart';
import '../models/register_models/register_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GraphQLClient _graphQLClient;
  GraphQlConfig client = GraphQlConfig();

  AuthRepositoryImpl(this._graphQLClient,) {
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
          ApiLoginResult
              .fromJson(requestResponse.data!)
              .emailAndPasswordLogin;
      final data = response?.data;
      print('${response?.data?.token}');

      if (data != null) {
        SharedPrefs.saveToShard(key: "token", value: data.token);
        SharedPrefs.saveToShard(key: "userID", value: data.id??"");
        print('this user id >>>>>>>>>> ${SharedPrefs.getFromShard(key: 'userID')}');

        return Right(data.map);
      } else {
        return Left(ApiError(message: response?.message, code: response?.code));
      }
    }
  }

  @override
  Future<Either<ApiError, RegistrationInput>> register(
      RegistrationInput input) async {
    final registerResponse = await _graphQLClient.mutate(
      MutationOptions(
        document: gql(registerRequest),
        variables: {
          "input": ApiRegisterInput(
              userName: input.userName,
              email: input.email,
              password: input.password,
              device: "DESKTOP",
              country: "EG")
              .toJson(),
        },
      ),
    );
    if (registerResponse.hasException && registerResponse.data == null) {
      throw ApiServerError();
    } else {
      final response =
          ApiRegisterResult
              .fromJson(registerResponse.data!)
              .register;
      final data = response?.data;
      if (response?.code == 200) {
        return Right(input);
      } else {
        print(response?.message);
        return Left(ApiError(message: response?.message, code: response?.code));
      }
    }
  }

  @override
  Future<Either<ApiError, void>> sendCode(SendCodeInput input) async {
    final sendCodeResponse = await _graphQLClient.mutate(
      MutationOptions(
        document: gql(sendCodeRequest),
        errorPolicy: ErrorPolicy.all,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {"input": ApiSendCodeInput.fromInput(input).toJson()},
      ),
    );
    if (sendCodeResponse.hasException && sendCodeResponse.data == null) {
      throw ApiServerError();
    } else {
      print('${input.useCase}');
      final response =
          SendCode
              .fromJson(sendCodeResponse.data!)
              .sendEmailVerificationCode;
      print('the response =>>>>>>> $response');
      final data = response!.data;
      if (response.code == 200) {
        print('success');
        return const Right(null);
      } else {
        print('${response.code}');
        print('${response.message}');
        return Left(ApiError(message: response.message));
      }
    }
  }

  @override
  Future<Either<ApiError, void>> verify(VerifyCodeInput input) async {
    print('input??????? $input');
    final verifyEmailResponse = await _graphQLClient.mutate(
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
    print('after input  $verifyEmailResponse');
    if (verifyEmailResponse.hasException && verifyEmailResponse.data == null) {
      throw ApiServerError();
    } else {
      final response =
          VerifyEmail
              .fromJson(verifyEmailResponse.data!)
              .verifyUserByEmail;
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

  @override
  Future<Either<ApiError, void>> resetPassword(ResetPasswordInput input) async {
    final resetPasswordResponse = await _graphQLClient.query(
      QueryOptions(
          document: gql(resetPasswordVerificationRequest),
          errorPolicy: ErrorPolicy.all,
          cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
          fetchPolicy: FetchPolicy.networkOnly,
          variables: {
            "input": ApiResetPasswordVerificationOtpInput(
                useCase: ApiSendCodeUseCase.PASSWORD_RESET,
                code: input.verificationCode,
                email: input.email)
                .toJson()
          }),
    );
    if (resetPasswordResponse.hasException &&
        resetPasswordResponse.data == null) {
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${resetPasswordResponse.data}');
      throw ApiServerError();
    } else {
      final response = ResetPasswordVerify
          .fromJson(resetPasswordResponse.data!)
          .doesUserWithVerificationCodeExist;
      print('$response');
      if (response?.data == true) {
        print('datadatadatadatadatadatadatadata');
        return const Right(null);
      } else {
        print('${response?.code}');
        print('qweasdzxc');
        return Left(ApiError(message: response?.message));
      }
    }
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
    if (setNewPasswordResponse.hasException &&
        setNewPasswordResponse.data == null) {
      throw ApiServerError();
    } else {
      final response = SetNewPassword
          .fromJson(setNewPasswordResponse.data!)
          .resetPasswordByEmail;
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

extension UserDataToApiUserData on ApiUserData {
  UserData get map {
    return UserData(
      token: token ?? '',
    );
  }
}
