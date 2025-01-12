import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:my_template_project/features/notification/data/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository{
  final NotificationRemoteDataSource remoteDataSource;
  NotificationRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, bool>> changeRank(int appointmentId) async{
    try{
      final response = await remoteDataSource.changeRank(appointmentId);
      return Right(response);
    }on Failure{
      return Left(ServerFailure());
    }
  }

}