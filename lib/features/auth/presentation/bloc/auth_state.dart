part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Loading extends AuthState{
  @override
  List<Object?> get props => [];
}

class Empty extends AuthState {
  @override
  List<Object> get props => [];
}

class Loaded extends AuthState{
  @override
  List<Object?> get props => [];
}

class ErrorState extends AuthState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
