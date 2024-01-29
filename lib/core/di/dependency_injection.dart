import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/features/auth/cubit-auth/register_cubit/register_cubit.dart';
import 'package:yadlo/features/auth/registration/domain/repositories/registration_repo.dart';
import 'package:yadlo/features/auth/registration/domain/use_cases/register_use_case.dart';
import 'package:yadlo/networking/api.dart';

import '../../features/auth/cubit-auth/login_cubit/login_cubit.dart';
import '../../features/auth/login/data/repository/user_repo_imp.dart';
import '../../features/auth/login/domain/repository/login_repository.dart';
import '../../features/auth/login/domain/usecases/login_usecase.dart';
import '../../features/auth/registration/data/repositories/register_impl_repo.dart';

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

    getIt.registerLazySingleton<RegisterCubit>(
      () => RegisterCubit(
        getIt<RegisterUseCase>(),
      ),
    );
  }
}
