part of 'change_rank_bloc.dart';

sealed class ChangeRankState extends Equatable {
  const ChangeRankState();
}

final class ChangeRankInitial extends ChangeRankState {
  @override
  List<Object> get props => [];
}
final class ChangeRankLoading extends ChangeRankState {
  @override
  List<Object> get props => [];
}
final class ChangeRankLoaded extends ChangeRankState {
  @override
  List<Object> get props => [];
}
final class ChangeRankError extends ChangeRankState {
  final String message;
  const ChangeRankError(this.message);
  @override
  List<Object> get props => [message];
}
