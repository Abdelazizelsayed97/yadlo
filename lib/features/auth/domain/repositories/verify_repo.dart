import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../entities/verify_entities.dart';

 abstract class SendCodeRepositories  {
  Future<Either<ApiError,void>> sendCode(SendCodeInput input);
  Future<Either<ApiError,void>> verify(SendCodeInput input);
}
