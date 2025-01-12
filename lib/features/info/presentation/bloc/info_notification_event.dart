part of 'info_notification_bloc.dart';

sealed class InfoNotificationEvent extends Equatable {
  const InfoNotificationEvent();
}
class NewInfoAdded extends InfoNotificationEvent{

  @override
  List<Object?> get props => [];

}

class ResetInfoNotification extends InfoNotificationEvent{
  @override
  List<Object?> get props => [];
}
