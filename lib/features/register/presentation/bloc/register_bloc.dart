import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/util/map_failure_message.dart';
import 'package:my_template_project/features/register/domain/entity/register.dart';
import 'package:my_template_project/features/register/domain/usecases/register_user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUser registerUser;
  RegisterBloc(this.registerUser) : super(RegisterInitial()) {
    on<RegisterUserEvent>(_onRegisterUser);
  }

  Future<void> _onRegisterUser(RegisterUserEvent event,Emitter<RegisterState> emit)async{
    emit(RegisterLoading());
    final response  = await registerUser(Params(event.register));
    response.fold((failure){
      emit(RegisterError(mapFailureToMessage(failure)));
    },(success){
      emit(RegisterLoaded());
    });
  }
}
