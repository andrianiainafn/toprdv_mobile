part of 'related_users_bloc.dart';

sealed class RelatedUsersEvent extends Equatable {
  const RelatedUsersEvent();
}

class GetRelatedUser extends RelatedUsersEvent{
  @override
  List<Object?> get props => [];
}
class UpdateRelatedUserEvent extends RelatedUsersEvent{
  final List<RelatedBrand> relatedBrand;
  const UpdateRelatedUserEvent(this.relatedBrand);
  @override
  List<Object?> get props => [relatedBrand];
}