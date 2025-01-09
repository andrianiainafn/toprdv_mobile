import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/profile/domain/repositories/profile_repository.dart';

import '../entity/profile.dart';

class FetchProfile implements UseCase<Profile,Params>{

  final  ProfileRepository repository;
  const FetchProfile(this.repository);

  @override
  Future<Either<Failure, Profile?>> call(Params params) {
    return repository.getProfile(params.userId);
  }

}

class Params extends Equatable{
  final int userId;
  const Params(this.userId);
  @override
  List<Object?> get props => [userId];

}