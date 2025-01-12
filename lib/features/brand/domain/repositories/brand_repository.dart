
import 'package:dartz/dartz.dart';
import 'package:my_template_project/features/brand/domain/entity/brand.dart';
import 'package:my_template_project/features/brand/domain/entity/related_brand.dart';
import '../../../../core/error/failure.dart';

abstract class BrandRepository{
    Future<Either<Failure,List<Brand>>> getBrand();
    Future<Either<Failure,List<RelatedBrand>>>  getRelatedBrand();
    Future<Either<Failure,List<RelatedBrand>>> updateRelatedBrand(List<RelatedBrand> relatedBrand);

}