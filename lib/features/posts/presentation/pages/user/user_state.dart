part of 'user_cubit.dart';

@immutable
abstract class UserState extends Equatable{}

class UserInitial extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
 class UserLoading extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UserLoaded extends UserState {
  final UserEntities user;
  UserLoaded({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
class UserError extends UserState {
  final String message;
  UserError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}