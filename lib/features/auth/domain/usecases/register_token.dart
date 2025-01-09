import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/auth/domain/repositories/auth_repository.dart';

class RegisterToken implements UseCase<bool,Params>{
  final AuthRepository repository;
  RegisterToken(this.repository);
  @override
  Future<Either<Failure, bool>> call(Params params) {
    return repository.registerToken(token: params.token);
  }

}

class Params extends Equatable{
  final String token;
  const Params(this.token);
  @override
  List<Object?> get props => [];

}