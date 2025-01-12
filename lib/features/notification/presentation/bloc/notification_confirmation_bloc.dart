import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'notification_confirmation_event.dart';
part 'notification_confirmation_state.dart';

class NotificationConfirmationBloc extends Bloc<NotificationConfirmationEvent, NotificationConfirmationState> {
  Timer? _notificationTimer;

  NotificationConfirmationBloc() : super(NotificationConfirmationInitial()) {
    on<HandleNewNotification>((event, emit) {
      _notificationTimer?.cancel();
      emit(NotificationConfirmationLoaded(event.notification));
      _startNotificationTimer();
    });

    on<ConfirmNotification>((event, emit) {
      _notificationTimer?.cancel();
      emit(NotificationConfirmationTimeOut());
    });

    on<TImeOutNotification>((event, emit) {
      emit(NotificationConfirmationTimeOut());
    });
  }
  void _startNotificationTimer() {
    _notificationTimer = Timer(
      const Duration(seconds: 15),
          () => add(TImeOutNotification()),
    );
  }

  @override
  Future<void> close() {
    _notificationTimer?.cancel();
    return super.close();
  }
}
