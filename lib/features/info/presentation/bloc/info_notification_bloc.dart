import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'info_notification_event.dart';
part 'info_notification_state.dart';

class InfoNotificationBloc extends Bloc<InfoNotificationEvent, InfoNotificationState> {
  InfoNotificationBloc() : super(InfoNotificationState(0)) {
    on<NewInfoAdded>((event, emit) {
       emit(InfoNotificationState(state.count+ 1));
    });
    on<ResetInfoNotification>((event, emit) {
      emit(InfoNotificationState(0));
    });
  }
}
