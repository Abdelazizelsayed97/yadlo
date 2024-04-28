import 'package:dartz/dartz.dart';
import 'package:yadlo/core/errors/login/Failure.dart';
import 'package:yadlo/features/auth/data/models/register_models/register_model.dart';

abstract class SearchRepository {
 Future<Either<ApiError,List<Data>>> searchResult();
 }
