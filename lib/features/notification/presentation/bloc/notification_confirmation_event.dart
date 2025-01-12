part of 'notification_confirmation_bloc.dart';

sealed class NotificationConfirmationEvent extends Equatable {
  const NotificationConfirmationEvent();
}

class HandleNewNotification extends NotificationConfirmationEvent{

  final OSNotification notification;
  const HandleNewNotification(this.notification);

  @override
  List<Object?> get props => [notification];

}

class ConfirmNotification extends NotificationConfirmationEvent{
  @override
  List<Object?> get props => [];
}

class TImeOutNotification extends NotificationConfirmationEvent{
  @override
  List<Object?> get props => [];
}
