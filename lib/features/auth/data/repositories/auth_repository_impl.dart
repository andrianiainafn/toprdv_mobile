
import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:my_template_project/features/auth/domain/entity/auth_response.dart';
import 'package:my_template_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository{
  final SharedPreferences sharedPreferences;
  final AuthRemoteDataSource authRemoteDataSource;

   AuthRepositoryImpl({required this.sharedPreferences,required this.authRemoteDataSource});
  @override
  Future<Either<Failure, AuthResponse>> login({required String email, required String password}) async{
    try{
      final authResponse = await authRemoteDataSource.login(email, password);
      await sharedPreferences.remove('access_token');
      await sharedPreferences.remove('appUserId');
      await sharedPreferences.setString('access_token', authResponse.token);
      await sharedPreferences.setString('appUserId', authResponse.appUserId.toString());
      return Right(authResponse);
    }on ServerFailure{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signup({required String email, required String password}) {
    // TODO: implement signup
    throw UnimplementedError();
  }

}