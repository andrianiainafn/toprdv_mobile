import 'package:my_template_project/features/brand/data/models/related_brand_model.dart';
import 'package:my_template_project/features/brand/domain/entity/related_brand.dart';

extension RelatedBrandMapper on RelatedBrand{
  RelatedBrandModel toModel(){
    return RelatedBrandModel(id: id, brandName: brandName);
  }
}