import 'package:dartz/dartz.dart';

import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/info/data/datasources/info_remote_data_source.dart';

import 'package:my_template_project/features/info/domain/entity/info.dart';

import '../../domain/repositories/info_repository.dart';

class InfoRepositoryImpl implements InfoRepository{
  final InfoRemoteDataSource infoRemoteDataSource;
  InfoRepositoryImpl(this.infoRemoteDataSource);
  @override
  Future<Either<Failure, Info>> getInfo(int userid, int pageNumber) async{
    try{
        final info = await infoRemoteDataSource.fetchInfo(userid, pageNumber);
        return Right(info);
    }on ServerFailure{
      return Left(ServerFailure());
    }
  }

}