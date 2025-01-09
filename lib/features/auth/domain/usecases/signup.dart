import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/auth/domain/entity/auth_request.dart';
import 'package:my_template_project/features/auth/domain/repositories/auth_repository.dart';

class SignupUseCase implements UseCase<bool,SignupParams>{

  final AuthRepository authRepository;
  SignupUseCase(this.authRepository);

  @override
  Future<Either<Failure, bool?>> call(SignupParams params) {
    return authRepository.signup(authRequest: params.authRequest);
  }

}
class SignupParams extends Equatable{
  final AuthRequest authRequest;
  const SignupParams(this.authRequest);
  @override
  List<Object?> get props => [authRequest];

}