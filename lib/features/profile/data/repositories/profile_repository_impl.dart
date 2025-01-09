import 'package:dartz/dartz.dart';

import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/profile/data/datasources/profile_remote_data_source.dart';

import 'package:my_template_project/features/profile/data/models/profile_model.dart';

import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileRemoteDataSource dataSource;

  const ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, ProfileModel>> getProfile(int userId) async{
    try {
      final response = await dataSource.getProfileModel(userId);
      return Right(response);
    }on Failure{
      return Left(ServerFailure());
    }
  }

}