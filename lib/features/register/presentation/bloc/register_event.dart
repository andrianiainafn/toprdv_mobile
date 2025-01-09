part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
}
class RegisterUserEvent extends RegisterEvent {
  final Register register;
  const RegisterUserEvent(this.register);
  
  @override
  List<Object?> get props => [register];

}