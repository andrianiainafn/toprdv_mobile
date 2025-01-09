import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/register/domain/entity/register.dart';
import 'package:my_template_project/features/register/domain/repositories/register_repository.dart';


class RegisterUser implements UseCase<void,Params>{
  RegisterRepository repository;

  RegisterUser(this.repository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return repository.registerUser(params.register);
  }

}

class Params extends Equatable{
  final Register register;
  const Params(this.register);
  @override
  List<Object?> get props => [];

}