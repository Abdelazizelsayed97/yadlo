import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yadlo/features/auth/domain/use_cases/register_use_case.dart';
import 'package:yadlo/features/auth/domain/use_cases/set_newpass_usecase.dart';
import 'package:yadlo/features/auth/domain/use_cases/verify_use_cases/reset_password_usecase.dart';
import 'package:yadlo/features/auth/domain/use_cases/verify_use_cases/send_code_usecase.dart';
import 'package:yadlo/features/auth/domain/use_cases/verify_use_cases/verify_use_case.dart';
import 'package:yadlo/features/auth/ui/pages/forget_password/set_newpass_cubit.dart';
import 'package:yadlo/features/posts/data/impl_repo/category_repositories_impl.dart';
import 'package:yadlo/features/posts/data/impl_repo/posts_repositories.dart';
import 'package:yadlo/features/posts/domain/repo/category_repositories.dart';
import 'package:yadlo/features/posts/domain/repo/posts_repository.dart';
import 'package:yadlo/features/posts/domain/use_cases/create_review_usecase.dart';
import 'package:yadlo/features/posts/domain/use_cases/delete_review_usecase.dart';
import 'package:yadlo/features/posts/domain/use_cases/upload_pix_usecase.dart';
import 'package:yadlo/features/posts/presentation/pages/get_posts/post_cubit.dart';
import 'package:yadlo/networking/api.dart';

import '../../features/auth/data/repositories/auth_repo_imp.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/use_cases/login_usecase.dart';
import '../../features/auth/ui/pages/login_pages/login_cubit.dart';
import '../../features/auth/ui/pages/register/register_cubit.dart';
import '../../features/auth/ui/pages/verify/send_code_cubit.dart';
import '../../features/posts/domain/use_cases/category_usecase.dart';
import '../../features/posts/domain/use_cases/get_all_review_usecase.dart';


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

    getIt.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(
        getIt<GraphQLClient>(),
      ),
    );

    getIt.registerFactory<LoginUseCase>(
          () => LoginUseCase(getIt<AuthRepository>()),
    );

    getIt.registerLazySingleton<LoginCubit>(
          () => LoginCubit(
        getIt<LoginUseCase>(),
      ),
    );

    // =================================================================

    getIt.registerFactory<RegisterUseCase>(
          () => RegisterUseCase(getIt<AuthRepository>()),
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
        getIt<ResetPasswordUseCase>(),
      ),
    );

    getIt.registerFactory<SendCodeUseCase>(
          () => SendCodeUseCase(getIt<AuthRepository>()),
    );
    getIt.registerFactory<VerifyEmailUseCase>(
          () => VerifyEmailUseCase(getIt<AuthRepository>()),
    );
    getIt.registerFactory<ResetPasswordUseCase>(
          () => ResetPasswordUseCase(getIt<AuthRepository>()),
    );
    getIt.registerFactory<PostCubit>(
          () => PostCubit(getIt<GetAllPostsUseCase>(), getIt<CreateReviewUseCase>(),
          getIt<DeletePostUseCase>(), getIt<UploadPixUseCase>()),
    );
    getIt.registerFactory<GetAllPostsUseCase>(
          () => GetAllPostsUseCase(getIt<PostsRepository>()),
    );
    getIt.registerFactory<UploadPixUseCase>(
          () => UploadPixUseCase(getIt<PostsRepository>()),
    );

    getIt.registerLazySingleton<PostsRepository>(
          () => PostsRepositoriesImpl(
        getIt<GraphQLClient>(),
      ),
    );
// ============  =================================================================
//CategoryUseCase
    getIt.registerFactory(
          () => CategoryUseCase(getIt()),
    );
    getIt.registerFactory<CategoryRepository>(
          () => CategoryRepositoryImpl(getIt()),
    );
    getIt.registerLazySingleton<SetNewPasswordUseCase>(
          () => SetNewPasswordUseCase(getIt<AuthRepository>()),
    );
    getIt.registerFactory<SetNewPasswordCubit>(
          () => SetNewPasswordCubit(
        getIt<SetNewPasswordUseCase>(),
      ),
    );

    // ================================================================
    getIt.registerFactory<CreateReviewUseCase>(
          () => CreateReviewUseCase(
        getIt<PostsRepository>(),
      ),
    );
    getIt.registerFactory<DeletePostUseCase>(
          () => DeletePostUseCase(
        getIt<PostsRepository>(),
      ),
    );
  }
}