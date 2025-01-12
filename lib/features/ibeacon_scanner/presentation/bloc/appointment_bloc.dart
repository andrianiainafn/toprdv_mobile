import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/util/map_failure_message.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/usecases/add_appointment.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final AddAppointment addAppointment;
  AppointmentBloc(this.addAppointment) : super(AppointmentInitial()) {
    on<HandleCreateAppointment>((event, emit) async{
      emit(AppointmentLoading());
      final response = await addAppointment(Params(event.brandId,event.date));
      response.fold((failure){
        emit(AppointmentError(mapFailureToMessage(failure)));
      }, (success){
        emit(AppointmentLoaded());
      });
    });
  }
}
