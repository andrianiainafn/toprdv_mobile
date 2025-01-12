import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/brand/domain/entity/related_brand.dart';
import 'package:my_template_project/features/brand/domain/repositories/brand_repository.dart';

class UpdateBrand implements UseCase<List<RelatedBrand>,Params>{
  final BrandRepository repository;
  UpdateBrand(this.repository);
  @override
  Future<Either<Failure, List<RelatedBrand>?>> call(Params params) {
    return repository.updateRelatedBrand(params.relatedBrands);
  }

}

class Params extends Equatable{
  final List<RelatedBrand> relatedBrands;
  const Params(this.relatedBrands);
  @override
  // TODO: implement props
  List<Object?> get props => [relatedBrands];

}