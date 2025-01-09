
import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/info/domain/entity/info.dart';

abstract class InfoRepository{
  Future<Either<Failure,Info>> getInfo(int userid,int pageNumber);
}