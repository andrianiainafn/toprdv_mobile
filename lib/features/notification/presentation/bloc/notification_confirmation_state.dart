part of 'notification_confirmation_bloc.dart';

sealed class NotificationConfirmationState extends Equatable {
  const NotificationConfirmationState();
}

final class NotificationConfirmationInitial extends NotificationConfirmationState {
  @override
  List<Object> get props => [];
}
class NotificationConfirmationTimer extends NotificationConfirmationState{
  @override
  List<Object> get props => [];
}
class NotificationConfirmationLoaded extends NotificationConfirmationState{
  final OSNotification notification;

  const NotificationConfirmationLoaded(this.notification);

  @override
  List<Object?> get props => [notification];
}
class NotificationConfirmationError extends NotificationConfirmationState{
  final String message;
  const NotificationConfirmationError(this.message);
  @override
  List<Object?> get props => [message];
}
final class NotificationConfirmationTimeOut extends NotificationConfirmationState{
  @override
  List<Object> get props => [];
}