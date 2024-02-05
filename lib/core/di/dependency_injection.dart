import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/features/auth/domain/repositories/registration_repo.dart';
import 'package:yadlo/features/auth/domain/use_cases/register_use_case.dart';
import 'package:yadlo/features/auth/data/repositories/send_code_repo_impl.dart';
import 'package:yadlo/features/auth/domain/use_cases/verify_use_cases/send_code_usecase.dart';
import 'package:yadlo/features/auth/domain/use_cases/verify_use_cases/verify_use_case.dart';
import 'package:yadlo/features/auth/domain/repositories/verify_repo.dart';
import 'package:yadlo/networking/api.dart';

import '../../features/auth/data/repositories/login_user_repo_imp.dart';
import '../../features/auth/domain/repositories/login_repository.dart';
import '../../features/auth/domain/use_cases/login_usecase.dart';
import '../../features/auth/data/repositories/register_impl_repo.dart';
import '../../features/auth/ui/cubit/login_cubit/login_cubit.dart';
import '../../features/auth/ui/cubit/register_cubit/register_cubit.dart';
import '../../features/auth/ui/cubit/send_code_cubit/send_code_cubit.dart';

final getIt = GetIt.instance;

class AppDi {
  static Future<void> setupGetIt() async {
    getIt.registerLazySingleton<Link>(
      () {
        final authLink = AuthLink(getToken: () async {
          const token = ApiConsts.token;
          if (token.isNotEmpty) {
            return 'Bearer $token';
          } else {
            return null;
          }
        });

        final httpLink = HttpLink(
          'https://yodly.onrender.com/graphql',
          defaultHeaders: {
            "Apollo-Require-Preflight": "true",
          },
        );

        final concatLink = authLink.concat(httpLink);

        return concatLink;
      },
    );

    getIt.registerLazySingleton<GraphQLClient>(
      () => GraphQLClient(link: getIt(), cache: GraphQLCache()),
    );

    getIt.registerLazySingleton<ApiConsts>(() => ApiConsts());

    getIt.registerLazySingleton<UserLoginRepository>(
      () => UserRepositoryImpl(getIt<GraphQLClient>()),
    );

    getIt.registerFactory<LoginUseCase>(
      () => LoginUseCase(getIt<UserLoginRepository>()),
    );

    getIt.registerLazySingleton<LoginCubit>(
      () => LoginCubit(
        getIt<LoginUseCase>(),
      ),
    );

    getIt.registerLazySingleton<UserRegisterRepository>(
          () => RegisterRepositoryImpl(getIt<GraphQLClient>()),
    );
    getIt.registerFactory<RegisterUseCase>(
          () => RegisterUseCase(getIt<UserRegisterRepository>()),
    );

    getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(
        getIt<RegisterUseCase>(),
      ),
    );
    getIt.registerFactory<SendCodeCubit>(
      () => SendCodeCubit(
        getIt<SendCodeUseCase>(),
        getIt<VerifyEmailUseCase>(),
        // getIt<RegistrationInput>(),
      ),

      // getIt< SendCodeRepositoriesImpl >()
    );
    getIt.registerFactory<SendCodeUseCase>(
          () => SendCodeUseCase(getIt<SendCodeRepositories>()),
    );  getIt.registerFactory<VerifyEmailUseCase>(
          () => VerifyEmailUseCase(getIt<SendCodeRepositories>()),
    );
    getIt.registerLazySingleton<SendCodeRepositories>(
          () => SendCodeRepositoriesImpl(getIt<GraphQLClient>()),
    );
  }
}
