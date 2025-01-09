part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

final class RegisterLoading extends RegisterState{
  @override
  List<Object> get props => [];
}
final class RegisterLoaded extends RegisterState{
  @override
  List<Object> get props => [];
}
final class RegisterError extends RegisterState{
  final String message;

  const RegisterError(this.message);
  @override
  List<Object> get props => [message];
}
