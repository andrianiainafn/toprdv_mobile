part of 'change_rank_bloc.dart';

sealed class ChangeRankEvent extends Equatable {
  const ChangeRankEvent();
}
class HandleChangeRank extends ChangeRankEvent{
  final int appointmentId;
  const HandleChangeRank(this.appointmentId);
  @override
  List<Object?> get props => [];
}

