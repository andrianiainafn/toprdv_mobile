part of 'token_bloc.dart';

sealed class TokenState extends Equatable {
  const TokenState();
}

final class TokenInitial extends TokenState {
  @override
  List<Object> get props => [];
}

final class TokenLoaded extends TokenState {
  @override
  List<Object> get props => [];
}
class TokenLoading extends TokenState {
  @override
  List<Object> get props => [];
}
class TokenError extends TokenState {
  final String message;
  const TokenError(this.message);
  @override
  List<Object> get props => [message];
}
