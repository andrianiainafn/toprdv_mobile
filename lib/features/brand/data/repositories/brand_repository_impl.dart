import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/brand/data/datasources/brand_remote_data_source.dart';
import 'package:my_template_project/features/brand/data/models/related_brand_mapper.dart';
import 'package:my_template_project/features/brand/domain/entity/brand.dart';
import 'package:my_template_project/features/brand/domain/entity/related_brand.dart';
import '../../domain/repositories/brand_repository.dart';

class BrandRepositoryImpl implements BrandRepository{
  final BrandRemoteDataSource dataSource;
  BrandRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<Brand>>> getBrand() async{
    try{
      final brand = await dataSource.getBrand();
      return Right(brand);
    }on Failure{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RelatedBrand>>> getRelatedBrand() async{
    try{
      final brand = await dataSource.getRelatedBrand();
      return Right(brand);
    }on Failure{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RelatedBrand>>> updateRelatedBrand(List<RelatedBrand> relatedBrands) async{
    try{
      final relatedBrandModels = relatedBrands.map((brand) => brand.toModel()).toList();
      final relatedBrand = await dataSource.updateRelatedBrand(relatedBrandModels);
      return Right(relatedBrand);
    }on Failure{
      return Left(ServerFailure());
    }
  }

}