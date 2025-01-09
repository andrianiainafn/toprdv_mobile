part of 'token_bloc.dart';

sealed class TokenEvent extends Equatable {
  const TokenEvent();
}

class RegisterTokenEvent extends TokenEvent {
  final String pushToken;
  const RegisterTokenEvent(this.pushToken);
  @override
  List<Object?> get props => [pushToken];

}
