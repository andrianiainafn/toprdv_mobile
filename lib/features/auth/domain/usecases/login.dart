

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/auth/domain/entity/auth_response.dart';
import 'package:my_template_project/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<AuthResponse,Params>{
  final AuthRepository repository;
  const LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResponse?>> call(Params params) async{
    return await repository.login(email: params.email, password: params.password);
  }
}

class Params extends Equatable{
  final String email;
  final String password;
  const Params({required this.email, required this.password});
  @override
  List<Object?> get props => [email,password];

}