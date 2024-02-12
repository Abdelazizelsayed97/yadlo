part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}
class PostLoading extends PostState {}
class PostSuccess extends PostState {}
class PostFailure extends PostState {}
