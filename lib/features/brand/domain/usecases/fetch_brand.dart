
import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/brand/domain/entity/brand.dart';
import 'package:my_template_project/features/brand/domain/repositories/brand_repository.dart';

class FetchBrand implements UseCase<List<Brand>,NoParams>{
  final BrandRepository brandRepository;
  FetchBrand(this.brandRepository);
  @override
  Future<Either<Failure, List<Brand>?>> call(NoParams params) {
    return brandRepository.getBrand();
  }
}