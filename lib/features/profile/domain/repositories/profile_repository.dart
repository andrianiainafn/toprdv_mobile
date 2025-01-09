import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';

import '../entity/profile.dart';

abstract class ProfileRepository{
    Future<Either<Failure,Profile>> getProfile(int userid);
}

