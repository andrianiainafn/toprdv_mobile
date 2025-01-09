part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}
class Login extends AuthEvent {
  final String email;
  final String password;
  const Login(this.email, this.password);
  @override
  List<Object?> get props => [];
}
class LogoutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
class Signup extends AuthEvent {
  final AuthRequest authRequest;
  const Signup(this.authRequest);
  @override
  List<Object?> get props => [authRequest];
}