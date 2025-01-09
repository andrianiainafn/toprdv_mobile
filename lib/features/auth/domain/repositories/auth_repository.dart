import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/auth/domain/entity/auth_response.dart';

import '../entity/auth_request.dart';

abstract class AuthRepository{
  Future<Either<Failure,AuthResponse>> login({required String email, required String password});
  Future<Either<Failure,bool>> signup({required AuthRequest authRequest});
  Future<Either<Failure,bool>> registerToken({required String token});
}