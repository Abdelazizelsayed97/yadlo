import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';

import '../entities/send_code_ent.dart';

 abstract class SendCodeRepositories  {
  Future<Either<ApiError,void>> sendCode(SendCodeInput input);
}
