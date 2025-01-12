import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';

abstract class NotificationRepository{
  Future<Either<Failure,bool>> changeRank(int appointmentId);
}