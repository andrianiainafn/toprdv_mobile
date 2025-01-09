part of 'info_bloc.dart';

sealed class InfoState extends Equatable {
  const InfoState();
}

final class InfoInitial extends InfoState {
  @override
  List<Object> get props => [];
}

final class InfoLoading extends InfoState {
  @override
  List<Object> get props => [];
}

class InfoLoaded extends InfoState {
  Info info;
  InfoLoaded(this.info);

  @override
  List<Object> get props => [info];
}
final class InfoErrorState extends InfoState {
  final String message;
  const InfoErrorState(this.message);
  @override
  List<Object> get props => [message];
}