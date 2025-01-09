part of 'info_bloc.dart';

sealed class InfoEvent extends Equatable {
  const InfoEvent();
}

class GetInfoEvent extends InfoEvent {
  final int userId;
  final int pageNumber;
  const GetInfoEvent(this.userId, this.pageNumber);
  @override
  List<Object?> get props => [userId,pageNumber];

}

class NewInfoEvent extends InfoEvent{
  final InfoItem infoItem;
  final Info info;

  const NewInfoEvent(this.infoItem,this.info);
  @override
  List<Object?> get props => [];

}