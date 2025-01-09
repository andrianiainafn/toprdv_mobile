import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/util/map_failure_message.dart';
import 'package:my_template_project/features/auth/domain/usecases/register_token.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  final RegisterToken useCase;
  TokenBloc(this.useCase) : super(TokenInitial()) {
    on<RegisterTokenEvent>(_onRegisterToken);
  }

  Future<void> _onRegisterToken(RegisterTokenEvent event,Emitter<TokenState> emit)async{
    emit(TokenLoading());
    final response = await useCase(Params(event.pushToken));
    response.fold((failure){
      emit(TokenError(mapFailureToMessage(failure)));
    }, (success){
      emit(TokenLoaded());
    });
  }
}
