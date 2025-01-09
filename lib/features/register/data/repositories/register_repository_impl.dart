import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/register/data/datasources/register_data_source.dart';
import 'package:my_template_project/features/register/data/datasources/register_mapper.dart';
import 'package:my_template_project/features/register/domain/entity/register.dart';
import 'package:my_template_project/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository{
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, bool>> registerUser(Register register) async{
    try{
      final response = await remoteDataSource.registerUser(register.toModel());
      return Right(response);
    }on ServerFailure{
      return Left(ServerFailure());
    }
  }

}