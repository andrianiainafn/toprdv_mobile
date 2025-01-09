import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/info/domain/entity/info.dart';
import 'package:my_template_project/features/info/domain/repositories/info_repository.dart';

class GetInfo implements UseCase<Info,Params>{
  final InfoRepository infoRepository;

  const GetInfo(this.infoRepository);
  @override
  Future<Either<Failure, Info?>> call(Params params) {
    return infoRepository.getInfo(params.userId, params.pageNumber);
  }

}

class Params extends Equatable{
  final int userId;
  final int pageNumber;
  const Params(this.userId, this.pageNumber);

  @override
  List<Object?> get props => [];

}