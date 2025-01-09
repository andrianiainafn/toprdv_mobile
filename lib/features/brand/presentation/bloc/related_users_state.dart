part of 'related_users_bloc.dart';

sealed class RelatedUsersState extends Equatable {
  const RelatedUsersState();
}

final class RelatedUsersInitial extends RelatedUsersState {
  @override
  List<Object> get props => [];
}

final class RelatedUsersLoading extends RelatedUsersState {
  @override
  List<Object> get props => [];
}

final class RelatedUsersLoaded extends RelatedUsersState{
  final List<RelatedBrand> relatedUsers;
  const RelatedUsersLoaded(this.relatedUsers);
  @override
  List<Object> get props => [relatedUsers];
}

final class RelatedUsersError extends RelatedUsersState {
  final String message;

  const RelatedUsersError(this.message);
  @override
  List<Object> get props => [message];
}