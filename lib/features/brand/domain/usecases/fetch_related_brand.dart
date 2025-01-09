import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/brand/domain/entity/related_brand.dart';

import '../repositories/brand_repository.dart';

class FetchRelatedBrand implements UseCase<List<RelatedBrand>,NoParams>{
  final BrandRepository repository;
  const FetchRelatedBrand(this.repository);
  @override
  Future<Either<Failure, List<RelatedBrand>>> call(NoParams params) async{
    return await repository.getRelatedBrand();
  }

}