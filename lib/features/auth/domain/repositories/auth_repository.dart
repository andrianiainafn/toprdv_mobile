import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/auth/domain/entity/auth_response.dart';

abstract class AuthRepository{
  Future<Either<Failure,AuthResponse>> login({required String email, required String password});
  Future<Either<Failure,void>> signup({required String email, required String password});
}