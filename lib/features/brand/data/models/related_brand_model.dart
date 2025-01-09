
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/related_brand.dart';

part 'related_brand_model.freezed.dart';
part 'related_brand_model.g.dart';

@freezed
class RelatedBrandModel extends RelatedBrand with _$RelatedBrandModel{
  const factory RelatedBrandModel({
    required final int id,
    required final String brandName,
  })= _RelatedBrandModel;

  factory RelatedBrandModel.fromJson(Map<String,dynamic> json) => _$RelatedBrandModelFromJson(json);
}