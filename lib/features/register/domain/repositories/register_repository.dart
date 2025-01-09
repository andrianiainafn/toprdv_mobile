import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/register/domain/entity/register.dart';

abstract class RegisterRepository {
    Future<Either<Failure,bool>> registerUser(Register register);
}