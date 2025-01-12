part of 'appointment_bloc.dart';

sealed class AppointmentEvent extends Equatable {
  const AppointmentEvent();
}
class HandleCreateAppointment extends AppointmentEvent{
  final int brandId;
  final DateTime date;
  const HandleCreateAppointment(this.brandId, this.date);
  @override
  List<Object?> get props => [brandId, date];
}