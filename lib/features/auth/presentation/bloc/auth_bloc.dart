import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/auth/domain/entity/auth_request.dart';
import 'package:my_template_project/features/auth/domain/usecases/login.dart';
import 'package:my_template_project/features/auth/domain/usecases/signup.dart';
import '../../../../core/util/map_failure_message.dart';
import '../../domain/usecases/logout.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase login;
  final Logout logout;
  final SignupUseCase signup;
  AuthBloc(this.login,this.logout,this.signup) : super(AuthInitial()) {
    on<Login>(_onLogin);
    on<Signup>(_onSignUp);
    on<LogoutEvent>(_onLogout);
  }
  Future<void> _onLogin(Login event, Emitter<AuthState> emit)async {
    emit(Loading());
    final response = await login(Params(email: event.email, password: event.password));
    response.fold((failure){
      emit(ErrorState(message:mapFailureToMessage(failure) ));
    }, (authResponse) async {
      emit(Loaded());
    });
  }

  Future<void> _onSignUp(Signup event, Emitter<AuthState> emit)async{
    emit(Loading());
    final response = await signup(SignupParams(event.authRequest));
    response.fold((failure){
      emit(ErrorState(message:mapFailureToMessage(failure) ));
    }, (success){
      emit(Loaded());
    });
  }
  Future<void> _onLogout(LogoutEvent event,Emitter<AuthState> emit)async{
    emit(Loading());
    final response = await logout(NoParams());
    response.fold((failure){
      emit(ErrorState(message:mapFailureToMessage(failure) ));
    }, (success){
      emit(Loaded());
    });
  }
}
