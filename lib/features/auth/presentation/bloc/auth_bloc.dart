import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/features/auth/domain/usecases/login.dart';

import '../../../../core/util/map_failure_message.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase login;
  AuthBloc(this.login) : super(AuthInitial()) {
    on<Login>(_onLogin);
    on<Signup>(_onSignUp);
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

  }
}
