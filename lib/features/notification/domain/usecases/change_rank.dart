import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/notification/data/repositories/notification_repository.dart';

class ChangeRank implements UseCase<bool,Params>{
  final NotificationRepository repository;
  ChangeRank(this.repository);
  @override
  Future<Either<Failure, bool?>> call(Params params) async{
    return await repository.changeRank(params.appointmentId);
  }
}

class Params extends Equatable{
  final int appointmentId;
  const Params(this.appointmentId);
  @override
  List<Object?> get props => [appointmentId];
}